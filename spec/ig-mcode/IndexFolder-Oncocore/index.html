
<!--style>
        p.padding {
          padding-right: 20px;
        }
</style-->
<h1>Contents of this Implementation Guide</h1>

<ul>
    <li><a href="#Background">Background</a></li>
    <li><a href="#Modeling">Scope and Conceptual Model</a></li>
    <li><a href="mCODEDataDictionary.xlsx">Data Dictionary (Excel download)</a></li>
    <li><a href="examples.html">FHIR Examples</a></li>
    <li><a href="implementation.html">Implementation Notes</a></li>
    <li><a href="changelog.html">Change Log</a></li>
    <li><a href="#Disclaimers">Disclaimers and Known Limitations</a></li>
    <li><a href="#Credits">Credits</a></li>
    <li><a href="#Contacts">Contact Information</a></li>
</ul>

<h1><a name="Background"></a>Background</h1>
<p>According to the National Cancer Institute, 38.5 percent of men and women will be diagnosed with cancer at some point during their lifetimes. In 2014, an estimated 14.7M people were living with cancer in the United States. While these numbers are staggering, the silver lining in the wide prevalence of cancer is the potential to learn from treatment of millions of patients. If we had research-quality data from all cancer patients, it would enable higher quality health outcomes. Today, we lack the data models, technologies, and methods to capture that data.</p>

