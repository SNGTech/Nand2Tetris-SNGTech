package cout.sngtech.assembler;

import java.util.HashMap;

public class Encoder {

    private HashMap<String, String> destTable = new HashMap<>();
    private HashMap<String, String> compTable = new HashMap<>();
    private HashMap<String, String> jmpTable = new HashMap<>();

    public Encoder() {
        destTable.put(null, "000");
        destTable.put("M", "001");
        destTable.put("D", "010");
        destTable.put("MD", "011");
        destTable.put("A", "100");
        destTable.put("AM", "101");
        destTable.put("AD", "110");
        destTable.put("AMD", "111");

        compTable.put("0", "101010");
        compTable.put("1", "111111");
        compTable.put("-1", "111010");
        compTable.put("D", "001100");
        compTable.put("A", "110000");
        compTable.put("!D", "001101");
        compTable.put("!A", "110001");
        compTable.put("-D", "001111");
        compTable.put("-A", "110011");
        compTable.put("D+1", "011111");
        compTable.put("A+1", "110111");
        compTable.put("D-1", "001110");
        compTable.put("A-1", "110010");
        compTable.put("D+A", "000010");
        compTable.put("D-A", "010011");
        compTable.put("A-D", "000111");
        compTable.put("D&A", "000000");
        compTable.put("D|A", "010101");

        jmpTable.put(null, "000");
        jmpTable.put("JGT", "001");
        jmpTable.put("JEQ", "010");
        jmpTable.put("JGE", "011");
        jmpTable.put("JLT", "100");
        jmpTable.put("JNE", "101");
        jmpTable.put("JLE", "110");
        jmpTable.put("JMP", "111");
    }

    public String encodeA_Instruction(int address) {
        return "0" + Integer.toBinaryString(address);
    }

    public String encodeC_Instruction_Dest(String dest) {
        return destTable.get(dest);
    }

    public String encodeC_Instruction_Comp(String comp) {
        int a = 0;

        if (comp.contains("M")){
            a = 1;
            comp = comp.replace("M", "A");
        }

        return a + compTable.get(comp);
    }

    public String encodeC_Instruction_Jump(String jmp) {
        return jmpTable.get(jmp);
    }
}
