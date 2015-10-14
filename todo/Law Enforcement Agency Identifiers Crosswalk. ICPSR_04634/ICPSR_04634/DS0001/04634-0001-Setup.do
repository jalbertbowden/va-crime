/**************************************************************************
 |                                                                         
 |                    STATA SETUP FILE FOR ICPSR 04634
 |          LAW ENFORCEMENT AGENCY IDENTIFIERS CROSSWALK [UNITED
 |                             STATES], 2005
 |
 |
 |  Please edit this file as instructed below.
 |  To execute, start Stata, change to the directory containing:
 |       - this do file
 |       - the ASCII data file
 |       - the dictionary file
 |
 |  Then execute the do file (e.g., do 04634-0001-statasetup.do)
 |
 **************************************************************************/

set mem 30m  /* Allocating 30 megabyte(s) of RAM for Stata SE to read the
                 data file into memory. */


set more off  /* This prevents the Stata output viewer from pausing the
                 process */

/****************************************************

Section 1: File Specifications
   This section assigns local macros to the necessary files.
   Please edit:
        "data-filename" ==> The name of data file downloaded from ICPSR
        "dictionary-filename" ==> The name of the dictionary file downloaded.
        "stata-datafile" ==> The name you wish to call your Stata data file.

   Note:  We assume that the raw data, dictionary, and setup (this do file) all
          reside in the same directory (or folder).  If that is not the case
          you will need to include paths as well as filenames in the macros.

********************************************************/

local raw_data "data-filename"
local dict "dictionary-filename"
local outfile "stata-datafile"

/********************************************************

Section 2: Infile Command

This section reads the raw data into Stata format.  If Section 1 was defined
properly, there should be no reason to modify this section.  These macros
should inflate automatically.

**********************************************************/

infile using `dict', using (`raw_data') clear


/*********************************************************

Section 3: Value Label Definitions
This section defines labels for the individual values of each variable.
We suggest that users do not modify this section.

**********************************************************/


label data "Law Enforcement Agency Identifiers Crosswalk [United States], 2005, Dataset 0001"

#delimit ;
label define FSTATE    1 "Alabama" 2 "Alaska" 4 "Arizona" 5 "Arkansas"
                       6 "California" 8 "Colorado" 9 "Connecticut"
                       10 "Delaware" 11 "District of Columbia" 12 "Florida"
                       13 "Georgia" 15 "Hawaii" 16 "Idaho" 17 "Illinois"
                       18 "Indiana" 19 "Iowa" 20 "Kansas" 21 "Kentucky"
                       22 "Louisiana" 23 "Maine" 24 "Maryland"
                       25 "Massachusetts" 26 "Michigan" 27 "Minnesota"
                       28 "Mississippi" 29 "Missouri" 30 "Montana"
                       31 "Nebraska" 32 "Nevada" 33 "New Hampshire"
                       34 "New Jersey" 35 "New Mexico" 36 "New York"
                       37 "North Carolina" 38 "North Dakota" 39 "Ohio"
                       40 "Oklahoma" 41 "Oregon" 42 "Pennsylvania"
                       44 "Rhodes Island" 45 "South Carolina"
                       46 "South Dakota" 47 "Tennessee" 48 "Texas" 49 "Utah"
                       50 "Vermont" 51 "Virginia" 53 "Washington"
                       54 "West Virginia" 55 "Wisconsin" 56 "Wyoming"
                       57 "Canal Zone" 66 "Guam" 72 "Puerto Rico"
                       99 "Undetermined" ;
label define FCOUNTY   999 "Undetermined" ;
label define FPLACE    99999 "Undetermined" ;
label define FMSA      9999 "See codebook" ;
label define GOVIDNU   6000000 "Federal" 10000000 "Alabama" 20000000 "Alaska"
                       30000000 "Arizona" 40000000 "Arkansas"
                       50000000 "California" 60000000 "Colorado"
                       70000000 "Connecticut" 80000000 "Delaware"
                       100000000 "Florida" 110000000 "Georgia"
                       120000000 "Hawaii" 130000000 "Idaho"
                       140000000 "Illinois" 150000000 "Indiana"
                       160000000 "Iowa" 170000000 "Kansas"
                       180000000 "Kentucky" 190000000 "Louisiana"
                       200000000 "Maine" 210000000 "Maryland"
                       220000000 "Massachusetts" 230000000 "Michigan"
                       240000000 "Minnesota" 250000000 "Mississippi"
                       260000000 "Missouri" 270000000 "Montana"
                       280000000 "Nebraska" 290000000 "Nevada"
                       300000000 "New Hampshire" 310000000 "New Jersey"
                       320000000 "New Mexico" 330000000 "New York"
                       340000000 "North Carolina" 350000000 "North Dakota"
                       360000000 "Ohio" 370000000 "Oklahoma"
                       380000000 "Oregon" 390000000 "Pennsylvania"
                       400000000 "Rhode Island" 410000000 "South Carolina"
                       420000000 "South Dakota" 430000000 "Tennessee"
                       440000000 "Texas" 450000000 "Utah" 460000000 "Vermont"
                       470000000 "Virginia" 480000000 "Washington"
                       490000000 "West Virginia" 500000000 "Wisconsin"
                       530000000 "Guam" 550000000 "Puerto Rico"
                       570000000 "Canal Zone" 997777777 "Tribal"
                       999999999 "Undetermined" ;
