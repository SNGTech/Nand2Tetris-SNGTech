package cout.sngtech.assembler;

public class Code {

    public static String encodeA_Instruction(int address) {
        return "0" + Integer.toBinaryString(address);
    }

    public static String encodeC_Instruction_Dest(String dest) {

    }

    public static String encodeC_Instruction_Control(String comp) {

    }

    public static String encodeC_Instruction_Jump(String jmp) {

    }
}
