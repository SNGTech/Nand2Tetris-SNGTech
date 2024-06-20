package cout.sngtech.vmtranslator;

import java.io.*;

public class CodeWriter {

    private final File asmFile;
    private final StringBuilder asmBuilder;

    public CodeWriter(File asmFile) {
        this.asmFile = asmFile;
        this.asmBuilder = new StringBuilder();
    }

    public void writeArithmetic(String command) {
        switch (command) {
            case "add":
                this.asmBuilder
                        .append("// add")
                        .append(CommandTemplate.ARITHMETIC_TWO)
                        .append("M=D+M")
                        .append(CommandTemplate.PUSH);
                break;
            case "sub":
                this.asmBuilder
                        .append("// sub")
                        .append(CommandTemplate.ARITHMETIC_TWO)
                        .append("M=D-M")
                        .append(CommandTemplate.PUSH);
                break;
            case "neg":
                this.asmBuilder
                        .append("// neg")
                        .append(CommandTemplate.NEG)
                        .append(CommandTemplate.PUSH);
        }
    }

    public void writePush(String memorySegment, String index) {

    }

    public void writePop(String memorySegment, String index) {

    }

    public void writeToAsmFile() throws IOException {
        BufferedWriter bw = new BufferedWriter(new FileWriter(this.asmFile));
        bw.write(this.asmBuilder.toString());
        bw.close();
    }

    public static class CommandTemplate {
        public static final String PUSH = """
                @SP
                M=M+1
                """;
        public static final String POP = """
                @SP
                M=M-1
                """;
        public static final String NEG = """
                @SP
                M=M-1
                A=M
                M=-M
                """;
        public static final String ARITHMETIC_TWO = """
                @SP
                M=M-1
                M=M-1
                A=M
                D=M
                @SP
                M=M+1
                A=M
                """;
    }
}
