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
	if "`alreadyfips'"=="alreadyfips" {
		gen `tempstate'=`varname'
		if "`missing'"!="" {
			foreach mval in `missing' {
				replace `tempstate'=. if `varname'==`mval'
			}
		}
	}
	else if "`r(varlist)'"=="`varname'" {
		gen `tempstate'=.
		replace `tempstate'=1	 if `varname'=="AL" | `varname'=="al" | `varname'=="Alabama"
		replace `tempstate'=2	 if `varname'=="AK" | `varname'=="ak" | `varname'=="Alaska"
		replace `tempstate'=4	 if `varname'=="AZ" | `varname'=="az" | `varname'=="Arizona"
		replace `tempstate'=5	 if `varname'=="AR" | `varname'=="ar" | `varname'=="Arkansas"
		replace `tempstate'=6	 if `varname'=="CA" | `varname'=="ca" | `varname'=="California"
		replace `tempstate'=8	 if `varname'=="CO" | `varname'=="co" | `varname'=="Colorado"
		replace `tempstate'=9	 if `varname'=="CT" | `varname'=="ct" | `varname'=="Connecticut"
		replace `tempstate'=10	 if `varname'=="DE" | `varname'=="de" | `varname'=="Delaware"
		replace `tempstate'=11	 if `varname'=="DC" | `varname'=="dc" | `varname'=="District of Columbia"
		replace `tempstate'=12	 if `varname'=="FL" | `varname'=="fl" | `varname'=="Florida"
		replace `tempstate'=13	 if `varname'=="GA" | `varname'=="ga" | `varname'=="Georgia"
		replace `tempstate'=15	 if `varname'=="HI" | `varname'=="hi" | `varname'=="Hawaii"
		replace `tempstate'=16	 if `varname'=="ID" | `varname'=="id" | `varname'=="Idaho"
		replace `tempstate'=17	 if `varname'=="IL" | `varname'=="il" | `varname'=="Illinois"
		replace `tempstate'=18	 if `varname'=="IN" | `varname'=="in" | `varname'=="Indiana"
		replace `tempstate'=19	 if `varname'=="IA" | `varname'=="ia" | `varname'=="Iowa"
		replace `tempstate'=20	 if `varname'=="KS" | `varname'=="ks" | `varname'=="Kansas"
		replace `tempstate'=21	 if `varname'=="KY" | `varname'=="ky" | `varname'=="Kentucky"
		replace `tempstate'=22	 if `varname'=="LA" | `varname'=="la" | `varname'=="Louisiana"
		replace `tempstate'=23	 if `varname'=="ME" | `varname'=="me" | `varname'=="Maine"
		replace `tempstate'=24	 if `varname'=="MD" | `varname'=="md" | `varname'=="Maryland"
		replace `tempstate'=25	 if `varname'=="MA" | `varname'=="ma" | `varname'=="Massachusetts"
		replace `tempstate'=26	 if `varname'=="MI" | `varname'=="mi" | `varname'=="Michigan"
		replace `tempstate'=27	 if `varname'=="MN" | `varname'=="mn" | `varname'=="Minnesota"
		replace `tempstate'=28	 if `varname'=="MS" | `varname'=="ms" | `varname'=="Mississippi"
		replace `tempstate'=29	 if `varname'=="MO" | `varname'=="mo" | `varname'=="Missouri"
		replace `tempstate'=30	 if `varname'=="MT" | `varname'=="mt" | `varname'=="Montana"
		replace `tempstate'=31	 if `varname'=="NE" | `varname'=="ne" | `varname'=="Nebraska"
		replace `tempstate'=32	 if `varname'=="NV" | `varname'=="nv" | `varname'=="Nevada"
		replace `tempstate'=33	 if `varname'=="NH" | `varname'=="nh" | `varname'=="New Hampshire"
		replace `tempstate'=34	 if `varname'=="NJ" | `varname'=="nj" | `varname'=="New Jersey"
		replace `tempstate'=35	 if `varname'=="NM" | `varname'=="nm" | `varname'=="New Mexico"
		replace `tempstate'=36	 if `varname'=="NY" | `varname'=="ny" | `varname'=="New York"
		replace `tempstate'=37	 if `varname'=="NC" | `varname'=="nc" | `varname'=="North Carolina"
		replace `tempstate'=38	 if `varname'=="ND" | `varname'=="nd" | `varname'=="North Dakota"
		replace `tempstate'=39	 if `varname'=="OH" | `varname'=="oh" | `varname'=="Ohio"
		replace `tempstate'=40	 if `varname'=="OK" | `varname'=="ok" | `varname'=="Oklahoma"
		replace `tempstate'=41	 if `varname'=="OR" | `varname'=="or" | `varname'=="Oregon"
		replace `tempstate'=42	 if `varname'=="PA" | `varname'=="pa" | `varname'=="Pennsylvania"
		replace `tempstate'=44	 if `varname'=="RI" | `varname'=="ri" | `varname'=="Rhode Island"
		replace `tempstate'=45	 if `varname'=="SC" | `varname'=="sc" | `varname'=="South Carolina"
		replace `tempstate'=46	 if `varname'=="SD" | `varname'=="sd" | `varname'=="South Dakota"
		replace `tempstate'=47	 if `varname'=="TN" | `varname'=="tn" | `varname'=="Tennessee"
		replace `tempstate'=48	 if `varname'=="TX" | `varname'=="tx" | `varname'=="Texas"
		replace `tempstate'=49	 if `varname'=="UT" | `varname'=="ut" | `varname'=="Utah"
		replace `tempstate'=50	 if `varname'=="VT" | `varname'=="vt" | `varname'=="Vermont"
		replace `tempstate'=51	 if `varname'=="VA" | `varname'=="va" | `varname'=="Virginia"
		replace `tempstate'=53	 if `varname'=="WA" | `varname'=="wa" | `varname'=="Washington"
		replace `tempstate'=54	 if `varname'=="WV" | `varname'=="wv" | `varname'=="West Virginia"
		replace `tempstate'=55	 if `varname'=="WI" | `varname'=="wi" | `varname'=="Wisconsin"
		replace `tempstate'=56	 if `varname'=="WY" | `varname'=="wy" | `varname'=="Wyoming"
		if "`missing'"!="" {
			foreach mval in `missing' {
				replace `tempstate'=. if `varname'=="`mval'"
			}
		}
		if "`onlystates'"=="" {
			replace `tempstate'=60	 if `varname'=="AS" | `varname'=="as"
			replace `tempstate'=64	 if `varname'=="FM" | `varname'=="fm"
			replace `tempstate'=66	 if `varname'=="GU" | `varname'=="gu"
			replace `tempstate'=68	 if `varname'=="MH" | `varname'=="mh"
			replace `tempstate'=69	 if `varname'=="MP" | `varname'=="mp"
			replace `tempstate'=70	 if `varname'=="PW" | `varname'=="pw"
			replace `tempstate'=72	 if `varname'=="PR" | `varname'=="pr"
			replace `tempstate'=74	 if `varname'=="UM" | `varname'=="um"
			replace `tempstate'=78	 if `varname'=="VI"	| `varname'=="vi"
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
