package cout.sngtech.assembler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class Parser {
    BufferedReader br;
    StringBuilder builder = new StringBuilder(); // DEBUG: For testing purposes

    String currentLine = "";

    public Parser(String fileName) throws Exception {
        File hackFile = new File(fileName);
        try {
            this.br = new BufferedReader(new FileReader((hackFile)));
            this.parseAll();
        } catch (Exception e) {
            throw new Exception("Failed to parse. Reason: Supplied file is not a valid Hack file!", e);
        }
    }

    // Read continuously
    private void parseAll() throws IOException {
        while ((this.currentLine = this.readNextLine()) != null) {
            String newLine = this.removeCommentsFromLine();
            if (newLine.isBlank()) continue;
            // A-Instruction
            if (this.currentLine.startsWith("@")) {
                newLine = parseA_Instruction();
            } else {
                // C-Instruction
                newLine = parseC_Instruction();
            }
            this.addLine();
        }
    }

    private int parseA_Instruction() {
        return Integer.parseInt(this.currentLine.replace("@", ""));
    }

    private String parseC_Instruction() {
        int address = Integer.parseInt(this.currentLine.replace("@", ""));
        return Integer.toBinaryString(address);
    }

    // Read the new line, removing all trailing and leading spaces (advance to)
    // Terminates line (null)
    private String readNextLine() throws IOException {
        this.currentLine = this.br.readLine();
        return this.currentLine == null ? null : this.currentLine.strip();
    }

    // Reads current line and filters out any in-line comments
    // Ignores pseudo-commands/comments
    private String removeCommentsFromLine() {
        String validLine;
        int commentIndex = this.currentLine.indexOf("//");
        // Remove all comments
        if (commentIndex != -1) {
            validLine = this.currentLine.substring(0, commentIndex);
        } else {
            validLine = this.currentLine;
        }

        this.currentLine = validLine;
        return validLine;
    }

    private void addLine() {
        this.builder.append(this.currentLine).append("\n");
    }

    // DEBUG: For testing purposes
    public String getParsedCommands() {
        return builder.toString();
    }
}
