program define countyfipsrecode, rclass
	* parse (statefips 2 digit, then countyfips 3 digit, both in numeric format)
	syntax varlist(min=2 max=2 numeric) [if] [in] [, collapsealaska collapsehawaii collapsemontana collapsenyc virginiacombos noisily]
	marksample touse, strok
	tokenize `varlist'
    local statefips `1'
    local countyfips `2'
	if strlen("`noisily'")==0 {
		local noisily "quietly"
	}
	`noisily' replace `countyfips' =  .a if `touse' & 					`countyfips'==  0				// Medicaid out of state but eligible
	`noisily' replace `countyfips' =  .b if `touse' & 					`countyfips'==999 				// Medicaid county unknown
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'== 1 & `countyfips'==100				//
	`noisily' replace `countyfips' =  10 if `touse' & `statefips'== 2 & `countyfips'== 13          	    //
	`noisily' replace `countyfips' =  10 if `touse' & `statefips'== 2 & `countyfips'== 16          	    //
	`noisily' replace `countyfips' = 910 if `touse' & `statefips'== 2 & `countyfips'== 70          	    //
	`noisily' replace `countyfips' = 232 if `touse' & `statefips'== 2 & `countyfips'==105          	    //
	`noisily' replace `countyfips' = 910 if `touse' & `statefips'== 2 & `countyfips'==164          	    //
	`noisily' replace `countyfips' = 232 if `touse' & `statefips'== 2 & `countyfips'==230          	    //
	`noisily' replace `countyfips' = 231 if `touse' & `statefips'== 2 & `countyfips'==232          	    //
	`noisily' replace `countyfips' = 158 if `touse' & `statefips'== 2 & `countyfips'==270          	    // Kusilvak CA renamed Wade Hampton CA 2015
	`noisily' replace `countyfips' = 231 if `touse' & `statefips'== 2 & `countyfips'==282          	    //
	`noisily' replace `countyfips' = 910 if `touse' & `statefips'== 4 & `countyfips'== 12          	    //
	`noisily' replace `countyfips' = 910 if `touse' & `statefips'== 4 & `countyfips'== 27          	    //
	`noisily' replace `countyfips' = 911 if `touse' & `statefips'== 8 & `countyfips'==  1          	    //
	`noisily' replace `countyfips' = 912 if `touse' & `statefips'== 8 & `countyfips'== 13          	    //
	`noisily' replace `countyfips' = 913 if `touse' & `statefips'== 8 & `countyfips'== 59          	    //
	`noisily' replace `countyfips' = 914 if `touse' & `statefips'== 8 & `countyfips'==123          	    //
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==12 & `countyfips'== 25				//
	`noisily' replace `countyfips' =  86 if `touse' & `statefips'==12 & `countyfips'== 25          	    // Dade County renamed Miami-Dade county 1997
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==18 & `countyfips'==990				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==24 & `countyfips'==  6				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'==  2				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'==  4				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'==  6				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 14				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 16				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 18				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 20				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 24				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 30				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 34				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 38				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 40				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 42				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 44				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 46				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 50				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 52				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 54				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 60				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 64				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 66				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 74				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 76				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 78				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==28 & `countyfips'== 82				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==29 & `countyfips'==193				//
	`noisily' replace `countyfips' = 186 if `touse' & `statefips'==29 & `countyfips'==193          	    //
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==32 & `countyfips'==703				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==32 & `countyfips'==731				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==32 & `countyfips'==803				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==32 & `countyfips'==831				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==32 & `countyfips'==975				//
	`noisily' replace `countyfips' = 910 if `touse' & `statefips'==35 & `countyfips'==  6          	    //
	`noisily' replace `countyfips' = 910 if `touse' & `statefips'==35 & `countyfips'== 61          	    //
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==41 & `countyfips'== 93				//
	`noisily' replace `countyfips' = 102 if `touse' & `statefips'==46 & `countyfips'==113				// Shannon County renamed Oglala Lakota County 2015
	`noisily' replace `countyfips' = 916 if `touse' & `statefips'==51 & `countyfips'==  5          	    //
	`noisily' replace `countyfips' = 918 if `touse' & `statefips'==51 & `countyfips'== 13          	    //
	`noisily' replace `countyfips' = 917 if `touse' & `statefips'==51 & `countyfips'== 19          	    //
	`noisily' replace `countyfips' = 918 if `touse' & `statefips'==51 & `countyfips'== 59          	    //
	`noisily' replace `countyfips' = 913 if `touse' & `statefips'==51 & `countyfips'== 89          	    //
	`noisily' replace `countyfips' = 911 if `touse' & `statefips'==51 & `countyfips'== 95          	    //
	`noisily' replace `countyfips' = 910 if `touse' & `statefips'==51 & `countyfips'==153          	    //
	`noisily' replace `countyfips' = 914 if `touse' & `statefips'==51 & `countyfips'==165          	    //
	`noisily' replace `countyfips' = 915 if `touse' & `statefips'==51 & `countyfips'==177          	    //
	`noisily' replace `countyfips' = 915 if `touse' & `statefips'==51 & `countyfips'==179          	    //
	`noisily' replace `countyfips' = 911 if `touse' & `statefips'==51 & `countyfips'==199          	    //
	`noisily' replace `countyfips' = 918 if `touse' & `statefips'==51 & `countyfips'==510          	    //
	`noisily' replace `countyfips' =  19 if `touse' & `statefips'==51 & `countyfips'==515          	    // City of Bedford absorbed by Bedford County 2013
	`noisily' replace `countyfips' = 917 if `touse' & `statefips'==51 & `countyfips'==515          	    //
	`noisily' replace `countyfips' =   5 if `touse' & `statefips'==51 & `countyfips'==560          	    // City of Clifton Forge absorbed by Alleghany County 2000s
	`noisily' replace `countyfips' = 916 if `touse' & `statefips'==51 & `countyfips'==560          	    //
	`noisily' replace `countyfips' = 916 if `touse' & `statefips'==51 & `countyfips'==580          	    //
	`noisily' replace `countyfips' = 918 if `touse' & `statefips'==51 & `countyfips'==600          	    //
	`noisily' replace `countyfips' = 918 if `touse' & `statefips'==51 & `countyfips'==610          	    //
	`noisily' replace `countyfips' = 915 if `touse' & `statefips'==51 & `countyfips'==630          	    //
	`noisily' replace `countyfips' = 914 if `touse' & `statefips'==51 & `countyfips'==660          	    //
	`noisily' replace `countyfips' = 910 if `touse' & `statefips'==51 & `countyfips'==683          	    //
	`noisily' replace `countyfips' = 910 if `touse' & `statefips'==51 & `countyfips'==685          	    //
	`noisily' replace `countyfips' = 913 if `touse' & `statefips'==51 & `countyfips'==690          	    //
	`noisily' replace `countyfips' = 911 if `touse' & `statefips'==51 & `countyfips'==735          	    //
	`noisily' replace `countyfips' =  83 if `touse' & `statefips'==51 & `countyfips'==780          	    // City of South Boston absorbed by Halifax County 1990s
	`noisily' replace `countyfips' = 911 if `touse' & `statefips'==51 & `countyfips'==830          	    //
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==975				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==983				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==984				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==985				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==986				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==988				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==989				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==990				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==991				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==992				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==993				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==994				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==995				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==996				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==997				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==51 & `countyfips'==998				// City/county comb.:
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==53 & `countyfips'== 50				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'== 86				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'== 88				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'== 92				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==160				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==180				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==182				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==183				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==184				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==186				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==191				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==260				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==360				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==460				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==555				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==630				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==660				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==696				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==801				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==802				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==806				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==807				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==809				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==815				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==816				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==818				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==819				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==823				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==830				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==836				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==837				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==838				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==840				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==841				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==843				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==844				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==845				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==849				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==851				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==861				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==862				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==863				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==871				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==873				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==877				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==878				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==879				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==881				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==883				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==887				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==892				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==898				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==902				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==933				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==935				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==937				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==950				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==952				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==953				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==954				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==955				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==956				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==957				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==959				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==961				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==962				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==964				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==967				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==969				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==970				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==971				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==972				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==973				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==974				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==976				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==977				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==978				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==979				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==980				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==982				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==983				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==985				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==986				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==987				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==989				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==991				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==992				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==993				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==994				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==997				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==55 & `countyfips'==998				//
	`noisily' replace `countyfips' =  .c if `touse' & `statefips'==56 & `countyfips'== 99				//
	if "`collapsealaska'"=="collapsealaska" {
		`noisily' replace `countyfips' = 9000 if `touse' & `statefips'== 2 // reduce alaska to one fips
	}
	if "`collapsehawaii'"=="collapsehawaii" {
		`noisily' replace `countyfips' = 9000 if `touse' & `statefips'==15 // reduce hawaii to one fips
	}
	if "`collapsemontana'"=="collapsemontana" {
		`noisily' replace `countyfips' = 9000 if `touse' & `statefips'==30 // reduce montana to one fips
	}
	if "`collapsemontana'"=="collapsemontana" {
		`noisily' replace `countyfips' = 9000 if `touse' & `statefips'==30 // reduce montana to one fips
	}
	if "`collapsenyc'"=="collapsenyc" {
		`noisily' replace `countyfips' = 9001 if `touse' & `statefips'==36 & inlist(`statefips',  5, 47, 61, 81, 85) // reduce nyc counties to one fips
	}
end
