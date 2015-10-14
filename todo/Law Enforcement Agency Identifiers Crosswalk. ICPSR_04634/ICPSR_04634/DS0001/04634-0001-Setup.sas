*-------------------------------------------------------------------------*
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 04634
 |          LAW ENFORCEMENT AGENCY IDENTIFIERS CROSSWALK [UNITED
 |                             STATES], 2005
 |
 |
 | SAS setup sections are provided for the ASCII version of this data
 | collection.  These sections are listed below:
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions. Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS data set.
 |
 | INFILE:  identifies the input file to be read with the input statement.
 | Users must replace the "data-filename" with a filename specifying the
 | directory on the user's computer system in which the downloaded and
 | unzipped data file is physically located (e.g.,
 | "c:\temp\04634-0001-data.txt").
 |
 | INPUT:  assigns the name, type, decimal specification (if any), and
 | specifies the beginning and ending column locations for each variable
 | in the data file.
 |
 | LABEL:  assigns descriptive labels to all variables. Variable labels
 | and variable names may be identical for some variables.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in this section.
 |
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables named in the INPUT statement.
 |
 | NOTE:  Users should modify this setup file to suit their specific needs.
 | Sections for PROC FORMAT, FORMAT, and MISSING VALUE RECODES have been
 | commented out (i.e., '/*'). To include these sections in the final SAS
 | setup, users should remove the SAS comment indicators from the desired
 | section(s).
 |
 *------------------------------------------------------------------------;

* SAS PROC FORMAT;