label define GOVTYPE   0 "State" 1 "County" 2 "Municipal" 3 "Township"
                       4 "Special district" 5 "Independent school district"
                       6 "Federal" 7 "Tribal" 99 "Undetermined" ;
label define AGENTYPE  1 "Sheriff" 2 "County police" 3 "Municipal police"
                       5 "Primary state LE" 6 "Special police" 7 "Constable"
                       8 "Tribal" 9 "Regional police" ;
label define SPECFUNC  1 "Airport" 2 "College/university" 3 "Schools - K12"
                       4 "Hospitals" 5 "Railroad" 6 "Federal" 7 "Tribal" ;
label define MULTPLC   1 "Multiple places" ;
label define HQCODE    1 "HQ location" ;
label define USTATENO  1 "Alabama" 2 "Arizona" 3 "Arkansas" 4 "California"
                       5 "Colorado" 6 "Connecticut" 7 "Delaware"
                       8 "District of Columbia" 9 "Florida" 10 "Georgia"
                       11 "Idaho" 12 "Illinois" 13 "Indiana" 14 "Iowa"
                       15 "Kansas" 16 "Kentucky" 17 "Louisiana" 18 "Maine"
                       19 "Maryland" 20 "Massachusetts" 21 "Michigan"
                       22 "Minnesota" 23 "Mississippi" 24 "Missouri"
                       25 "Montana" 26 "Nebraska" 27 "Nevada"
                       28 "New Hampshire" 29 "New Jersey" 30 "New Mexico"
                       31 "New York" 32 "North Carolina" 33 "North Dakota"
                       34 "Ohio" 35 "Oklahoma" 36 "Oregon" 37 "Pennsylvania"
                       38 "Rhodes Island" 39 "South Carolina"
                       40 "South Dakota" 41 "Tennessee" 42 "Texas" 43 "Utah"
                       44 "Vermont" 45 "Virginia" 46 "Washington"
                       47 "West Virginia" 48 "Wisconsin" 49 "Wyoming"
                       50 "Alaska" 51 "Hawaii" 52 "Canal Zone"
                       53 "Puerto Rico" 55 "Guam" ;
label define UMULTICO  1 "Multiple counties" ;
label define UPOPGRP   0 "Possessions" 1 "All cities 250,000 or over"
                       2 "Cities 1,000,000 or over"
                       3 "Cities from 500,000-999,000"
                       4 "Cities from 250,000-499,999"
                       5 "Cities from 100,000-249,000"
                       6 "Cities from 50,000-99,999"
                       7 "Cities from 25,000-49,999"
                       8 "Cities from 10,000-24,999"
                       9 "Cities from 2,500-9,999" 10 "Cities under 2,500"
                       11 "Non-MSA counties"
                       12 "Non-MSA counties 100,000 or over"
                       13 "Non-MSA counties from 25,000-99,999"
                       14 "Non-MSA counties from 10,000-24,999"
                       15 "Non-MSA counties under 10,000"
                       16 "Non-MSA State Police" 17 "MSA counties"
                       18 "MSA counties 100,000 or over"
                       19 "MSA counties from 25,000-99,999"
                       20 "MSA counties from 10,000-24,999"
                       21 "MSA counties under 10,000" 22 "MSA State Police" ;
label define UDIV      0 "Possessions" 1 "New England" 2 "Middle Atlantic"
                       3 "East North Central" 4 "West North Central"
                       5 "South Atlantic" 6 "East South Central"
                       7 "West South Central" 8 "Mountain" 9 "Pacific" ;
label define CPOP      8888888888 "Not applicable" ;
label define SOURCE    1 "UCR Only" 2 "CSLLEA Only" 3 "Both UCR and CSLLEA" ;


#delimit cr

/********************************************************************

 Section 4: Save Outfile

  This section saves out a Stata system format file.  There is no reason to
  modify it if the macros in Section 1 were specified correctly.

*********************************************************************/

save `outfile', replace

