package cout.sngtech.assembler;

import java.util.HashMap;

public class SymbolTable {

    private final HashMap<String, Integer> symbolTable = new HashMap<>();

    private int varCount;
    private int labelCount;

    public SymbolTable() {
        this.varCount = 0;

        for (int i = 0; i < 16; i++) {
            symbolTable.put("R" + i, i);
        }
        symbolTable.put("SCREEN", 16384);
        symbolTable.put("KBD", 24576);
        symbolTable.put("SP", 0);
        symbolTable.put("LCL", 1);
        symbolTable.put("ARG", 2);
        symbolTable.put("THIS", 3);
        symbolTable.put("THAT", 4);
    }

    public void addLabelToTable(String label, int lineNo) {
        if (!symbolTable.containsKey(label)) {
            symbolTable.put(label, lineNo + 1);
        }
    }

    public void addVarToTable(String var) {
        if (!symbolTable.containsKey(var)) {
            symbolTable.put(var, 16 + this.varCount);
            varCount++;
        }
    }

    public int getVarLineNo(String var) {
        this.addVarToTable(var);
        return symbolTable.get(var);
    }
}
