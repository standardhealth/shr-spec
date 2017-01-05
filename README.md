# The Standard Health Record (SHR)

The Standard Health Record Initiative is working to create a single, high-quality health record for every individual in the United States.  For more information, see [standardhealthrecord.org](http://standardhealthrecord.org/).

This GitHub repository represents an evolving computable definition of the Standard Health Record and its contents.  It represents SHR namespaces,elements, valusets, and mappings via the SIMPL format, as formally defined in [shr-grammar](https://github.com/standardhealth/shr-grammar).  The SHR definitions (and SIMPL format) are works in progress and subject to change.

# Related Projects

There are a number of projects based on the SHR, but the following projects are most closely related to the SIMPL definitional files:
* [shr-grammar](https://github.com/standardhealth/shr-grammar): The formal [ANTLR4](http://www.antlr.org/) grammar definition for the SHR format
* [shr-text-import](https://github.com/standardhealth/shr-text-import): ES6 library for importing SIMPL files into ES6 models using the ANTLR4 grammar.
* [shr-cli](https://github.com/standardhealth/shr-cli): A [Node.js](https://nodejs.org/)-based command-line tool for importing a folder of SIMPL files and exporting into other formats.  This is particularly useful to SHR authors since it will report out any errors in the definition files.