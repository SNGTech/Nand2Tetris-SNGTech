package cout.sngtech.assembler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class Parser {
    BufferedReader br;

    String currentLine;
    int scanLineNo;

    public Parser(String fileName) throws Exception {
        this.currentLine = "";
        this.scanLineNo = -1;

        File hackFile = new File(fileName);
        try {
            this.br = new BufferedReader(new FileReader((hackFile)));
        } catch (Exception e) {
            throw new Exception("Failed to parse. Reason: Supplied file is not a valid Hack file!", e);
        }
    }

    public void parse_Label(SymbolTable symbolTable) {
        String label = this.currentLine.substring(1, this.currentLine.length() - 1);
        symbolTable.addLabelToTable(label, this.scanLineNo);
    }

    public int parseA_Instruction(SymbolTable symbolTable) {
        String address = this.currentLine.replace("@", "");
        int lineNo = 0;

        if (!Character.isDigit(address.charAt(0))) {
            // If is variable
            lineNo = symbolTable.getVarLineNo(address);
        } else {
            lineNo = Integer.parseInt(address);
        }
        return lineNo;
    }

    public String parseC_Instruction_Comp() {
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
        if (this.currentLine == null) {
            return null;
        }
        if (!this.currentLine.strip().startsWith("(")
                && !this.currentLine.strip().startsWith("//")
                && !this.currentLine.isBlank())
            scanLineNo++;
        return this.currentLine.strip();
    }

    public void setNewCurrentLine(String newLine) {
        this.currentLine = newLine;
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

        this.currentLine = validLine.strip();
        return validLine.strip();
    }
}
