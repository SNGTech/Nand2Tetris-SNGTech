package cout.sngtech.vmtranslator;

import java.io.*;
import java.util.Arrays;

public class Parser {

    public enum COMMAND_TYPE {
        C_ARITHMETIC,
        C_PUSH,
        C_POP,
        C_LABEL,
        C_GOTO,
        C_IF,
        C_FUNCTION,
        C_RETURN,
        C_CALL
    }

    private final String[] KEYWORDS = new String[] {
            "add",
            "sub",
            "neg",
            "eq",
            "gt",
            "lt",
            "and",
            "or",
            "not"
    };

    private BufferedReader br;
    private String currentCommand = "";

    public Parser(File vmFile) {
        try {
            this.br = new BufferedReader(new FileReader(vmFile));
        } catch(FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void nextCommand() throws IOException {
        String next;
        // Read until next command is a well-formed command (not a command, empty line or end-of-stream)
        do {
            next = this.br.readLine();
            if (next != null && next.contains("//")) {
                next = next.substring(0, next.indexOf("//"));
            }
        } while (next != null && next.isBlank());
        this.currentCommand = next == null ? null : next.strip();
    }

    public boolean hasMoreCommands() {
        return this.currentCommand != null;
    }

    public COMMAND_TYPE getCommandType() {
        String arg0 = this.getArg_n(0);

        // Arithmetic
        if (Arrays.asList(KEYWORDS).contains(this.currentCommand)) {
            return COMMAND_TYPE.C_ARITHMETIC;
        }
        // Memory Access
        else if (arg0.equals("push")) {
            return COMMAND_TYPE.C_PUSH;
        }
        else if (arg0.equals("pop")) {
            return COMMAND_TYPE.C_POP;
        }
        // Branching
        else if (arg0.equals("label")) {
            return COMMAND_TYPE.C_LABEL;
        }
        else if (arg0.equals("goto")) {
            return COMMAND_TYPE.C_GOTO;
        }
        else if (arg0.equals("if-goto")) {
            return COMMAND_TYPE.C_IF;
        }
        // Function
        else if (arg0.equals("function")) {
            return COMMAND_TYPE.C_FUNCTION;
        }
        else if (arg0.equals("call")) {
            return COMMAND_TYPE.C_CALL;
        }
        else if (this.currentCommand.equals("return")) {
            return COMMAND_TYPE.C_RETURN;
        }
        // Default Case (Should never occur unless VM File is malformed)
        else {
            return null;
        }
    }

    public String getArg1() {
        COMMAND_TYPE type = this.getCommandType();

        if (type == COMMAND_TYPE.C_ARITHMETIC) {
            return this.currentCommand;
        }
        else if (type != COMMAND_TYPE.C_RETURN) {
            return this.getArg_n(1);
        }
        else {
            return null;
        }
    }

    public String getArg2() {
        COMMAND_TYPE type = this.getCommandType();

        if (type == COMMAND_TYPE.C_PUSH ||
            type == COMMAND_TYPE.C_POP ||
            type == COMMAND_TYPE.C_FUNCTION ||
            type == COMMAND_TYPE.C_CALL) {
            return this.getArg_n(2);
        } else {
            return null;
        }
    }

    private String getArg_n(int n) {
        return this.currentCommand.split(" ")[n];
    }

    public void close() throws IOException {
        this.br.close();
    }
}
