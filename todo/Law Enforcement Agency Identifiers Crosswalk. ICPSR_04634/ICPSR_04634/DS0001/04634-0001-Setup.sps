*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 04634
*           LAW ENFORCEMENT AGENCY IDENTIFIERS CROSSWALK [UNITED
*                              STATES], 2005
* 
*
*  SPSS setup sections are provided for the ASCII version of this data
*  collection.  These sections are listed below:
*
*  DATA LIST:  assigns the name, type, decimal specification (if any),
*  and specifies the beginning and ending column locations for each
*  variable in the data file. Users must replace the "data-filename"
*  in the DATA LIST statement with a filename specifying the directory
*  on the user's computer system in which the downloaded and unzipped
*  data file is physically located (e.g., "c:\temp\04634-0001-data.txt").
*
*  VARIABLE LABELS:  assigns descriptive labels to all variables.
*  Labels and variable names may be identical for some data files.
*
*  MISSING VALUES: declares user-defined missing values. Not all
*  variables in this data set necessarily have user-defined missing
*  values. These values can be treated specially in data transformations,
*  statistical calculations, and case selection.
*
*  VALUE LABELS: assigns descriptive labels to codes found in the data
*  file.  Not all codes necessarily have assigned value labels.
*
*  NOTE:  Users should modify this setup file to suit their specific 
*  needs. The MISSING VALUES section has been commented out (i.e., '*').
*  To include the MISSING VALUES section in the final SPSS setup, remove 
*  the comment indicators from the desired section.
*
*  CREATING A PERMANENT SPSS DATA FILE: If users wish to create and save
*  an SPSS data file for further analysis using SPSS for Windows, the
*  necessary "SAVE OUTFILE" command is provided in the last line of
*  this file.  To activate the command, users must delete the leading
*  asterisk (*) and replace "spss-filename" with a filename specifying
*  the location on the user's computer system to which the new data file
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da04634-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=703.
DATA LIST FILE=DATA /
           STATE 1-2 (A)         COUNTY 3-37 (A)
       AGENCY 38-187 (A)          FSTATE 188-189         FCOUNTY 190-192
          FPLACE 193-197     PLACENM 198-249 (A)            FMSA 250-253
    FMSANAME 254-318 (A)         GOVIDNU 319-327     GOVNAME 328-391 (A)
         GOVTYPE 392-393    AGENCYID 394-409 (A)            AGENTYPE 410
        SPECFUNC 411-412             MULTPLC 413          HQCODE 414-421
     CLASSCD 422-423 (A)        PARTOFCD 424-428    PARTOFNM 429-480 (A)
         OTHCODE 481-485     OTHNAME 486-537 (A)        ORI7 538-544 (A)
        ORI9 545-553 (A)      UCOVBY 554-560 (A)        USTATENO 561-562
            UMULTICO 563          UCNTY1 564-566          UCNTY2 567-569
          UCNTY3 570-572           UMSA1 573-575           UMSA2 576-578
           UMSA3 579-581         UPOPGRP 582-583         UPOPTOT 584-592
           UPOP1 593-601           UPOP2 602-610           UPOP3 611-619
                UDIV 620         UJUVAGE 621-622           UCORE 623 (A)
         ULASTUP 624-629            CPOP 630-640         LAT 641-652 (6)
        LONG 653-664 (6)             POP 665-673           HOUSE 674-681
       MILES 682-695 (6)         ZIPCODE 696-700        ZIPRANGE 701-702
              SOURCE 703
   .

* SPSS VARIABLE LABELS COMMAND.

