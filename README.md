# The Standard Health Record (SHR)

The Standard Health Record Initiative is working to create a single, high-quality health record for every individual in the United States.  For more information, see [standardhealthrecord.org](http://standardhealthrecord.org/).

This GitHub repository represents an evolving computable definition of the Standard Health Record and its contents.  It represents SHR entries and data elements via a custom [ANTLR4](http://www.antlr.org/) grammar designed to be both author-friendly and machine-readable.  The custom grammar and SHR definitions are works in progress and subject to change.

# Project Structure

    ├── build            # contains build artifacts (temporary)
    ├── gradle           # contains files needed by the gradle wrapper build system
    ├── spec             # contains SHR specification definitions
    └── src
        ├── generated    # contains ANTLR-generated Java parser/lexer code
        ├── main
        │   ├── antlr    # contains ANTLR .g4 files defining the SHR spec grammar
        │   └── java     # contains simple utility for parsing an SHR spec definition
        └── test

# Building the Project

Building this project will compile the SHR lexer and parser grammars into Java lexer\parser libraries and a simple application that can create the parse tree for a given SHR definition file.

This project uses the [Gradle](http://www.gradle.org/) build system.  A gradle wrapper, which automatically downloads and uses an instance of gradle, is provided for convenience.  To build the project, install the [Java SE Development Kit 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) (a.k.a. JDK 1.8), clone this repository, then execute this command from within this directory:

    ./gradlew build

To clean up the build artifacts:

    ./gradlew clean

# Executing the SHR Parse Tree Application

The parse tree application is a simple utility that reads an SHR definition file and creates a grahical parse tree representing that file.  It's not very useful to end users, but is a useful tool for debugging the SHR grammars and definition files.

To execute the sample code using `gradlew`, you should execute the `run` command:

    ./gradlew run

This will execute the parse tree application on the SHR definition configured in the `gradle.build` file.

To execute the parse tree on an arbitrary SHR definition file, you must first use gradle to generate a script:

    ./gradlew installDist

Then execute the generated script, passing in a path to an SHR definition file:

    ./build/install/shr_spec/bin/shr_spec ./spec/shr_name.txt
