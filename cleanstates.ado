program define cleanstates, rclass
	* parse
	syntax varname [if] [in] [, gen(name local) label(name local) missing(string) onlystates alreadyfips ucrstates replace noisily ]
	marksample touse, strok
	local varname "`varlist'"
	if strlen("`noisily'")==0 {
		local noisily "quietly"
	}
	local inputtype : type `varname'
	local isstring=substr("`inputtype'",1,3)=="str"
	capture ds `varname', has(type string)
	if "`r(varlist)'"!="`varname'" & !strlen("`alreadyfips'") {
		count if `varname'==3 | `varname'==7 | `varname'==14 | `varname'==43 | `varname'==52
		if `r(N)'==0 {
			n di "`varname' is probably already in FIPS format."
			local alreadyfips "alreadyfips"
		}
		else {
			n di "`varname' is probably NOT in FIPS format."
			local alreadyfips ""
		}
	}
	tempvar tempstate
	if `isstring' {
		`noisily' gen `tempstate'=.
		`noisily' replace `tempstate'=1	 if `touse' & inlist(`varname',"AL","01","al","Alabama","1")
		`noisily' replace `tempstate'=2	 if `touse' & inlist(`varname',"AK","02","ak","Alaska","2")
		`noisily' replace `tempstate'=4	 if `touse' & inlist(`varname',"AZ","04","az","Arizona","4")
		`noisily' replace `tempstate'=5	 if `touse' & inlist(`varname',"AR","05","ar","Arkansas","5")
		`noisily' replace `tempstate'=6	 if `touse' & inlist(`varname',"CA","06","ca","California","6")
		`noisily' replace `tempstate'=8	 if `touse' & inlist(`varname',"CO","08","co","Colorado","8")
		`noisily' replace `tempstate'=9	 if `touse' & inlist(`varname',"CT","09","ct","Connecticut","9")
		`noisily' replace `tempstate'=10	 if `touse' & inlist(`varname',"DE","10","de","Delaware")
		`noisily' replace `tempstate'=11	 if `touse' & inlist(`varname',"DC","11","dc","District of Columbia")
		`noisily' replace `tempstate'=12	 if `touse' & inlist(`varname',"FL","12","fl","Florida")
		`noisily' replace `tempstate'=13	 if `touse' & inlist(`varname',"GA","13","ga","Georgia")
		`noisily' replace `tempstate'=15	 if `touse' & inlist(`varname',"HI","15","hi","Hawaii")
		`noisily' replace `tempstate'=16	 if `touse' & inlist(`varname',"ID","16","id","Idaho")
		`noisily' replace `tempstate'=17	 if `touse' & inlist(`varname',"IL","17","il","Illinois")
		`noisily' replace `tempstate'=18	 if `touse' & inlist(`varname',"IN","18","in","Indiana")
		`noisily' replace `tempstate'=19	 if `touse' & inlist(`varname',"IA","19","ia","Iowa")
		`noisily' replace `tempstate'=20	 if `touse' & inlist(`varname',"KS","20","ks","Kansas")
		`noisily' replace `tempstate'=21	 if `touse' & inlist(`varname',"KY","21","ky","Kentucky")
		`noisily' replace `tempstate'=22	 if `touse' & inlist(`varname',"LA","22","la","Louisiana")
		`noisily' replace `tempstate'=23	 if `touse' & inlist(`varname',"ME","23","me","Maine")
		`noisily' replace `tempstate'=24	 if `touse' & inlist(`varname',"MD","24","md","Maryland")
		`noisily' replace `tempstate'=25	 if `touse' & inlist(`varname',"MA","25","ma","Massachusetts")
		`noisily' replace `tempstate'=26	 if `touse' & inlist(`varname',"MI","26","mi","Michigan")
		`noisily' replace `tempstate'=27	 if `touse' & inlist(`varname',"MN","27","mn","Minnesota")
		`noisily' replace `tempstate'=28	 if `touse' & inlist(`varname',"MS","28","ms","Mississippi")
		`noisily' replace `tempstate'=29	 if `touse' & inlist(`varname',"MO","29","mo","Missouri")
		`noisily' replace `tempstate'=30	 if `touse' & inlist(`varname',"MT","30","mt","Montana")
		`noisily' replace `tempstate'=31	 if `touse' & inlist(`varname',"NE","31","ne","Nebraska")
		`noisily' replace `tempstate'=32	 if `touse' & inlist(`varname',"NV","32","nv","Nevada")
		`noisily' replace `tempstate'=33	 if `touse' & inlist(`varname',"NH","33","nh","New Hampshire")
		`noisily' replace `tempstate'=34	 if `touse' & inlist(`varname',"NJ","34","nj","New Jersey")
		`noisily' replace `tempstate'=35	 if `touse' & inlist(`varname',"NM","35","nm","New Mexico")
		`noisily' replace `tempstate'=36	 if `touse' & inlist(`varname',"NY","36","ny","New York")
		`noisily' replace `tempstate'=37	 if `touse' & inlist(`varname',"NC","37","nc","North Carolina")
		`noisily' replace `tempstate'=38	 if `touse' & inlist(`varname',"ND","38","nd","North Dakota")
		`noisily' replace `tempstate'=39	 if `touse' & inlist(`varname',"OH","39","oh","Ohio")
		`noisily' replace `tempstate'=40	 if `touse' & inlist(`varname',"OK","40","ok","Oklahoma")
		`noisily' replace `tempstate'=41	 if `touse' & inlist(`varname',"OR","41","or","Oregon")
		`noisily' replace `tempstate'=42	 if `touse' & inlist(`varname',"PA","42","pa","Pennsylvania")
		`noisily' replace `tempstate'=44	 if `touse' & inlist(`varname',"RI","44","ri","Rhode Island")
		`noisily' replace `tempstate'=45	 if `touse' & inlist(`varname',"SC","45","sc","South Carolina")
		`noisily' replace `tempstate'=46	 if `touse' & inlist(`varname',"SD","46","sd","South Dakota")
		`noisily' replace `tempstate'=47	 if `touse' & inlist(`varname',"TN","47","tn","Tennessee")
		`noisily' replace `tempstate'=48	 if `touse' & inlist(`varname',"TX","48","tx","Texas")
		`noisily' replace `tempstate'=49	 if `touse' & inlist(`varname',"UT","49","ut","Utah")
		`noisily' replace `tempstate'=50	 if `touse' & inlist(`varname',"VT","50","vt","Vermont")
		`noisily' replace `tempstate'=51	 if `touse' & inlist(`varname',"VA","51","va","Virginia")
		`noisily' replace `tempstate'=53	 if `touse' & inlist(`varname',"WA","53","wa","Washington")
		`noisily' replace `tempstate'=54	 if `touse' & inlist(`varname',"WV","54","wv","West Virginia")
		`noisily' replace `tempstate'=55	 if `touse' & inlist(`varname',"WI","55","wi","Wisconsin")
		`noisily' replace `tempstate'=56	 if `touse' & inlist(`varname',"WY","56","wy","Wyoming")
		if "`missing'"!="" {
			foreach mval in `missing' {
				`noisily' replace `tempstate'=. if `varname'=="`mval'"
			}
		}
		if "`onlystates'"=="" {
			`noisily' replace `tempstate'=60	 if `touse' & inlist(`varname',"AS","60","as","American Samoa")
			`noisily' replace `tempstate'=64	 if `touse' & inlist(`varname',"FM","64","fm","Federated States of Micronesia")
			`noisily' replace `tempstate'=66	 if `touse' & inlist(`varname',"GU","66","gu","Guam")
			`noisily' replace `tempstate'=68	 if `touse' & inlist(`varname',"MH","68","mh","Marshall Islands")
			`noisily' replace `tempstate'=69	 if `touse' & inlist(`varname',"MP","69","mp","Northern Mariana Islands")
			`noisily' replace `tempstate'=70	 if `touse' & inlist(`varname',"PW","70","pw","Palau")
			`noisily' replace `tempstate'=72	 if `touse' & inlist(`varname',"PR","72","pr","Puerto Rico")
			`noisily' replace `tempstate'=74	 if `touse' & inlist(`varname',"UM","74","um","U.S. Minor Outlying Islands","US Minor Outlying Islands")
			`noisily' replace `tempstate'=78	 if `touse' & inlist(`varname',"VI","78","vi","Virgin Islands of the U.S.","Virgin Islands of the US","US Virgin Islands","U.S. Virgin Islands")
		}
	}
	else if strlen("`alreadyfips'") {
		`noisily' gen `tempstate'=`varname' if `touse'
		if "`missing'"!="" {
			foreach mval in `missing' {
				`noisily' replace `tempstate'=. if `varname'==`mval'
			}
		}
	}
	else {
		`noisily' gen `tempstate'=`varname' if `touse'
		if "`missing'"!="" {
			foreach mval in `missing' {
				`noisily' replace `tempstate'=. if `varname'==`mval'
			}
		}
		if "`ucrstates'"=="ucrstates" {
			`noisily' recode `tempstate' (1 =1 ) (50=2 ) (2 =4 ) (3 =5 ) (4 =6 ) (5 =8 ) (6 =9 ) (7 =10) (8 =11) (9 =12) (10=13) (51=15) (11=16) (12=17) (13=18) (14=19) (15=20) (16=21) (17=22) (18=23) (19=24) (20=25) (21=26) (22=27) (23=28) (24=29) (25=30) (26=31) (27=32) (28=33) (29=34) (30=35) (31=36) (32=37) (33=38) (34=39) (35=40) (36=41) (37=42) (38=44) (39=45) (40=46) (41=47) (42=48) (43=49) (44=50) (45=51) (46=53) (47=54) (48=55) (49=56) (else=.)
		}
		else if "`onlystates'"=="onlystates" {
			`noisily' recode `tempstate' (1=1) (2=2) (3=4) (4=5) (5=6) (6=8) (7=9) (8=10) (9=11) (10=12) (11=13) (12=15) (13=16) (14=17) (15=18) (16=19) (17=20) (18=21) (19=22) (20=23) (21=24) (22=25) (23=26) (24=27) (25=28) (26=29) (27=30) (28=31) (29=32) (30=33) (31=34) (32=35) (33=36) (34=37) (35=38) (36=39) (37=40) (38=41) (39=42) (40=44) (41=45) (42=46) (43=47) (44=48) (45=49) (46=50) (47=51) (48=53) (49=54) (50=55) (51=56) (-999/0=.) (52/999=.)
		}
		else if "`nchsnonstate'"=="" {
			`noisily' recode `tempstate' (1=1) (2=2) (3=4) (4=5) (5=6) (6=8) (7=9) (8=10) (9=11) (10=12) (11=13) (12=15) (13=16) (14=17) (15=18) (16=19) (17=20) (18=21) (19=22) (20=23) (21=24) (22=25) (23=26) (24=27) (25=28) (26=29) (27=30) (28=31) (29=32) (30=33) (31=34) (32=35) (33=36) (34=37) (35=38) (36=39) (37=40) (38=41) (39=42) (40=44) (41=45) (42=46) (43=47) (44=48) (45=49) (46=50) (47=51) (48=53) (49=54) (50=55) (51=56) (53=72) (54=78) (55=66)	(-999/0=.)  (80/999=.)
		}
		* need to check that this is consistent across years of NCHS
		else {
			`noisily' recode `tempstate' (1=1) (2=2) (3=4) (4=5) (5=6) (6=8) (7=9) (8=10) (9=11) (10=12) (11=13) (12=15) (13=16) (14=17) (15=18) (16=19) (17=20) (18=21) (19=22) (20=23) (21=24) (22=25) (23=26) (24=27) (25=28) (26=29) (27=30) (28=31) (29=32) (30=33) (31=34) (32=35) (33=36) (34=37) (35=38) (36=39) (37=40) (38=41) (39=42) (40=44) (41=45) (42=46) (43=47) (44=48) (45=49) (46=50) (47=51) (48=53) (49=54) (50=55) (51=56) (53=72) (54=78) (55=66)	(-999/0=.)  (80/999=.)
		}
	}
	if "`label'"!="" {
		label define `label' 1 "Alabama" 2 "Alaska" 4 "Arizona" 5 "Arkansas" 6 "California" 8 "Colorado" 9 "Connecticut" 10 "Delaware" 11 "District of Columbia" 12 "Florida" 13 "Georgia" 15 "Hawaii" 16 "Idaho" 17 "Illinois" 18 "Indiana" 19 "Iowa" 20 "Kansas" 21 "Kentucky" 22 "Louisiana" 23 "Maine" 24 "Maryland" 25 "Massachusetts" 26 "Michigan" 27 "Minnesota" 28 "Mississippi" 29 "Missouri" 30 "Montana" 31 "Nebraska" 32 "Nevada" 33 "New Hampshire" 34 "New Jersey" 35 "New Mexico" 36 "New York" 37 "North Carolina" 38 "North Dakota" 39 "Ohio" 40 "Oklahoma" 41 "Oregon" 42 "Pennsylvania" 44 "Rhode Island" 45 "South Carolina" 46 "South Dakota" 47 "Tennessee" 48 "Texas" 49 "Utah" 50 "Vermont" 51 "Virginia" 53 "Washington" 54 "West Virginia" 55 "Wisconsin" 56 "Wyoming"
		if "`onlystates'"=="" {
			label define `label' 60 "American Samoa" 64 "Federated States of Micronesia" 66 "Guam" 68 "Marshall Islands" 69 "Northern Mariana Islands" 70 "Palau" 72 "Puerto Rico" 74 "U.S. Minor Outlying Islands" 78 "Virgin Islands of the US" 81 "Baker Island" 84 "Howland Island" 86 "Jarvis Islan" 67 "Johnston Atoll" 89 "Kingman Reef" 71 "Midway Islands" 76 "Navassa Island" 95 "Palmyra Atoll" 79 "Wake Island", add
		}
		* need to check that this is consistent across years of NCHS
		if "`nchsnonstate'"=="nchsnonstate" {
			label define `label' 60 "American Samoa" 64 "Federated States of Micronesia" 66 "Guam" 68 "Marshall Islands" 69 "Northern Mariana Islands" 70 "Palau" 72 "Puerto Rico" 74 "U.S. Minor Outlying Islands" 78 "Virgin Islands of the US" 81 "Baker Island" 84 "Howland Island" 86 "Jarvis Islan" 67 "Johnston Atoll" 89 "Kingman Reef" 71 "Midway Islands" 76 "Navassa Island" 95 "Palmyra Atoll" 79 "Wake Island" , add
		}
	}
	capt local vlab : variable label `varname'
	if "`vlab'" != "" {
		`noisily' local vlab " (`vlab')"
	}
	qui count if `touse' & missing(`tempstate') & !missing(`varname')
	if `r(N)' {
		n di "Caution: there are non-missing cases in the input variable that are missing in the output variable:"
		tab `varname' if `touse' & missing(`tempstate') & !missing(`varname')
	}
	if strlen("`gen'") {
		`noisily' gen `gen'=`tempstate'
		label var `gen' "Recode of `varname'`vlab'"
		label values `gen' `label'
	}
	else if strlen("`replace'") {
		`noisily' drop `varname'
		`noisily' replace `varname'=`tempstate'
		label values `varname' `label'
		label var `varname' "Recode of `varname'`vlab'"
	}
	else {
		error 198
		n di as error "Error: cannot generate a new variable or replace the old one."
	}
end
