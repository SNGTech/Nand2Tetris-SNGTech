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
        } catch (Exception e) {
            throw new Exception("Failed to parse. Reason: Supplied file is not a valid Hack file!", e);
        }
    }

    public int parseA_Instruction() {
        return Integer.parseInt(this.currentLine.replace("@", ""));
    }

    public String parseC_Instruction_Control() {
        String comp = "0";
        int startIndex = 0, endIndex = this.currentLine.length();

        // Control
        if (this.currentLine.contains("=")) {
            startIndex = this.currentLine.indexOf("=") + 1;
        }
        if (this.currentLine.contains(";")) {
            endIndex = this.currentLine.indexOf(";");
        }
        comp = this.currentLine.substring(startIndex, endIndex).strip();
        return comp;
    }

    public String parseC_Instruction_Dest() {
        String dest = null;

        // Dest
        if (this.currentLine.contains("=")) {
            dest = this.currentLine.substring(0, this.currentLine.indexOf("="));
        }
        return dest;
    }

    public String parseC_Instruction_Jump() {
        String jmp = null;

        // Jump
        if (this.currentLine.contains(";")) {
            jmp = this.currentLine.substring(this.currentLine.indexOf(";") + 1).strip();
        }
        return jmp;
    }

    // Read the new line, removing all trailing and leading spaces (advance to)
    // Terminates line (null)
    public String readNextLine() throws IOException {
        this.currentLine = this.br.readLine();
        return this.currentLine == null ? null : this.currentLine.strip();
    }

    // Reads current line and filters out any in-line comments
    // Ignores pseudo-commands/comments
    public String removeCommentsFromLine() {
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

    public void addLine() {
        this.builder.append(this.currentLine).append("\n");
    }

    // DEBUG: For testing purposes
    public String getParsedCommands() {
        return builder.toString();
    }
}
