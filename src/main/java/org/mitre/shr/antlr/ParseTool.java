package org.mitre.shr.antlr;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.stream.Stream;

/**
* A simple wrapper around the ANTLR4 parser that will print parse errors to the console.
*/
public class ParseTool {
    public static void main(String[] args) throws IOException {
        if (args.length != 1) {
            System.err.println("Must provide exactly one path to a folder or file");
        }

        parsePath(Paths.get(args[0]));
    }

    private static void parsePath(Path path) {
        if (path.toFile().isDirectory()) {
            parseDirectory(path);
        } else {
            parseFile(path);
        }
    }

    private static void parseDirectory(Path path) {
        try {
            Files.walk(path).forEach(ParseTool::parseFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void parseFile(Path path) {
        if (path.toFile().isDirectory()) {
            return;
        }

        System.out.printf("\nParsing %s\n", path.toString());
        if (path.toString().endsWith("_cp.txt")) {
            System.out.println("SKIPPED: Content Profiles not supported.");
            return;
        } else if (!path.toString().endsWith(".txt")) {
            System.out.println("SKIPPED: Only .txt files supported.");
            return;
        }

        try {
            InputStream is = Files.newInputStream(path, StandardOpenOption.READ);
            ANTLRInputStream input = new ANTLRInputStream(is);
            SHRLexer lexer = new SHRLexer(input);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            tokens.fill();
            SHRParser parser = new SHRParser(tokens);
            parser.setBuildParseTree(true);
            parser.shr();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