/*
PROC FORMAT;
  VALUE $state    'AK'='(AK) Alaska' 'AL'='(AL) Alabama' 'AR'='(AR) Arkansas' 'AZ'='(AZ) Arizona'
                  'CA'='(CA) California' 'CO'='(CO) Colorado' 'CT'='(CT) Connecticut'
                  'CZ'='(CZ) Canal Zone' 'DC'='(DC) District of Columbia'
                  'DE'='(DE) Delaware' 'FL'='(FL) Florida' 'GA'='(GA) Georgia' 'GU'='(GU) Guam'
                  'HI'='(HI) Hawaii' 'IA'='(IA) Iowa' 'ID'='(ID) Idaho' 'IL'='(IL) Illinois'
                  'IN'='(IN) Indiana' 'KS'='(KS) Kansas' 'KY'='(KY) Kentucky'
                  'LA'='(LA) Louisiana' 'MA'='(MA) Massachusetts' 'MD'='(MD) Maryland'
                  'ME'='(ME) Maine' 'MI'='(MI) Michigan' 'MN'='(MN) Minnesota'
                  'MO'='(MO) Missouri' 'MS'='(MS) Mississippi' 'MT'='(MT) Montana'
                  'NC'='(NC) North Carolina' 'ND'='(ND) North Dakota' 'NE'='(NE) Nebraska'
                  'NH'='(NH) New Hampshire' 'NJ'='(NJ) New Jersey' 'NM'='(NM) New Mexico'
                  'NV'='(NV) Nevada' 'NY'='(NY) New York' 'OH'='(OH) Ohio' 'OK'='(OK) Oklahoma'
                  'OR'='(OR) Oregon' 'PA'='(PA) Pennsylvania' 'PR'='(PR) Puerto Rico'
                  'RI'='(RI) Rhodes Island' 'SC'='(SC) South Carolina'
                  'SD'='(SD) South Dakota' 'TN'='(TN) Tennessee' 'TX'='(TX) Texas'
                  'UT'='(UT) Utah' 'VA'='(VA) Virginia' 'VT'='(VT) Vermont'
                  'WA'='(WA) Washington' 'WI'='(WI) Wisconsin' 'WV'='(WV) West Virginia'
                  'WY'='(WY) Wyoming' ;
  VALUE fstate    1='(1) Alabama' 2='(2) Alaska' 4='(4) Arizona' 5='(5) Arkansas'
                  6='(6) California' 8='(8) Colorado' 9='(9) Connecticut' 10='(10) Delaware'
                  11='(11) District of Columbia' 12='(12) Florida' 13='(13) Georgia'
                  15='(15) Hawaii' 16='(16) Idaho' 17='(17) Illinois' 18='(18) Indiana' 19='(19) Iowa'
                  20='(20) Kansas' 21='(21) Kentucky' 22='(22) Louisiana' 23='(23) Maine'
                  24='(24) Maryland' 25='(25) Massachusetts' 26='(26) Michigan'
                  27='(27) Minnesota' 28='(28) Mississippi' 29='(29) Missouri' 30='(30) Montana'
                  31='(31) Nebraska' 32='(32) Nevada' 33='(33) New Hampshire'
                  34='(34) New Jersey' 35='(35) New Mexico' 36='(36) New York'
                  37='(37) North Carolina' 38='(38) North Dakota' 39='(39) Ohio'
                  40='(40) Oklahoma' 41='(41) Oregon' 42='(42) Pennsylvania'
                  44='(44) Rhodes Island' 45='(45) South Carolina' 46='(46) South Dakota'
                  47='(47) Tennessee' 48='(48) Texas' 49='(49) Utah' 50='(50) Vermont'
                  51='(51) Virginia' 53='(53) Washington' 54='(54) West Virginia'
                  55='(55) Wisconsin' 56='(56) Wyoming' 57='(57) Canal Zone' 66='(66) Guam'
                  72='(72) Puerto Rico' 99='(99) Undetermined' ;
  VALUE fcounty   999='(999) Undetermined' ;
  VALUE fplace    99999='(99999) Undetermined' ;
  VALUE fmsa      9999='(9999) See codebook' ;
  VALUE govidnu   6000000='(6000000) Federal' 10000000='(10000000) Alabama' 20000000='(20000000) Alaska'
                  30000000='(30000000) Arizona' 40000000='(40000000) Arkansas'
                  50000000='(50000000) California' 60000000='(60000000) Colorado'
                  70000000='(70000000) Connecticut' 80000000='(80000000) Delaware'
                  100000000='(100000000) Florida' 110000000='(110000000) Georgia' 120000000='(120000000) Hawaii'
                  130000000='(130000000) Idaho' 140000000='(140000000) Illinois' 150000000='(150000000) Indiana'
                  160000000='(160000000) Iowa' 170000000='(170000000) Kansas' 180000000='(180000000) Kentucky'
                  190000000='(190000000) Louisiana' 200000000='(200000000) Maine'
                  210000000='(210000000) Maryland' 220000000='(220000000) Massachusetts'
                  230000000='(230000000) Michigan' 240000000='(240000000) Minnesota'
                  250000000='(250000000) Mississippi' 260000000='(260000000) Missouri'
                  270000000='(270000000) Montana' 280000000='(280000000) Nebraska' 290000000='(290000000) Nevada'
                  300000000='(300000000) New Hampshire' 310000000='(310000000) New Jersey'
                  320000000='(320000000) New Mexico' 330000000='(330000000) New York'
                  340000000='(340000000) North Carolina' 350000000='(350000000) North Dakota'
                  360000000='(360000000) Ohio' 370000000='(370000000) Oklahoma' 380000000='(380000000) Oregon'
                  390000000='(390000000) Pennsylvania' 400000000='(400000000) Rhode Island'
                  410000000='(410000000) South Carolina' 420000000='(420000000) South Dakota'
                  430000000='(430000000) Tennessee' 440000000='(440000000) Texas' 450000000='(450000000) Utah'
                  460000000='(460000000) Vermont' 470000000='(470000000) Virginia'
                  480000000='(480000000) Washington' 490000000='(490000000) West Virginia'
                  500000000='(500000000) Wisconsin' 530000000='(530000000) Guam'
                  550000000='(550000000) Puerto Rico' 570000000='(570000000) Canal Zone'
                  997777777='(997777777) Tribal' 999999999='(999999999) Undetermined' ;
  VALUE govtype   0='(0) State' 1='(1) County' 2='(2) Municipal' 3='(3) Township'
                  4='(4) Special district' 5='(5) Independent school district'
                  6='(6) Federal' 7='(7) Tribal' 99='(99) Undetermined' ;
  VALUE agentype  1='(1) Sheriff' 2='(2) County police' 3='(3) Municipal police'
                  5='(5) Primary state LE' 6='(6) Special police' 7='(7) Constable'
                  8='(8) Tribal' 9='(9) Regional police' ;
  VALUE specfunc  1='(1) Airport' 2='(2) College/university' 3='(3) Schools - K12'
                  4='(4) Hospitals' 5='(5) Railroad' 6='(6) Federal' 7='(7) Tribal' ;
  VALUE multplc   1='(1) Multiple places' ;
  VALUE hqcode    1='(1) HQ location' ;
  VALUE ustateno  1='(1) Alabama' 2='(2) Arizona' 3='(3) Arkansas' 4='(4) California'
                  5='(5) Colorado' 6='(6) Connecticut' 7='(7) Delaware'
                  8='(8) District of Columbia' 9='(9) Florida' 10='(10) Georgia'
                  11='(11) Idaho' 12='(12) Illinois' 13='(13) Indiana' 14='(14) Iowa' 15='(15) Kansas'
                  16='(16) Kentucky' 17='(17) Louisiana' 18='(18) Maine' 19='(19) Maryland'
                  20='(20) Massachusetts' 21='(21) Michigan' 22='(22) Minnesota'
                  23='(23) Mississippi' 24='(24) Missouri' 25='(25) Montana' 26='(26) Nebraska'
                  27='(27) Nevada' 28='(28) New Hampshire' 29='(29) New Jersey'
                  30='(30) New Mexico' 31='(31) New York' 32='(32) North Carolina'
                  33='(33) North Dakota' 34='(34) Ohio' 35='(35) Oklahoma' 36='(36) Oregon'
                  37='(37) Pennsylvania' 38='(38) Rhodes Island' 39='(39) South Carolina'
                  40='(40) South Dakota' 41='(41) Tennessee' 42='(42) Texas' 43='(43) Utah'
                  44='(44) Vermont' 45='(45) Virginia' 46='(46) Washington'
                  47='(47) West Virginia' 48='(48) Wisconsin' 49='(49) Wyoming' 50='(50) Alaska'
                  51='(51) Hawaii' 52='(52) Canal Zone' 53='(53) Puerto Rico' 55='(55) Guam' ;
  VALUE umultico  1='(1) Multiple counties' ;
  VALUE upopgrp   0='(0) Possessions' 1='(1) All cities 250,000 or over'
                  2='(2) Cities 1,000,000 or over'
                  3='(3) Cities from 500,000-999,000'
                  4='(4) Cities from 250,000-499,999'
                  5='(5) Cities from 100,000-249,000'
                  6='(6) Cities from 50,000-99,999' 7='(7) Cities from 25,000-49,999'
                  8='(8) Cities from 10,000-24,999' 9='(9) Cities from 2,500-9,999'
                  10='(10) Cities under 2,500' 11='(11) Non-MSA counties'
                  12='(12) Non-MSA counties 100,000 or over'
                  13='(13) Non-MSA counties from 25,000-99,999'
                  14='(14) Non-MSA counties from 10,000-24,999'
                  15='(15) Non-MSA counties under 10,000'
                  16='(16) Non-MSA State Police' 17='(17) MSA counties'
                  18='(18) MSA counties 100,000 or over'
                  19='(19) MSA counties from 25,000-99,999'
                  20='(20) MSA counties from 10,000-24,999'
                  21='(21) MSA counties under 10,000' 22='(22) MSA State Police' ;
  VALUE udiv      0='(0) Possessions' 1='(1) New England' 2='(2) Middle Atlantic'
                  3='(3) East North Central' 4='(4) West North Central'
                  5='(5) South Atlantic' 6='(6) East South Central'
                  7='(7) West South Central' 8='(8) Mountain' 9='(9) Pacific' ;
  VALUE cpop      8888888888='(8888888888) Not applicable' ;
  VALUE source    1='(1) UCR Only' 2='(2) CSLLEA Only' 3='(3) Both UCR and CSLLEA' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=703;
INPUT
        STATE $1-2              COUNTY $3-37
        AGENCY $38-187          FSTATE 188-189          FCOUNTY 190-192
        FPLACE 193-197          PLACENM $198-249        FMSA 250-253
        FMSANAME $254-318       GOVIDNU 319-327         GOVNAME $328-391
        GOVTYPE 392-393         AGENCYID $394-409       AGENTYPE 410
        SPECFUNC 411-412        MULTPLC 413             HQCODE 414-421
        CLASSCD $422-423        PARTOFCD 424-428        PARTOFNM $429-480
        OTHCODE 481-485         OTHNAME $486-537        ORI7 $538-544
        ORI9 $545-553           UCOVBY $554-560         USTATENO 561-562
        UMULTICO 563            UCNTY1 564-566          UCNTY2 567-569
        UCNTY3 570-572          UMSA1 573-575           UMSA2 576-578
        UMSA3 579-581           UPOPGRP 582-583         UPOPTOT 584-592
        UPOP1 593-601           UPOP2 602-610           UPOP3 611-619
        UDIV 620                UJUVAGE 621-622         UCORE $623
        ULASTUP 624-629         CPOP 630-640            LAT 641-652 .6
        LONG 653-664 .6         POP 665-673             HOUSE 674-681
        MILES 682-695 .6        ZIPCODE 696-700         ZIPRANGE 701-702
        SOURCE 703              ;


* SAS LABEL STATEMENT;

LABEL
   STATE   = 'ALPHA STATE CODE'
   COUNTY  = 'COUNTY NAME'
   AGENCY  = 'AGENCY NAME'
   FSTATE  = 'FIPS STATE CODE'
   FCOUNTY = 'FIPS COUNTY CODE'
   FPLACE  = 'FIPS PLACE CODE'
   PLACENM = 'PLACE NAME'
   FMSA    = 'FIPS MSA CODE'
   FMSANAME= 'FIPS MSA NAME'
   GOVIDNU = 'GOVERNMENT ID (NUMERIC)'
   GOVNAME = 'GOVERNMENT NAME'
   GOVTYPE = 'GOVERNMENT TYPE'
   AGENCYID= 'CENSUS 16 CHARACTER ID (STRING)'
   AGENTYPE= 'TYPE OF AGENCY'
   SPECFUNC= 'SPECIAL FUNCTION'
   MULTPLC = 'FLAG: AGENCY COVERS MULTIPLE PLACES'
   HQCODE  = 'FLAG: HEADQUARTERS LOCATION FIPS'
   CLASSCD = 'ENTITY CLASS CODE (SEE CODEBOOK)'
   PARTOFCD= 'ENTITY PART OF CODE'
   PARTOFNM= 'ENTITY PART OF NAME'
   OTHCODE = 'OTHER NAME CODE'
   OTHNAME = 'OTHER NAME'
   ORI7    = 'ORIGINATING AGENCY IDENTIFIER (7 CHARACTER)'
   ORI9    = 'ORIGINATING AGENCY IDENTIFIER (9 CHARACTER)'
   UCOVBY  = 'UCR COVERED BY AGENCY ORI'
   USTATENO= 'UCR STATE NUMBER'
   UMULTICO= 'UCR MULTIPLE COUNTY FLAG'
   UCNTY1  = 'UCR COUNTY NUMBER 1'
   UCNTY2  = 'UCR COUNTY NUMBER 2'
   UCNTY3  = 'UCR COUNTY NUMBER 3'
   UMSA1   = 'UCR MSA NUMBER 1'
   UMSA2   = 'UCR MSA NUMBER 2'
   UMSA3   = 'UCR MSA NUMBER 3'
   UPOPGRP = 'UCR POPULATION GROUP'
   UPOPTOT = 'UCR TOTAL POPULATION COVERED (UPOP1,2,3)'
   UPOP1   = 'UCR POPULATION COVERED 1'
   UPOP2   = 'UCR POPULATION COVERED 2'
   UPOP3   = 'UCR POPULATION COVERED 3'
   UDIV    = 'DIVISION'
   UJUVAGE = 'JUVENILE AGE'
   UCORE   = 'CORE CITY'
   ULASTUP = 'LAST UPDATED'
   CPOP    = 'CSLLEA 2000 POPULATION'
   LAT     = 'LATITUDE'
   LONG    = 'LONGITUDE'
   POP     = 'POPULATION FOR FIPS PLACE CODE'
   HOUSE   = 'TOTAL HOUSING UNITS'
   MILES   = 'TOTAL AREA IN SQUARE MILES'
   ZIPCODE = 'ZIP CODE (LOWEST)'
   ZIPRANGE= 'ZIP CODE RANGE'
   SOURCE  = 'SOURCE OF RECORD'
        ;


* SAS FORMAT STATEMENT;

/*
  FORMAT STATE $state. FSTATE fstate. FCOUNTY fcounty.
         FPLACE fplace. FMSA fmsa. GOVIDNU govidnu.
         GOVTYPE govtype. AGENTYPE agentype. SPECFUNC specfunc.
         MULTPLC multplc. HQCODE hqcode. USTATENO ustateno.
         UMULTICO umultico. UPOPGRP upopgrp. UDIV udiv.
         CPOP cpop. SOURCE source.  ;
*/

RUN ;
