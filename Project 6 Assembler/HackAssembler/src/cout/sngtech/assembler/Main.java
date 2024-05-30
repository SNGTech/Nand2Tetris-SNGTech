package cout.sngtech.assembler;

public class Main {

    public static void main(String[] args) throws Exception {
        Parser parser = new Parser(args[0]);
        System.out.println(parser.getParsedCommands());
    }
}
