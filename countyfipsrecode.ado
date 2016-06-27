program define countyfipsrecode, rclass
    * parse (statefips 2 digit, then countyfips 3 digit, both in numeric format)
    syntax varlist(min=2 max=2 numeric) [if] [in] [, collapsealaska collapsehawaii collapsemontana collapsenyc virginiacombos noisily]
    marksample touse, strok
    tokenize `varlist'
    local s `1'
    local c `2'
    if strlen("`noisily'")==0 + !`c(noisily)' {
        local noisily "quietly"
    }
    // sorted by input statefips and countyfips
    `noisily' replace `c' =  .a if `touse' &           `c'==  0 // Medicaid out of state but eligible
    `noisily' replace `c' =  .b if `touse' &           `c'==999 // Medicaid county unknown
    `noisily' replace `c' =  .c if `touse' & `s'== 1 & `c'==100 //
    `noisily' replace `c' =  10 if `touse' & `s'== 2 & `c'== 13 // Aleutian Islands CA 02010 split into East Borough 02013 and West CA 02016 1987
    `noisily' replace `c' =  10 if `touse' & `s'== 2 & `c'== 16 // Aleutian Islands CA 02010 split into East Borough 02013 and West CA 02016 1987
    `noisily' replace `c' = 910 if `touse' & `s'== 2 & `c'== 70 //
    `noisily' replace `c' = 232 if `touse' & `s'== 2 & `c'==105 //
    `noisily' replace `c' = 910 if `touse' & `s'== 2 & `c'==164 //
    `noisily' replace `c' = 232 if `touse' & `s'== 2 & `c'==230 //
    `noisily' replace `c' = 231 if `touse' & `s'== 2 & `c'==232 //
    `noisily' replace `c' = 158 if `touse' & `s'== 2 & `c'==270 // Kusilvak CA renamed Wade Hampton CA 2015
    `noisily' replace `c' = 231 if `touse' & `s'== 2 & `c'==282 // Skagway-Yakutat-Angoon CA 02231 split into Skagway-Hoonah-Angoon CA 02232 and Yakutat City and Borough 02282 1992
    `noisily' replace `c' = 910 if `touse' & `s'== 4 & `c'== 12 //
    `noisily' replace `c' = 910 if `touse' & `s'== 4 & `c'== 27 //
    `noisily' replace `c' = 911 if `touse' & `s'== 8 & `c'==  1 //
    `noisily' replace `c' = 912 if `touse' & `s'== 8 & `c'== 13 //
    `noisily' replace `c' = 913 if `touse' & `s'== 8 & `c'== 59 //
    `noisily' replace `c' = 914 if `touse' & `s'== 8 & `c'==123 //
    `noisily' replace `c' =  .c if `touse' & `s'==12 & `c'== 25 //
    `noisily' replace `c' =  86 if `touse' & `s'==12 & `c'== 25 // Dade County renamed Miami-Dade county 1997
    `noisily' replace `c' =  .c if `touse' & `s'==18 & `c'==990 //
    `noisily' replace `c' =  .c if `touse' & `s'==24 & `c'==  6 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'==  2 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'==  4 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'==  6 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 14 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 16 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 18 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 20 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 24 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 30 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 34 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 38 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 40 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 42 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 44 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 46 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 50 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 52 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 54 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 60 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 64 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 66 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 74 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 76 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 78 //
    `noisily' replace `c' =  .c if `touse' & `s'==28 & `c'== 82 //
    `noisily' replace `c' =  .c if `touse' & `s'==29 & `c'==193 //
    `noisily' replace `c' = 186 if `touse' & `s'==29 & `c'==193 //
    `noisily' replace `c' =  .c if `touse' & `s'==32 & `c'==703 //
    `noisily' replace `c' =  .c if `touse' & `s'==32 & `c'==731 //
    `noisily' replace `c' =  .c if `touse' & `s'==32 & `c'==803 //
    `noisily' replace `c' =  .c if `touse' & `s'==32 & `c'==831 //
    `noisily' replace `c' =  .c if `touse' & `s'==32 & `c'==975 //
    `noisily' replace `c' =  .c if `touse' & `s'==41 & `c'== 93 //
    `noisily' replace `c' = 102 if `touse' & `s'==46 & `c'==113 // Shannon County renamed Oglala Lakota County 2015
    `noisily' replace `c' =  19 if `touse' & `s'==51 & `c'==515 // City of Bedford absorbed by Bedford County 2013
    `noisily' replace `c' =   5 if `touse' & `s'==51 & `c'==560 // City of Clifton Forge absorbed by Alleghany County 2000s
    `noisily' replace `c' =  83 if `touse' & `s'==51 & `c'==780 // City of South Boston absorbed by Halifax County 1995
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==975 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==983 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==984 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==985 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==986 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==988 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==989 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==990 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==991 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==992 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==993 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==994 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==995 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==996 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==997 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==51 & `c'==998 // City/county comb.:
    `noisily' replace `c' =  .c if `touse' & `s'==53 & `c'== 50 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'== 86 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'== 88 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'== 92 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==160 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==180 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==182 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==183 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==184 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==186 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==191 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==260 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==360 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==460 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==555 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==630 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==660 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==696 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==801 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==802 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==806 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==807 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==809 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==815 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==816 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==818 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==819 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==823 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==830 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==836 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==837 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==838 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==840 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==841 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==843 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==844 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==845 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==849 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==851 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==861 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==862 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==863 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==871 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==873 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==877 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==878 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==879 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==881 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==883 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==887 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==892 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==898 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==902 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==933 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==935 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==937 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==950 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==952 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==953 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==954 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==955 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==956 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==957 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==959 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==961 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==962 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==964 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==967 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==969 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==970 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==971 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==972 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==973 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==974 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==976 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==977 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==978 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==979 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==980 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==982 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==983 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==985 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==986 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==987 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==989 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==991 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==992 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==993 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==994 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==997 //
    `noisily' replace `c' =  .c if `touse' & `s'==55 & `c'==998 //
    `noisily' replace `c' =  .c if `touse' & `s'==56 & `c'== 99 //
    if "`collapsealaska'"=="collapsealaska" {
        `noisily' replace `c' = 900 if `touse' & `s'== 2 // reduce alaska to one fips
    }
    if "`collapsehawaii'"=="collapsehawaii" {
        `noisily' replace `c' = 900 if `touse' & `s'==15 // reduce hawaii to one fips
    }
    if "`collapsemontana'"=="collapsemontana" {
        `noisily' replace `c' = 900 if `touse' & `s'==30 // reduce montana to one fips
    }
    if "`collapsenyc'"=="collapsenyc" {
        `noisily' replace `c' = 902 if `touse' & `s'==36 & inlist(`s',  5, 47, 61, 81, 85) // reduce nyc counties to one fips
    }
    if "`virginiacombos'"=="virginiacombos" { // sorted by output county fips
        `noisily' replace `c' = 910 if `touse' & `s'==35 & `c'==  6 //
        `noisily' replace `c' = 910 if `touse' & `s'==35 & `c'== 61 //
        `noisily' replace `c' = 910 if `touse' & `s'==51 & `c'==153 //
        `noisily' replace `c' = 910 if `touse' & `s'==51 & `c'==683 //
        `noisily' replace `c' = 910 if `touse' & `s'==51 & `c'==685 //
        `noisily' replace `c' = 911 if `touse' & `s'==51 & `c'== 95 //
        `noisily' replace `c' = 911 if `touse' & `s'==51 & `c'==199 //
        `noisily' replace `c' = 911 if `touse' & `s'==51 & `c'==735 //
        `noisily' replace `c' = 911 if `touse' & `s'==51 & `c'==830 //
        `noisily' replace `c' = 913 if `touse' & `s'==51 & `c'== 89 //
        `noisily' replace `c' = 913 if `touse' & `s'==51 & `c'==690 //
        `noisily' replace `c' = 914 if `touse' & `s'==51 & `c'==165 //
        `noisily' replace `c' = 914 if `touse' & `s'==51 & `c'==660 //
        `noisily' replace `c' = 915 if `touse' & `s'==51 & `c'==177 //
        `noisily' replace `c' = 915 if `touse' & `s'==51 & `c'==179 //
        `noisily' replace `c' = 915 if `touse' & `s'==51 & `c'==630 //
        `noisily' replace `c' = 916 if `touse' & `s'==51 & `c'==  5 //
        `noisily' replace `c' = 916 if `touse' & `s'==51 & `c'==560 //
        `noisily' replace `c' = 916 if `touse' & `s'==51 & `c'==580 //
        `noisily' replace `c' = 917 if `touse' & `s'==51 & `c'== 19 //
        `noisily' replace `c' = 917 if `touse' & `s'==51 & `c'==515 //
        `noisily' replace `c' = 918 if `touse' & `s'==51 & `c'== 13 //
        `noisily' replace `c' = 918 if `touse' & `s'==51 & `c'== 59 //
        `noisily' replace `c' = 918 if `touse' & `s'==51 & `c'==510 //
        `noisily' replace `c' = 918 if `touse' & `s'==51 & `c'==600 //
        `noisily' replace `c' = 918 if `touse' & `s'==51 & `c'==610 //
    }
end