<p><a href="https://mcodeinitiative.org/" target="_blank">mCODE™</a> (short for Minimal Common Oncology Data Elements) is an initiative intended to assemble a core set of structured data elements for oncology electronic health records (EHRs). mCODE is a step towards capturing research-quality data from the treatment of all cancer patients. This would enable the treatment of every cancer patient to contribute to <a href="https://en.wikipedia.org/wiki/Comparative_effectiveness_research" target="_blank">comparative effectiveness analysis (CEA)</a> of cancer treatments by allowing for easier methods of data exchange between health systems. mCODE has been created and is being supported by the <a href="https://www.asco.org/" target="_blank">American Society of Clinical Oncology (ASCO&#174;)</a>in collaboration with the MITRE Corporation.</p>

<p>In late 2018, ASCO convened committee of twenty leading clinical experts in oncology, radiology, surgery, and public health developed two use cases that drove the initial clinical data requirements for mCODE:</p>
<ul>
    <li><b>Use Case 1</b>: <a href="mCODE-UseCase-RCC.docx">Comparative Effectiveness Analysis and Cooperative Decision Making</a></li>
    <li><b>Use Case 2</b>: <a href="mCODE-UseCase-NGS.docx">Comparative Effectiveness Analysis with Next Generation Sequencing (NGS)</a></li>
</ul>
<p>While mCODE ultimately is meant to be applicable to across all types of cancer, the initial focus (and both use cases) has been on solid tumors.</p>

<p>In addition to information obtained from subject matter experts, several pre-existing standards, nomenclatures, and guidelines were consulted in the development of this specification, including:</p>
    <ul>
        <li><a href="https://cancerstaging.org/references-tools/deskreferences/Pages/Breast-Cancer-Staging.aspx" target="_blank">American Joint Committee on Cancer (AJCC) Staging Manual (8th Edition) Breast Cancer Chapter</a></li>
        <li><a href="https://www.cap.org/protocols-and-guidelines" target="_blank">College of American Pathologists (CAP) Cancer Protocols</a></li>
        <li><a href="https://www.naaccr.org/SSDI/SSDI-Manual.pdf?v=1531675132" target="_blank">North American Association of Central Cancer Registries (NAACCR) 2018 Site-Specific Data Items Manual</a></li>
        <li><a href="http://www.hl7.org/implement/standards/product_brief.cfm?product_id=383" target="_blank">HL7 CDA R2 IG: Reporting to Public Health Cancer Registries from Ambulatory Healthcare Providers</a></li>
        <li><a href="https://www.nccn.org/professionals/physician_gls/default.aspx#site" target="_blank">National Comprehensive Cancer Network (NCCN) Clinical Practice Guidelines in Oncology</a></li>
        <li><a href="https://project.eortc.org/recist/wp-content/uploads/sites/4/2015/03/RECISTGuidelines.pdf" target="_blank">RECIST Guidelines v1.1</a></li>
        <li><a href="http://hl7.org/fhir/uv/genomics-reporting/index.html" target="_blank">HL7 FHIR Genomics Reporting Implementation Guidance (STU1)</a></li>
        <li><a href="https://www.ncbi.nlm.nih.gov/gtr" target="_blank">The National Center for Biotechnology Genetic Test Registry (GTR)</a></li>
        <li><a href="https://varnomen.hgvs.org/" target="_blank">The Human Genome Variation Society nomenclature for defining genetic variants</a>.</li>
        <li><a href="https://www.genenames.org/" target="_blank">The Human Genome Organization (HUGO) Gene Nomenclature Committee</a></li>
        <li><a href="https://www.cdisc.org/standards/therapeutic-areas/disease-area/oncology/" target="_blank">The CDISC Therapeutic Area User Guides (TAUG) </a></li>
     </ul>

<p>After initial development, in early 2019, an open survey was conducted to validate and prioritize the data elements from these use cases. Further down-scoping was done based on whether the data would be stored or capture in an electronic health record (EHR), and if it would place undue documentation burden on clinicians.</p> 

<p>The data elements identified in this process were modeled using the <a href="http://standardhealthrecord.org/cimpl-doc/" target="_blank">Clinical Information Modeling and Profiling Language (CIMPL)</a> and exported as FHIR Profiles. <a href="profiles.html">The profiles</a>, related FHIR artifacts, and other <a href="implementation.html">technical implementation information</a>, constitute the bulk of this IG. What follows is an overview of mCODE, directed primarily at clinical readers. Readers should also take note of the <a href="mCODEDataDictionary.xlsx">Data Dictionary (Excel download)</a>, a simplified, flattened list of mCODE elements.</p>

<p>Currently, there are two defined mCODE roles involving the exchange of mCODE data. However, this may change in the future. The first role is the "mCODE Data Sender". This participant provides mCODE data in response to a data query or autonomously pushes mCODE data to an mCODE receiver. The data sender does not have to be the originator of the data it possesses. The second mCODE data exchange role is the "mCODE Data Receiver". This participant accepts mCODE data from an mCODE Data Sender.</p>

<p>There are multiple actors recognized in this IG including:</p>
<ul>
    <li><b>Provider</b> - the oncologist, or their representitives, who works to treat cancer patients.</li>
    <li><b>Patient</b> - the patient who is suspected to have, or is diagnosed with, cancer.</li>
    <li><b>Application</b> - EHR systems or lab systems.</li>   
</ul>

<p>This implementation guide is a Domain of Knowledge IG. The purpose of this IG is to show how to represent clinical concepts generally, not to have a complete set of agreements for interoperable exchanges.</p>

<h1><a name="Modeling"></a>Scope and Conceptual Model</h1>
<p>mCODE consists of data elements divided into six groups, illustrated in the following diagram:</p>
<ul>
    <li><a href="#Patient">Patient Group</a></li>
    <li><a href="#Disease">Disease Characterization Group</a></li>
    <li><a href="#LabsVitals">Laboratory Results and Vital Signs Group</a></li>
    <li><a href="#Treatment">Treatments Group</a></li>
    <li><a href="#Genomics">Genomics Group</a></li>
    <li><a href="#Outcomes">Outcomes Group</a></li>
</ul>

<img src="mCodeDiagram.png" alt="mCODE Logical Model" width="1100" />
<p>&nbsp;</p>

<h2><a name="Patient"></a>Patient Group</h2>
<p>The mCODE <b>Patient</b> group contains the following basic information about the patient:</p>
<ul>
    <li><b>Demographics</b> - including date of birth, gender, zip code, race, and ethnicity.</li>
    <li><b>Comorbid conditions</b> - the list of comorbid conditions aligned with the <a href = "http://mchp-appserv.cpe.umanitoba.ca/concept/Elixhauser%20Comorbidities%20-%20Coding%20Algorithms%20for%20ICD-9-CM%20and%20ICD-10.pdf" target="_blank">Elixhauer Comorbidity Index</a>.</li>
    <li><b>Patient performance status</b> - <a href="https://ecog-acrin.org/resources/ecog-performance-status" target="_blank">Eastern Cooperative Oncology Group (ECOG) Performance Status</a> and/or <a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3722041/" target="_blank">Karnofsky Performance Status (KPS)</a>. Because performance assessments may be performed more than once over a period of time, multiple instances may exist for a single patient.</li>
</ul>

<p><a href="StructureDefinition-obf-Patient.html">Patient</a> is the most essential FHIR profile, as all other mCODE major elements reference it. The mCODE Patient profile differs only slightly from the <a href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html" target="_blank">US Core Patient Profile</a>. Most significantly, Patient.deceased is a <a href="https://www.hl7.org/fhir/profiling.html#mustsupport" target="_blank">must-support</a> element in mCODE.</p>

<h2><a name="Disease"></a>Disease Characterization Group</h2>

<p>The mCODE <b>Disease Characterization</b> group includes data elements specific to the diagnosis and staging of cancer. This includes:</p>
<ul>
    <li><b>Cancer Diagnosis</b> - the date and location (body site/position and laterality) of the cancer diagnosis.</li>
    <li><b>Tumor characteristics</b> - the shape (histologic type) and behavior of the tumor cell, compared to that of a normal cell.</li>
    <li><b>Cancer stage</b> - describes the severity of an individual's cancer based on the magnitude of the original (primary) tumor as well as on the extent cancer has spread in the body. Understanding the stage of the cancer helps doctors to develop a prognosis and design a treatment plan for individual patients. Staging calculations leverage results from the previous two categories, along with prognostic factors relevant to the cancer type, in order to assess an overall cancer stage group (source: <a href="https://cancerstaging.org/references-tools/Pages/What-is-Cancer-Staging.aspx" target="_blank">AJCC</a>).</li>
</ul>

<h3>Representing Cancer Diagnosis</h3>
<p>The cancer diagnosis combines the type, site, and certain characteristics of the cancer. Depending on the EHR and provider organization, different code systems may be used, such as:</p>
<ul>
    <li><a href="https://www.snomed.org/" target="_blank">Systematized Nomenclature of Medicine - Clinical Terms (SNOMED CT)</a></li>
    <li><a href="https://www.cdc.gov/nchs/icd/icd10cm.htm" target="_blank">International Classification of Diseases, 10th version, Clinical Modifications (ICD-10-CM)</a></li>
    <li><a href="https://codes.iarc.fr/" target="_blank">International Classification of Diseases for Oncology, 3rd version (ICD-O-3)</a></li>
</ul>

<p>Because the use of these coding systems vary in different institutions, mCODE supports all three. Implementers should be aware, however, that how the cancer diagnosis is coded can affect compliance with <a href="http://hl7.org/fhir/us/core/" target="_blank">US Core</a> (see <a href="implementation.html">Implementation Notes</a> for details). Two attributes and one <a href="https://www.hl7.org/fhir/extensibility.html" target="_blank">FHIR extension</a> of the <a href="https://www.hl7.org/fhir/condition.html" target="_blank">FHIR Condition Resource</a> are involved with coding the cancer diagnosis: the Code, the <a href="StructureDefinition-onco-core-HistologyMorphologyBehavior-extension.html">HistologyMorphologyBehavior</a> extension, and the Body Site. How these attributes are used, depending on the coding system, is captured in the table below:</p>
<!--
<table class="tg">
    <tr>
      <th class="tg-0pky">Condition Attribute/Element</th>
      <th class="tg-0pky">SNOMED CT (SCT)</th>
      <th class="tg-0pky">ICD-10-CM</th>
      <th class="tg-0pky">ICD-O-3</th>
    </tr>
    <tr>
      <td class="tg-0pky">Code (required)</td>
      <td class="tg-0pky">Code from hierarchy of 363346000 |Malignant neoplastic disease (disorder)|</td>
      <td class="tg-0pky">ICD-10-CM primary code (precoordinates histology morphology behavior, and body site)</td>
      <td class="tg-0pky">Fixed SNOMED CT code 363346000 |Malignant neoplastic disease (disorder)|</td>
    </tr>
    <tr>
      <td class="tg-0pky">Histology Morphology Behavior (extension)</td>
      <td class="tg-0pky">Code from hierarchy of 367651003 |Malignant neoplasm of primary, secondary, or uncertain origin (morphologic abnormality)|</td>
      <td class="tg-0pky">n/a</td>
      <td class="tg-0pky">ICD-O-3 morphology code (including /1, /2, or /3 suffix for primary cancers and /6 suffix for secondary cancers)</td>
    </tr>
    <tr>
      <td class="tg-0pky">Body Site</td>
      <td class="tg-0pky">Code from hierarchy of 123037004 |Body structure (body structure)|</td>
      <td class="tg-0pky">n/a</td>
      <td class="tg-0pky">ICD-O-3 topology code</td>
    </tr>
  </table>
-->

<img src="CancerDxCodingSystems.png" alt="mCODE Logical Model" width="80%" align="middle"/>

<p>Implementers should reference the <a href="StructureDefinition-onco-core-PrimaryCancerCondition.html">PrimaryCancerCondition</a> and <a href="StructureDefinition-onco-core-SecondaryCancerCondition.html">Secondary Cancer Condition</a> profiles for details on the use of these terminologies and associated value sets.</p>

<h3>Representing Cancer Staging Information</h3>
<p>Cancer stage information is contained in a set of profiles, representing <a href="https://www.cancer.gov/publications/dictionaries/cancer-terms/def/clinical-staging" target="_blank">clinical stage group</a> and <a href="https://www.cancer.gov/publications/dictionaries/cancer-terms/def/pathological-staging" target="_blank">pathologic stage group</a> panels with members representing the primary tumor (T) category, the regional nodes (N) category, and the distant metastases (M) category. </p>

<p>TNM staging systems are specified in the <em>CancerStagingSystemVS</em> extensible value set of SNOMED CT terms. SNOMED CT does not have a concept code to denote AJCC version 8, the most current version used for AJCC for cancer staging. AJCC is actively requesting the addition of new SNOMED CT concept code, although the process to approve and publish the new code could take several months. Until one is available in the SNOMED CT US Edition, we recommend the NCI thesaurus code <em>C146985 (AJCC Cancer Staging Manual 8th Edition)</em>.</p>

<p>Non-TNM staging systems are not currently represented in mCODE, reflecting mCODE's current focus on solid tumors. In mCODE, a single patient may have more than one staging panel, although this is not common in practice.</p>

<p>Clinical applications vary in their representation of T, N, and M staging category values, falling into one of two naming conventions:</p>

<ul>
    <li>prepended with a staging classification abbreviation (e.g.: <em>cT3</em>). This is the coding convention returned by AJCC in their digital data content retrieved via the <a href="https://ajcc.3scale.net/" target="_blank">AJCC Application Programming Interface (API)</a>.</li>
    <li>without a prepended staging classification abbreviation (e.g.: <em>T3</em>).</li>
</ul>

<p>mCODE recommends that the implementers align with AJCC's convention of representing the staging category value with the <em>prepended classification</em> in both <a href="StructureDefinition-onco-core-TNMClinicalStageGroup.html">TNMClinicalStageGroup</a> and <a href="StructureDefinition-onco-core-TNMPathologicStageGroup.html">TNMPathologicStageGroup</a> profiles. This code convention is aligned with the AJCC's digital data and clearly distinguishes the staging classification as clinical, pathologic, or neoadjuvant without having to retrieve further context from the model. Nonetheless, separate profiles for clinical and pathological staging were developed, with an eye toward future extensibility, in particular, the ability to additional prognostic factors relevant to particular types of cancers in the <a href="StructureDefinition-onco-core-TNMPathologicStageGroup.html">TNMPathologicStageGroup</a>.</p>


<h2><a name="LabsVitals"></a>Laboratory Results and Vital Signs Group</h2>
<h3>Core Laboratory Results</h3>
<p>Many laboratory tests could be relevant to an individual with cancer. The initial mCODE release calls for results from two core laboratory panels, the Complete Blood Count (CBC) (Automatic or Manual Differential) and Comprehensive Metabolic Panel (CMP). CBC and CMP results can be reported as individual laboratory observations or as grouped panels, using the DiagnosticReport resource. If DiagnosticReports are submitted, they must conform to <a href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html">US Core DiagnosticReport Profile for Laboratory Results Reporting</a>. Examples of <a href="http://hl7.org/fhir/us/core/DiagnosticReport-cbc.html">CBC reporting</a> and <a href="http://hl7.org/fhir/us/core/DiagnosticReport-metabolic-panel.html">CMP reporting</a> are given in the <a href="http://hl7.org/fhir/us/core/index.html">US Core IG</a>.</p>


<h3><a name="TumorMarkers"></a>Tumor Marker Tests</h3>
<p>Tumor markers are key prognostic factors in calculating cancer staging, identifying treatment options, and monitoring progression of disease. For example, an abnormal increase in prostate-specific antigen (PSA) levels is a prognostic factor for prostate cancer. Other tumor markers include estrogen receptor (ER) status, progresterone receptor (PR) status, carcinoembryonic antigen (CEA) levels, among others. See the profile <a href="StructureDefinition-onco-core-TumorMarkerTest.html">TumorMarkerTest</a> for full details.</p>

<p>We distinguish Tumor Marker Tests from genetic tests that are measured at the DNA, RNA, or chromosomal level, addressed in the <a href="#Genomics">Genomics</a> section.
</p>

<h3>Vital Signs</h3>
<p>Vital signs are measurements of the most essential, or "vital" body functions. Traditionally, <a href="https://medlineplus.gov/vitalsigns.html" target="_blank">vital signs include</a> blood pressure, heart rate, respiratory rate, and temperature. More recently, height and weight have been included. For mCODE, blood pressure, body height, and body weight are believed to be most critical to assessment and treatment. mCODE uses the <a href="http://hl7.org/fhir/R4/observation-vitalsigns.html" target="_blank">FHIR vital sign profiles</a>, which are incorporated by reference into <a href="http://hl7.org/fhir/us/core/" target="_blank">US Core v3</a>. </p>

<h2><a name="Treatment"></a>Treatments Group</h2>
<p>The <strong>Treatment</strong> group includes reporting of procedures and medications used to treat a cancer patient, or relevant to that treatment. Treatments are captured using the following profiles:</p>
<ul>
    <li><a href="StructureDefinition-onco-core-CancerRelatedSurgicalProcedure.html">CancerRelatedSurgicalProcedure</a> - representing surgical procedures that involve the removal of cancer tumors from the body. </li>
    <li><a href="StructureDefinition-onco-core-CancerRelatedRadiationProcedure.html">CancerRelatedRadiationProcedure</a> - to document the use of high-energy radiation from x-rays, gamma rays, neutrons, protons, and other sources to all cancer cells and shrink tumors.</li>
    <li><a href="StructureDefinition-obf-MedicationStatement.html">MedicationStatement</a> - recording treatments involving chemotherapy agents, targeted therapy agents, and hormone therapy agents. The mCODE profile of MedicationStatement includes two extensions that distinguish it from FHIR's base resource of the same name:
        <ul>
            <li><a href="StructureDefinition-obf-TreatmentIntent-extension.html">TreatmentIntent</a> - to record the purpose of the treatment, whether curative or palliative</li>
            <li><a href="StructureDefinition-obf-TerminationReason-extension.html">TerminationReason</a> - to document the reason for unplanned or premature termination of the medication. </li>
        </ul>
    </li>
</ul>
<p>Like US Core, mCODE gives preference to representing medications using the National Library of Medicine (NLM) <a href = "https://www.nlm.nih.gov/research/umls/rxnorm/" target="_blank">RxNorm</a> terminology - a coding standard established by the Office of the National Coordinator (ONC) for the exchange of drugs. However, RxNorm is restricted to FDA-approved drugs and does not include clinical trial drugs. To address this limitation, mCODE allows for the inclusion of other coding systems like the <a href="https://ncit.nci.nih.gov/ncitbrowser/" target="_blank">NCI Thesaurus (NCIT)</a> to represent clinical trial oncology drugs.</p>

<h2><a name="Genomics"></a>Genomics Group</h2>
<p>mCODE includes the minimal set of genomics related elements relevant to capture in an EHR to inform cancer assessment and treatment options. The approach is based on the <a href="http://hl7.org/fhir/uv/genomics-reporting/index.html" target="_blank">HL7 CGWG Clinical Genomics Reporting Implementation Guide</a>. However, mCODE simplifies genomics reporting to single discrete variants or to variants that were found in a given DNA region. Three profiles relate to the capture of clinical genomics data:</p>
<ul>
    <li><a href="StructureDefinition-onco-core-GenomicsReport.html">Genomics Report</a> - contain results of genomic analyses. Genomic reports vary in complexity and content, as simple as the results for a single discrete variant to complex sequences that are found in exome and genome-wide association studies (GWAS).</li>
    <li><a href="StructureDefinition-onco-core-GeneticVariant.html">Genetic Variant</a> - used to record variants that could be found from tests that broadly analyze genetic regions (e.g.: exome tests) and stores results for any variants that could have been found.  The region in which the variant was found could be specified in the RegionStudied attribute of the GenomicsReport profile.</li>
    <li><a href="StructureDefinition-onco-core-GeneticSpecimen.html">Genetic Specimen</a> - used to further specify the specimen collected for a genomics test.</li>
</ul>
<p>The identity of non-genomic laboratory tests is typically represented by a <a href="https://loinc.org/" target="_blank">Logical Observation Identifiers and Names (LOINC)</a> code. However, many genetic tests and panels do not have LOINC codes, although some might have an identifier in the <a href="https://www.ncbi.nlm.nih.gov/gtr/" target="_blank">NCBI Genetic Testing Registry (GTR)</a>, a central location for voluntary submission of genetic test information by providers. While GTR is a viable source for identifying many genetic tests, the user should be aware that the GTR is not single authoritative source since the test data is voluntarily updated. Standardization of codes for genetic tests is essential to facilitate data analysis of genetic tests, and should be a priority for the genomics testing community in the near future. Implementers should also note that, to conform to the requirements of the <a href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab.html" target="_blank">US Core Laboratory Result Profile</a>, LOINC must be used, if a suitable code is available. If there is no suitable code in LOINC, then a code from an alternative code system such as GTR can be used.</p>

<h2><a name="Outcomes"></a>Outcomes Group</h2>
<p>Recording outcomes of cancer treatment in mCODE involves two data elements: disease status and date of death. Other common outcome measures, such as progression-free survival, time to recurrence, and overall survival, can be derived from time-indexed observations of disease status. The date of diagnosis is also required for some derived measures (see <a href="#Disease">Disease Characterization</a>). At this time, mCODE does not include patient reported outcomes.</p>

<h3>Disease Status</h3>
<p>Formal recording of disease status is often limited to clinical trials, involving precise criteria such as <a href="https://ctep.cancer.gov/protocolDevelopment/docs/recist_guideline.pdf" target="_blank">RECIST</a>. The lack of outcome data outside of trials greatly limits the application of real-world data. Disease status information is rarely found in structured form in EHRs. If recorded at all, the information is found in clinical notes, which is of limited usefulness.</p>
<p>mCODE asks for disease progression to be recorded in structured form as part of patient encounters. In mCODE, disease status is defined as "A clinician's qualitative judgment on the current trend of the cancer, e.g., whether it is stable, worsening (progressing), or improving (responding). The judgment may be based a single type or multiple kinds of evidence, such as imaging data, assessment of symptoms, tumor markers, laboratory data, etc." In other words, the disease status is an assessment by the oncologist that synthesizes all currently available information about the patient. The <a href="http://icaredata.org/" target="_blank">ICAREdata™ Project</a> is conducting a study in association with a randomized controlled trial (RCT), which aims to demonstrate the ability to calculate equivalent clinical trial endpoints using computable clinical treatment data.
</p>

<h3>Date of Death</h3>
<p>Date of death data can be obtained from several sources outside of the clinical setting. If available in the EHR, it can be reported through via mCODE, but more likely, it will be filled in from vital records, after the last clinical interaction.</p>



<h1><a name="Disclaimers"></a>Disclaimers and Known Limitations</h1>
<p></p>
<ul>
    <li>Several proprietary terminologies, including ICD-O-3 and the American Joint Commission on Cancer (AJCC) Staging Systems are widely used in the cancer domain. Others, such as Current Procedural Terminology (CPT&#174;), while not cancer-specific, are relevant for the representation of cancer-related procedures, such as surgeries or radiation procedures. Consequently, this guide does not include content from these terminologies due to licensing restrictions. As such, <i><strong>elements related to staging may not currently include required terminology codes for assessing the cancer stage</strong></i>. The guide does, however, indicate where it is appropriate to use codes from such terminologies.</li>
    <li>Under the <a href="https://www.copyright.gov/fair-use/more-info.html" target="_blank">Fair Use doctrine</a>, this IG provides examples illustrating mCODE's representation of cancer diagnoses and AJCC staging values for the purposes of technical implementation guidance to FHIR developers.</li>
    <li>mCODE elements listed in this IG might vary from the list identified by ASCO in their recent survey. These elements are subject to change based on review from ASCO, CancerLinQ, and other reviewers from the oncology community.
    </li>
    <li>The Data Dictionary includes a subset of must-support elements in the mCODE specification, intentionally omitting certain elements including in this implementation guide. When there are differences between the Data Dictionary and content of the FHIR implementation guide, the profiles and value sets in the guide should be taken as the source of truth.</li>
    <li>Under <a href="https://www.cms.gov/Regulations-and-Guidance/Legislation/CLIA/index.html?redirect=/clia" target="_blank">Clinical Laboratory Improvement Amendments (CLIA)</a> regulations, laboratory tests must include information on the performing technologist, performing laboratory, and performing laboratory medical director. These three roles would ideally appear as <a href="https://www.hl7.org/fhir/profiling.html#slicing" target="_blank">slices</a> on Observation.performer and/or DiagnosticReport.performer. However, slicing requires a <a href="https://www.hl7.org/fhir/profiling.html#discriminator" target="_blank">discriminator</a>, a field that can be checked to determine whether a resource found in Observation.performer or DiagnosticReport.performer corresponds to the performing technologist or the performing laboratory medical director. While the performing laboratory can be determined by its resource type, in the current design of FHIR, there is no indicator that would discriminate the roles of the two Practitioner participants.</li>
    <li>mCODE includes a dedicated FHIR profile, <a href="StructureDefinition-onco-core-TumorMarkerTest.html">TumorMarkerTest</a>, for labs involving serum and tissue-based tumor markers. Unlike other laboratory profiles in mCODE, one profile has been created to handle the entire class of tumor marker tests, primarily because of the large number of laboratory tests involved. A value set of approximately 150 tumor marker tests was developed and bound to the Code attribute, using an extensible binding to account for new and overlooked tests and code updates. The <a href="ValueSet-onco-core-TumorMarkerTestVS.html">TumorMarkerTestVS</a> lists some common tests for tumor markers but does not further align by cancer type. The approach of using a single profile for multiple tests is less than ideal, since without specifying units of measure or answer sets on a per-test basis, reporting could vary.</li>
    <li>Not all vocabularies used in mCODE are currently supported by the <a href="http://wiki.hl7.org/index.php?title=IG_Publisher_Documentation" target="_blank">FHIR Implementation Guide Publishing Tool</a>. The <a href="qa.html">error report on this IG</a> reports these references as errors. In truth, they reflect limitations of the FHIR terminology server. Unsupported vocabularies include ClinVar and AJCC.</li>
    <li>The authors are considering whether it might be more accurate to represent Clinical and Pathologic Staging Groups as DiagnosticReports, rather than Observations. Feedback is welcome.</li>
    <li>The authors are considering NCI Thesaurus as a source vocabulary for <a href="ValueSet-onco-core-CancerStagingSystemVS.html">CancerStagingSystemVS</a>, since SNOMED CT lacks the necessary terms (AJCC Version 8, in particular).</li>
</ul>

<h1><a name="Credits"></a>Credits</h1>
<p>The authors recognize the leadership and sponsorship of Dr. Monica Bertagnolli, President, ASCO and Dr. Jay Schnitzer, MITRE Chief Technology Officer. Dr. Steven Piantadosi and the Alliance for Clinical Trials in Oncology coordinated real-world data collection in clinical trials, as part of this project. The ASCO/CancerLinQ team was led by Dr. Robert Miller and Dr. Wendy Rubinstein. Lead MITRE contributors were Mark Kramer, Rute Martins, Chris Moesel, Caroline Potteiger, and May Terry. Andre Quina and Dr. Brian Anderson guide the overall mCODE effort at MITRE. HL7 sponsorship and input from <a href="http://www.hl7.org/Special/committees/cic/index.cfm" target="_blank">Clinical Interoperability Council</a> and <a href="https://www.hl7.org/Special/Committees/cimi/index.cfm" target="_blank">Clinical Information Modeling Initiative</a> is gratefully acknowledged, with special thanks to Richard Esmond and Laura Heermann Langford.</p>
<p>This IG was authored by the MITRE Corporation using the <a href="http://standardhealthrecord.org/cimpl-doc/" target="_blank">Clinical Information Modeling and Profiling Language (CIMPL)</a>, a free, open source toolchain from <a href="https://www.mitre.org/" target="_blank">MITRE Corporation</a>.</p>

<h1><a name="Contacts"></a>Contact Information</h1>
<table width="100%">
    <tbody>
    <tr>
    <td width="20%">
    <p>General Inquiries:</p>
    </td>
    <td width="80%">
    <p><a href="mailto:mcode-info@asco.org">mcode-info@asco.org</a></p>
    </td>
    </tr>
    <tr>
    <td width="20%">
    <p>Co-Editor:</p>
    </td>
    <td width="80%">
    <p>Dr. Robert Miller</p>
    <p>ASCO CancerLinQ</p>
    <p><a href="mailto:robert.miller@asco.org">robert.miller@asco.org</a></p>
    </td>
    </tr>
    <tr>
    <td width="20%">
    <p>Co-Editor:</p>
    </td>
    <td width="80%">
    <p>Mark Kramer</p>
    <p>MITRE Corporation</p>
    <p><a href="mailto:mkramer@mitre.org">mkramer@mitre.org</a></p>
    </td>
    </tr>
    </tbody>
    </table>

<p>&nbsp;</p>
<footer>
    <hr/>
    <p><font color="#BEBEBD"><small>Approved for Public Release. Distribution Unlimited. Case Number 16-1988</small></font></p>
</footer>