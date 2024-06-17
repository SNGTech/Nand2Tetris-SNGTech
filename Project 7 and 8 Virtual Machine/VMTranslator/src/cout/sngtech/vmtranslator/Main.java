package cout.sngtech.vmtranslator;

import java.io.File;
import java.io.IOException;

public class Main {

    public static void main(String[] args) throws IOException {
        File vmFile = new File("res\\" + args[0]);
        File asmFile = new File("res\\translated\\" + args[0].replace(".vm", ".asm"));
        Parser parser = new Parser(vmFile);
        CodeWriter writer = new CodeWriter(asmFile);

        while (true) {
            parser.nextCommand();
            if (!parser.hasMoreCommands()) break;

            String arg1 = parser.getArg1();
            String arg2 = parser.getArg2();

            switch (parser.getCommandType()) {
                case C_ARITHMETIC -> writer.writeArithmetic(arg1);
                case C_PUSH -> writer.writePush(arg1, arg2);
                case C_POP -> writer.writePop(arg1, arg2);
            }

            System.out.println(parser.getCommandType().toString() + ": " + arg1 + " " + arg2);
        }

        parser.close();
        //writer.writeToAsmFile();
    }
}