VARIABLE LABELS
   STATE     'ALPHA STATE CODE' /
   COUNTY    'COUNTY NAME' /
   AGENCY    'AGENCY NAME' /
   FSTATE    'FIPS STATE CODE' /
   FCOUNTY   'FIPS COUNTY CODE' /
   FPLACE    'FIPS PLACE CODE' /
   PLACENM   'PLACE NAME' /
   FMSA      'FIPS MSA CODE' /
   FMSANAME  'FIPS MSA NAME' /
   GOVIDNU   'GOVERNMENT ID (NUMERIC)' /
   GOVNAME   'GOVERNMENT NAME' /
   GOVTYPE   'GOVERNMENT TYPE' /
   AGENCYID  'CENSUS 16 CHARACTER ID (STRING)' /
   AGENTYPE  'TYPE OF AGENCY' /
   SPECFUNC  'SPECIAL FUNCTION' /
   MULTPLC   'FLAG: AGENCY COVERS MULTIPLE PLACES' /
   HQCODE    'FLAG: HEADQUARTERS LOCATION FIPS' /
   CLASSCD   'ENTITY CLASS CODE (SEE CODEBOOK)' /
   PARTOFCD  'ENTITY PART OF CODE' /
   PARTOFNM  'ENTITY PART OF NAME' /
   OTHCODE   'OTHER NAME CODE' /
   OTHNAME   'OTHER NAME' /
   ORI7      'ORIGINATING AGENCY IDENTIFIER (7 CHARACTER)' /
   ORI9      'ORIGINATING AGENCY IDENTIFIER (9 CHARACTER)' /
   UCOVBY    'UCR COVERED BY AGENCY ORI' /
   USTATENO  'UCR STATE NUMBER' /
   UMULTICO  'UCR MULTIPLE COUNTY FLAG' /
   UCNTY1    'UCR COUNTY NUMBER 1' /
   UCNTY2    'UCR COUNTY NUMBER 2' /
   UCNTY3    'UCR COUNTY NUMBER 3' /
   UMSA1     'UCR MSA NUMBER 1' /
   UMSA2     'UCR MSA NUMBER 2' /
   UMSA3     'UCR MSA NUMBER 3' /
   UPOPGRP   'UCR POPULATION GROUP' /
   UPOPTOT   'UCR TOTAL POPULATION COVERED (UPOP1,2,3)' /
   UPOP1     'UCR POPULATION COVERED 1' /
   UPOP2     'UCR POPULATION COVERED 2' /
   UPOP3     'UCR POPULATION COVERED 3' /
   UDIV      'DIVISION' /
   UJUVAGE   'JUVENILE AGE' /
   UCORE     'CORE CITY' /
   ULASTUP   'LAST UPDATED' /
   CPOP      'CSLLEA 2000 POPULATION' /
   LAT       'LATITUDE' /
   LONG      'LONGITUDE' /
   POP       'POPULATION FOR FIPS PLACE CODE' /
   HOUSE     'TOTAL HOUSING UNITS' /
   MILES     'TOTAL AREA IN SQUARE MILES' /
   ZIPCODE   'ZIP CODE (LOWEST)' /
   ZIPRANGE  'ZIP CODE RANGE' /
   SOURCE    'SOURCE OF RECORD' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   STATE     'AK' 'Alaska' 'AL' 'Alabama' 'AR' 'Arkansas' 'AZ' 'Arizona'
             'CA' 'California' 'CO' 'Colorado' 'CT' 'Connecticut'
             'CZ' 'Canal Zone' 'DC' 'District of Columbia' 'DE' 'Delaware'
             'FL' 'Florida' 'GA' 'Georgia' 'GU' 'Guam' 'HI' 'Hawaii'
             'IA' 'Iowa' 'ID' 'Idaho' 'IL' 'Illinois' 'IN' 'Indiana'
             'KS' 'Kansas' 'KY' 'Kentucky' 'LA' 'Louisiana'
             'MA' 'Massachusetts' 'MD' 'Maryland' 'ME' 'Maine'
             'MI' 'Michigan' 'MN' 'Minnesota' 'MO' 'Missouri'
             'MS' 'Mississippi' 'MT' 'Montana' 'NC' 'North Carolina'
             'ND' 'North Dakota' 'NE' 'Nebraska' 'NH' 'New Hampshire'
             'NJ' 'New Jersey' 'NM' 'New Mexico' 'NV' 'Nevada'
             'NY' 'New York' 'OH' 'Ohio' 'OK' 'Oklahoma' 'OR' 'Oregon'
             'PA' 'Pennsylvania' 'PR' 'Puerto Rico' 'RI' 'Rhodes Island'
             'SC' 'South Carolina' 'SD' 'South Dakota' 'TN' 'Tennessee'
             'TX' 'Texas' 'UT' 'Utah' 'VA' 'Virginia' 'VT' 'Vermont'
             'WA' 'Washington' 'WI' 'Wisconsin' 'WV' 'West Virginia'
             'WY' 'Wyoming' /
   FSTATE    1 'Alabama' 2 'Alaska' 4 'Arizona' 5 'Arkansas' 6 'California'
             8 'Colorado' 9 'Connecticut' 10 'Delaware'
             11 'District of Columbia' 12 'Florida' 13 'Georgia' 15 'Hawaii'
             16 'Idaho' 17 'Illinois' 18 'Indiana' 19 'Iowa' 20 'Kansas'
             21 'Kentucky' 22 'Louisiana' 23 'Maine' 24 'Maryland'
             25 'Massachusetts' 26 'Michigan' 27 'Minnesota' 28 'Mississippi'
             29 'Missouri' 30 'Montana' 31 'Nebraska' 32 'Nevada'
             33 'New Hampshire' 34 'New Jersey' 35 'New Mexico' 36 'New York'
             37 'North Carolina' 38 'North Dakota' 39 'Ohio' 40 'Oklahoma'
             41 'Oregon' 42 'Pennsylvania' 44 'Rhodes Island'
             45 'South Carolina' 46 'South Dakota' 47 'Tennessee' 48 'Texas'
             49 'Utah' 50 'Vermont' 51 'Virginia' 53 'Washington'
             54 'West Virginia' 55 'Wisconsin' 56 'Wyoming' 57 'Canal Zone'
             66 'Guam' 72 'Puerto Rico' 99 'Undetermined' /
   FCOUNTY   999 'Undetermined' /
   FPLACE    99999 'Undetermined' /
   FMSA      9999 'See codebook' /
   GOVIDNU   6000000 'Federal' 10000000 'Alabama' 20000000 'Alaska'
             30000000 'Arizona' 40000000 'Arkansas' 50000000 'California'
             60000000 'Colorado' 70000000 'Connecticut' 80000000 'Delaware'
             100000000 'Florida' 110000000 'Georgia' 120000000 'Hawaii'
             130000000 'Idaho' 140000000 'Illinois' 150000000 'Indiana'
             160000000 'Iowa' 170000000 'Kansas' 180000000 'Kentucky'
             190000000 'Louisiana' 200000000 'Maine' 210000000 'Maryland'
             220000000 'Massachusetts' 230000000 'Michigan'
             240000000 'Minnesota' 250000000 'Mississippi'
             260000000 'Missouri' 270000000 'Montana' 280000000 'Nebraska'
             290000000 'Nevada' 300000000 'New Hampshire'
             310000000 'New Jersey' 320000000 'New Mexico'
             330000000 'New York' 340000000 'North Carolina'
             350000000 'North Dakota' 360000000 'Ohio' 370000000 'Oklahoma'
             380000000 'Oregon' 390000000 'Pennsylvania'
             400000000 'Rhode Island' 410000000 'South Carolina'
             420000000 'South Dakota' 430000000 'Tennessee' 440000000 'Texas'
             450000000 'Utah' 460000000 'Vermont' 470000000 'Virginia'
             480000000 'Washington' 490000000 'West Virginia'
             500000000 'Wisconsin' 530000000 'Guam' 550000000 'Puerto Rico'
             570000000 'Canal Zone' 997777777 'Tribal'
             999999999 'Undetermined' /
   GOVTYPE   0 'State' 1 'County' 2 'Municipal' 3 'Township'
             4 'Special district' 5 'Independent school district' 6 'Federal'
             7 'Tribal' 99 'Undetermined' /
   AGENTYPE  1 'Sheriff' 2 'County police' 3 'Municipal police'
             5 'Primary state LE' 6 'Special police' 7 'Constable' 8 'Tribal'
             9 'Regional police' /
   SPECFUNC  1 'Airport' 2 'College/university' 3 'Schools - K12'
             4 'Hospitals' 5 'Railroad' 6 'Federal' 7 'Tribal' /
   MULTPLC   1 'Multiple places' /
   HQCODE    1 'HQ location' /
   USTATENO  1 'Alabama' 2 'Arizona' 3 'Arkansas' 4 'California' 5 'Colorado'
             6 'Connecticut' 7 'Delaware' 8 'District of Columbia'
             9 'Florida' 10 'Georgia' 11 'Idaho' 12 'Illinois' 13 'Indiana'
             14 'Iowa' 15 'Kansas' 16 'Kentucky' 17 'Louisiana' 18 'Maine'
             19 'Maryland' 20 'Massachusetts' 21 'Michigan' 22 'Minnesota'
             23 'Mississippi' 24 'Missouri' 25 'Montana' 26 'Nebraska'
             27 'Nevada' 28 'New Hampshire' 29 'New Jersey' 30 'New Mexico'
             31 'New York' 32 'North Carolina' 33 'North Dakota' 34 'Ohio'
             35 'Oklahoma' 36 'Oregon' 37 'Pennsylvania' 38 'Rhodes Island'
             39 'South Carolina' 40 'South Dakota' 41 'Tennessee' 42 'Texas'
             43 'Utah' 44 'Vermont' 45 'Virginia' 46 'Washington'
             47 'West Virginia' 48 'Wisconsin' 49 'Wyoming' 50 'Alaska'
             51 'Hawaii' 52 'Canal Zone' 53 'Puerto Rico' 55 'Guam' /
   UMULTICO  1 'Multiple counties' /
   UPOPGRP   0 'Possessions' 1 'All cities 250,000 or over'
             2 'Cities 1,000,000 or over' 3 'Cities from 500,000-999,000'
             4 'Cities from 250,000-499,999' 5 'Cities from 100,000-249,000'
             6 'Cities from 50,000-99,999' 7 'Cities from 25,000-49,999'
             8 'Cities from 10,000-24,999' 9 'Cities from 2,500-9,999'
             10 'Cities under 2,500' 11 'Non-MSA counties'
             12 'Non-MSA counties 100,000 or over'
             13 'Non-MSA counties from 25,000-99,999'
             14 'Non-MSA counties from 10,000-24,999'
             15 'Non-MSA counties under 10,000' 16 'Non-MSA State Police'
             17 'MSA counties' 18 'MSA counties 100,000 or over'
             19 'MSA counties from 25,000-99,999'
             20 'MSA counties from 10,000-24,999'
             21 'MSA counties under 10,000' 22 'MSA State Police' /
   UDIV      0 'Possessions' 1 'New England' 2 'Middle Atlantic'
             3 'East North Central' 4 'West North Central' 5 'South Atlantic'
             6 'East South Central' 7 'West South Central' 8 'Mountain'
             9 'Pacific' /
   CPOP      8888888888 'Not applicable' /
   SOURCE    1 'UCR Only' 2 'CSLLEA Only' 3 'Both UCR and CSLLEA' /
   .

EXECUTE.

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
