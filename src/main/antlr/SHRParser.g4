parser grammar SHRParser;

options { tokenVocab=SHRLexer; }

/***********************************************************************************************************************
 * SHR SPECIFICATION DOCUMENT
 **********************************************************************************************************************/

shr:                        namespaceHeader section+;
namespaceHeader:            HASHES namespace HASHES;
namespace:                  ALPHNUMERICWORD | DOTSEPARATEDWORDS;
section:                    entrySection | dataElementSection;
entrySection:               entrySectionHeader entryDefinition*;
entrySectionHeader:         EQUALS ENTRIES EQUALS;
entryDefinition:            entryHeader entryContents;
entryHeader:                DASHES ALPHNUMERICWORD DASHES;
dataElementSection:         dataElementSectionHeader dataElementDefinition*;
dataElementSectionHeader:   EQUALS DATA_ELEMENTS EQUALS;
dataElementDefinition
    : compositionDataElementDefinition
    | dateDataElementDefinition
    | enumDataElementDefinition
    | periodDataElementDefinition
    | profilesDataElementDefinition
    | textDataElementDefinition;

/***********************************************************************************************************************
 * SHR ENTRIES
 **********************************************************************************************************************/

entryContents
    : (titleProperty | descriptionProperty | containsProperty | akaProperty | constraintsProperty | sourcesProperty)+;

/***********************************************************************************************************************
 * SHR DATA ELEMENTS
 **********************************************************************************************************************/

// COMPOSITION Data Element

compositionDataElementDefinition:   compositionDataElementHeader compositionDataElementContents;
compositionDataElementHeader:       DASHES ALPHNUMERICWORD COMPOSITION_TYPE DASHES;
compositionDataElementContents
    : (titleProperty | descriptionProperty | choiceProperty | containsProperty | akaProperty | sourcesProperty)+;

// DATE Data Element

dateDataElementDefinition:          dateDataElementHeader dateDataElementContents;
dateDataElementHeader:              DASHES ALPHNUMERICWORD DATE_TYPE DASHES;
dateDataElementContents:            (titleProperty | descriptionProperty | akaProperty | sourcesProperty)+;

// ENUM Data Element

enumDataElementDefinition:          enumDataElementHeader enumDataElementContents;
enumDataElementHeader:              DASHES ALPHNUMERICWORD ENUM_TYPE DASHES;
enumDataElementContents
    : (titleProperty | descriptionProperty | valuesProperty | akaProperty | sourcesProperty)+;

// PERIOD Data Element

periodDataElementDefinition:        periodDataElementHeader periodDataElementContents;
periodDataElementHeader:            DASHES ALPHNUMERICWORD PERIOD_TYPE DASHES;
periodDataElementContents:          (titleProperty | descriptionProperty | akaProperty | sourcesProperty)+;

// PROFILES Data Element

profilesDataElementDefinition:      profilesDataElementHeader profilesDataElementContents;
profilesDataElementHeader:          DASHES ALPHNUMERICWORD PROFILES_TYPE reference DASHES;
profilesDataElementContents
    : (titleProperty | descriptionProperty | choiceProperty | containsProperty | valuesProperty | akaProperty | sourcesProperty)+;

// TEXT Data Element

textDataElementDefinition:          textDataElementHeader textDataElementContents;
textDataElementHeader:              DASHES ALPHNUMERICWORD TEXT_TYPE DASHES;
textDataElementContents:            (titleProperty | descriptionProperty | akaProperty | sourcesProperty)+;

/***********************************************************************************************************************
 * DATA ELEMENT AND ENTRY PROPERTIES
 **********************************************************************************************************************/

akaProperty:            AKA_PROP (CODESYSTEM CODE ','?)+;
titleProperty:          TITLE_PROP STRING;
descriptionProperty:    DESCRIPTION_PROP STRING;
valuesProperty:         VALUE_PROP (CODE (DISPLAYED_AS STRING)? ','?)+;
sourcesProperty:        SOURCES_PROP (STRING ','?)+;
containsProperty:       CONTAINS_PROP (containedReference ','?)+;
containedReference:     cardinality? reference;
cardinality:            CARDINALITY | CARDINALITY_PHRASE;
reference:              ALPHNUMERICWORD | DOTSEPARATEDWORDS;
choiceProperty:         CHOICE_PROP (OPTION_MARKER option)+ LAST_OPTION_MARKER option;
option:                 choiceProperty | containsProperty;
constraintsProperty:    CONSTRAINS_PROP constraint+;
constraint:             AT_MOST_ONE;
