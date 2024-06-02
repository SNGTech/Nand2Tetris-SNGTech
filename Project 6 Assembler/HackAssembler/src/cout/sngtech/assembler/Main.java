package cout.sngtech.assembler;

public class Main {

    public static void main(String[] args) throws Exception {
        Parser parser = new Parser(args[0]);

        while ((parser.readNextLine()) != null) {
            String newLine = parser.removeCommentsFromLine();
            if (newLine.isBlank()) continue;
            // A-Instruction
            if (newLine.startsWith("@")) {
                newLine = String.valueOf(parser.parseA_Instruction());
            } else {
                // C-Instruction
                String dest = parser.parseC_Instruction_Dest();
                String comp = parser.parseC_Instruction_Control();
                String jmp = parser.parseC_Instruction_Jump();
                newLine = dest + " | " + comp + " | " + jmp;
            }
            parser.addLine();
            System.out.println(newLine);
        }
        System.out.println(parser.getParsedCommands());
    }
}
