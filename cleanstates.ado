program define cleanstates, rclass
	* parse
	syntax varname [if] [in] [, gen(name local) label(name local) missing(string) onlystates alreadyfips ucrstates replace ]
	marksample touse
	local varname "`varlist'"
	capture ds `varname', has(type string)
	if "`r(varlist)'"!="`varname'" & "`alreadyfips'"=="" {
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
	capture ds `varname', has(type numeric)
	if "`alreadyfips'"=="alreadyfips" & strlen("`r(varlist)'") {
		gen `tempstate'=`varname'
		if "`missing'"!="" {
			foreach mval in `missing' {
				replace `tempstate'=. if `varname'==`mval'
			}
		}
	}
	else if !strlen("`r(varlist)'") {
		gen `tempstate'=.
		replace `tempstate'=1	 if inlist(`varname',"AL","01","al","Alabama")
		replace `tempstate'=2	 if inlist(`varname',"AK","02","ak","Alaska")
		replace `tempstate'=4	 if inlist(`varname',"AZ","04","az","Arizona")
		replace `tempstate'=5	 if inlist(`varname',"AR","05","ar","Arkansas")
		replace `tempstate'=6	 if inlist(`varname',"CA","06","ca","California")
		replace `tempstate'=8	 if inlist(`varname',"CO","08","co","Colorado")
		replace `tempstate'=9	 if inlist(`varname',"CT","09","ct","Connecticut")
		replace `tempstate'=10	 if inlist(`varname',"DE","10","de","Delaware")
		replace `tempstate'=11	 if inlist(`varname',"DC","11","dc","District of Columbia")
		replace `tempstate'=12	 if inlist(`varname',"FL","12","fl","Florida")
		replace `tempstate'=13	 if inlist(`varname',"GA","13","ga","Georgia")
		replace `tempstate'=15	 if inlist(`varname',"HI","15","hi","Hawaii")
		replace `tempstate'=16	 if inlist(`varname',"ID","16","id","Idaho")
		replace `tempstate'=17	 if inlist(`varname',"IL","17","il","Illinois")
		replace `tempstate'=18	 if inlist(`varname',"IN","18","in","Indiana")
		replace `tempstate'=19	 if inlist(`varname',"IA","19","ia","Iowa")
		replace `tempstate'=20	 if inlist(`varname',"KS","20","ks","Kansas")
		replace `tempstate'=21	 if inlist(`varname',"KY","21","ky","Kentucky")
		replace `tempstate'=22	 if inlist(`varname',"LA","22","la","Louisiana")
		replace `tempstate'=23	 if inlist(`varname',"ME","23","me","Maine")
		replace `tempstate'=24	 if inlist(`varname',"MD","24","md","Maryland")
		replace `tempstate'=25	 if inlist(`varname',"MA","25","ma","Massachusetts")
		replace `tempstate'=26	 if inlist(`varname',"MI","26","mi","Michigan")
		replace `tempstate'=27	 if inlist(`varname',"MN","27","mn","Minnesota")
		replace `tempstate'=28	 if inlist(`varname',"MS","28","ms","Mississippi")
		replace `tempstate'=29	 if inlist(`varname',"MO","29","mo","Missouri")
		replace `tempstate'=30	 if inlist(`varname',"MT","30","mt","Montana")
		replace `tempstate'=31	 if inlist(`varname',"NE","31","ne","Nebraska")
		replace `tempstate'=32	 if inlist(`varname',"NV","32","nv","Nevada")
		replace `tempstate'=33	 if inlist(`varname',"NH","33","nh","New Hampshire")
		replace `tempstate'=34	 if inlist(`varname',"NJ","34","nj","New Jersey")
		replace `tempstate'=35	 if inlist(`varname',"NM","35","nm","New Mexico")
		replace `tempstate'=36	 if inlist(`varname',"NY","36","ny","New York")
		replace `tempstate'=37	 if inlist(`varname',"NC","37","nc","North Carolina")
		replace `tempstate'=38	 if inlist(`varname',"ND","38","nd","North Dakota")
		replace `tempstate'=39	 if inlist(`varname',"OH","39","oh","Ohio")
		replace `tempstate'=40	 if inlist(`varname',"OK","40","ok","Oklahoma")
		replace `tempstate'=41	 if inlist(`varname',"OR","41","or","Oregon")
		replace `tempstate'=42	 if inlist(`varname',"PA","42","pa","Pennsylvania")
		replace `tempstate'=44	 if inlist(`varname',"RI","44","ri","Rhode Island")
		replace `tempstate'=45	 if inlist(`varname',"SC","45","sc","South Carolina")
		replace `tempstate'=46	 if inlist(`varname',"SD","46","sd","South Dakota")
		replace `tempstate'=47	 if inlist(`varname',"TN","47","tn","Tennessee")
		replace `tempstate'=48	 if inlist(`varname',"TX","48","tx","Texas")
		replace `tempstate'=49	 if inlist(`varname',"UT","49","ut","Utah")
		replace `tempstate'=50	 if inlist(`varname',"VT","50","vt","Vermont")
		replace `tempstate'=51	 if inlist(`varname',"VA","51","va","Virginia")
		replace `tempstate'=53	 if inlist(`varname',"WA","53","wa","Washington")
		replace `tempstate'=54	 if inlist(`varname',"WV","54","wv","West Virginia")
		replace `tempstate'=55	 if inlist(`varname',"WI","55","wi","Wisconsin")
		replace `tempstate'=56	 if inlist(`varname',"WY","56","wy","Wyoming")
		if "`missing'"!="" {
			foreach mval in `missing' {
				replace `tempstate'=. if `varname'=="`mval'"
			}
		}
		if "`onlystates'"=="" {
			replace `tempstate'=60	 if inlist(`varname',"AS","60","as","American Samoa")
			replace `tempstate'=64	 if inlist(`varname',"FM","64","fm","Federated States of Micronesia")
			replace `tempstate'=66	 if inlist(`varname',"GU","66","gu","Guam")
			replace `tempstate'=68	 if inlist(`varname',"MH","68","mh","Marshall Islands")
			replace `tempstate'=69	 if inlist(`varname',"MP","69","mp","Northern Mariana Islands")
			replace `tempstate'=70	 if inlist(`varname',"PW","70","pw","Palau")
			replace `tempstate'=72	 if inlist(`varname',"PR","72","pr","Puerto Rico")
			replace `tempstate'=74	 if inlist(`varname',"UM","74","um","U.S. Minor Outlying Islands","US Minor Outlying Islands")
			replace `tempstate'=78	 if inlist(`varname',"VI","78","vi","Virgin Islands of the U.S.","Virgin Islands of the US","US Virgin Islands","U.S. Virgin Islands")
		}
	}
	else {
		gen `tempstate'=`varname'
		if "`missing'"!="" {
			foreach mval in `missing' {
				replace `tempstate'=. if `varname'==`mval'
			}
		}
		if "`ucrstates'"=="ucrstates" {
			recode `tempstate' (1 =1 ) (50=2 ) (2 =4 ) (3 =5 ) (4 =6 ) (5 =8 ) (6 =9 ) (7 =10) (8 =11) (9 =12) (10=13) (51=15) (11=16) (12=17) (13=18) (14=19) (15=20) (16=21) (17=22) (18=23) (19=24) (20=25) (21=26) (22=27) (23=28) (24=29) (25=30) (26=31) (27=32) (28=33) (29=34) (30=35) (31=36) (32=37) (33=38) (34=39) (35=40) (36=41) (37=42) (38=44) (39=45) (40=46) (41=47) (42=48) (43=49) (44=50) (45=51) (46=53) (47=54) (48=55) (49=56) (else=.)
		}
		else if "`onlystates'"=="onlystates" {
			recode `tempstate' (1=1) (2=2) (3=4) (4=5) (5=6) (6=8) (7=9) (8=10) (9=11) (10=12) (11=13) (12=15) (13=16) (14=17) (15=18) (16=19) (17=20) (18=21) (19=22) (20=23) (21=24) (22=25) (23=26) (24=27) (25=28) (26=29) (27=30) (28=31) (29=32) (30=33) (31=34) (32=35) (33=36) (34=37) (35=38) (36=39) (37=40) (38=41) (39=42) (40=44) (41=45) (42=46) (43=47) (44=48) (45=49) (46=50) (47=51) (48=53) (49=54) (50=55) (51=56) (-999/0=.) (52/999=.)
		}
		else if "`nchsnonstate'"=="" {
			recode `tempstate' (1=1) (2=2) (3=4) (4=5) (5=6) (6=8) (7=9) (8=10) (9=11) (10=12) (11=13) (12=15) (13=16) (14=17) (15=18) (16=19) (17=20) (18=21) (19=22) (20=23) (21=24) (22=25) (23=26) (24=27) (25=28) (26=29) (27=30) (28=31) (29=32) (30=33) (31=34) (32=35) (33=36) (34=37) (35=38) (36=39) (37=40) (38=41) (39=42) (40=44) (41=45) (42=46) (43=47) (44=48) (45=49) (46=50) (47=51) (48=53) (49=54) (50=55) (51=56)						(53=72) (54=78) (55=66)	(-999/0=.)  (80/999=.)
		}
		* need to check that this is consistent across years of NCHS
		else {
			recode `tempstate' (1=1) (2=2) (3=4) (4=5) (5=6) (6=8) (7=9) (8=10) (9=11) (10=12) (11=13) (12=15) (13=16) (14=17) (15=18) (16=19) (17=20) (18=21) (19=22) (20=23) (21=24) (22=25) (23=26) (24=27) (25=28) (26=29) (27=30) (28=31) (29=32) (30=33) (31=34) (32=35) (33=36) (34=37) (35=38) (36=39) (37=40) (38=41) (39=42) (40=44) (41=45) (42=46) (43=47) (44=48) (45=49) (46=50) (47=51) (48=53) (49=54) (50=55) (51=56)						(53=72) (54=78) (55=66)	(-999/0=.)  (80/999=.)
		}
	}
	if "`label'"!="" {
		label define `label' 1 "Alabama" 2 "Alaska" 4 "Arizona" 5 "Arkansas" 6 "California" 8 "Colorado" 9 "Connecticut" 10 "Delaware" 11 "District of Columbia" 12 "Florida" 13 "Georgia" 15 "Hawaii" 16 "Idaho" 17 "Illinois" 18 "Indiana" 19 "Iowa" 20 "Kansas" 21 "Kentucky" 22 "Louisiana" 23 "Maine" 24 "Maryland" 25 "Massachusetts" 26 "Michigan" 27 "Minnesota" 28 "Mississippi" 29 "Missouri" 30 "Montana" 31 "Nebraska" 32 "Nevada" 33 "New Hampshire" 34 "New Jersey" 35 "New Mexico" 36 "New York" 37 "North Carolina" 38 "North Dakota" 39 "Ohio" 40 "Oklahoma" 41 "Oregon" 42 "Pennsylvania" 44 "Rhode Island" 45 "South Carolina" 46 "South Dakota" 47 "Tennessee" 48 "Texas" 49 "Utah" 50 "Vermont" 51 "Virginia" 53 "Washington" 54 "West Virginia" 55 "Wisconsin" 56 "Wyoming"
		if "`onlystates'"=="" {
			label define `label' 60 "American Samoa" 64 "Federated States of Micronesia" 66 "Guam" 68 "Marshall Islands" 69 "Northern Mariana Islands" 70 "Palau" 72 "Puerto Rico" 74 "U.S. Minor Outlying Islands" 78 "Virgin Islancapture ds of the US" 81 "Baker Island" 84 "Howland Island" 86 "Jarvis Islan" 67 "Johnston Atoll" 89 "Kingman Reef" 71 "Midway Islands" 76 "Navassa Island" 95 "Palmyra Atoll" 79 "Wake Island", add
		}
		* need to check that this is consistent across years of NCHS
		if "`nchsnonstate'"=="nchsnonstate" {
			label define `label' 60 "American Samoa" 64 "Federated States of Micronesia" 66 "Guam" 68 "Marshall Islands" 69 "Northern Mariana Islands" 70 "Palau" 72 "Puerto Rico" 74 "U.S. Minor Outlying Islands" 78 "Virgin Islancapture ds of the US" 81 "Baker Island" 84 "Howland Island" 86 "Jarvis Islan" 67 "Johnston Atoll" 89 "Kingman Reef" 71 "Midway Islands" 76 "Navassa Island" 95 "Palmyra Atoll" 79 "Wake Island" , add
		}
	}
	local vlab : variable label `varname'
	if "`vlab'" != "" {
		n local vlab " (`vlab')"
	}
	if "`gen'" !="" {
		n gen `gen'=`tempstate'
		label var `gen' "Recode of `varname'`vlab'"
		label values `gen' `label'
	}
	else if "`replace'"=="replace" {
		n replace `varname'=`tempstate'
		label values `varname' `label'
		label var `varname' "Recode of `varname'`vlab'"
	}
	else {
		n di "Error: cannot generate a new variable or replace the old one."
	}
end
