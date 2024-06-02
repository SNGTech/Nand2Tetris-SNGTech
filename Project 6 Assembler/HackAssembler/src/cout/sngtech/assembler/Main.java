package cout.sngtech.assembler;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

public class Main {

    private static final ArrayList<String> asmCode = new ArrayList<>();
    private static final StringBuilder hackCode = new StringBuilder();

    public static void main(String[] args) throws Exception {
        System.out.println("Creating parser...");

        Parser parser = new Parser(args[0]);
        Encoder encoder = new Encoder();
        SymbolTable symbolTable = new SymbolTable();

        System.out.println("Reading assembly file...");

        // First-pass
        // Remove comments and deal with Labels
        while ((parser.readNextLine()) != null) {
            String newLine = parser.removeCommentsFromLine();
            if (newLine.isBlank()) continue;

            if (newLine.startsWith("(")) {
                // Label Pseudo Command
                parser.parse_Label(symbolTable);
                continue;
            }

            asmCode.add(newLine);
        }

        // Second-pass
        // Deal with variables and encoding
        for (String newLine : asmCode) {
            parser.setNewCurrentLine(newLine);
            if (newLine.startsWith("@")) {
                // A-Instruction
                int address = parser.parseA_Instruction(symbolTable);
                String address_Bin = encoder.encodeA_Instruction(address);
                String instruction_A = ("0000000000000000").substring(address_Bin.length()) + address_Bin;
                hackCode.append(instruction_A).append("\n");
            }
            else {
                // C-Instruction
                String dest = parser.parseC_Instruction_Dest();
                String comp = parser.parseC_Instruction_Comp();
                String jmp = parser.parseC_Instruction_Jump();

                String dest_Bin = encoder.encodeC_Instruction_Dest(dest);
                String comp_Bin = encoder.encodeC_Instruction_Comp(comp);
                String jmp_Bin = encoder.encodeC_Instruction_Jump(jmp);
                hackCode.append("111").append(comp_Bin).append(dest_Bin).append(jmp_Bin).append("\n");
            }
        }

        File hackFile = new File(args[0].replace("/", "/encoded/").replace(".asm", ".hack"));
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(hackFile))) {
            writer.append(hackCode);
        }
        System.out.println("Successfully parsed Assembly File to Machine Language");
    }
}
