package org.mitre.shr.antlr;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
* A simple wrapper around the ANTLR4 testrig.
*/
public class ParseTreeTool {
    public static void main(String[] args) throws IOException {
        String inputFile = null;
        if (args.length > 0) {
            inputFile = args[0];
        }
        InputStream is = System.in;
        if (inputFile != null) {
            is = new FileInputStream(inputFile);
        }
        ANTLRInputStream input = new ANTLRInputStream(is);
        org.mitre.shr.antlr.SHRLexer lexer = new org.mitre.shr.antlr.SHRLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        tokens.fill();
        SHRParser parser = new SHRParser(tokens);
        parser.setBuildParseTree(true);
        ParserRuleContext tree = parser.shr();
        tree.inspect(parser);
    }
}
