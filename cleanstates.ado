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
		`noisily' replace `tempstate'=1	 if `touse' & inlist(`varname',"AL","Al","01","al","Alabama","ALABAMA","1")
		`noisily' replace `tempstate'=2	 if `touse' & inlist(`varname',"AK","Ak","02","ak","Alaska","ALASKA","2")
		`noisily' replace `tempstate'=4	 if `touse' & inlist(`varname',"AZ","Az","04","az","Arizona","ARIZONA","4")
		`noisily' replace `tempstate'=5	 if `touse' & inlist(`varname',"AR","Ar","05","ar","Arkansas","ARKANSAS","5")
		`noisily' replace `tempstate'=6	 if `touse' & inlist(`varname',"CA","Ca","06","ca","California","CALIFORNIA","6")
		`noisily' replace `tempstate'=8	 if `touse' & inlist(`varname',"CO","Co","08","co","Colorado","COLORADO","8")
		`noisily' replace `tempstate'=9	 if `touse' & inlist(`varname',"CT","Ct","09","ct","Connecticut","CONNECTICUT","9")
		`noisily' replace `tempstate'=10	 if `touse' & inlist(`varname',"DE","De","10","de","Delaware","DELAWARE")
		`noisily' replace `tempstate'=11	 if `touse' & inlist(`varname',"DC","Dc","11","dc","District of Columbia","DISTRICT OF COLUMBIA")
		`noisily' replace `tempstate'=12	 if `touse' & inlist(`varname',"FL","Fl","12","fl","Florida","FLORIDA")
		`noisily' replace `tempstate'=13	 if `touse' & inlist(`varname',"GA","Ga","13","ga","Georgia","GEORGIA")
		`noisily' replace `tempstate'=15	 if `touse' & inlist(`varname',"HI","Hi","15","hi","Hawaii","HAWAII")
		`noisily' replace `tempstate'=16	 if `touse' & inlist(`varname',"ID","Id","16","id","Idaho","IDAHO")
		`noisily' replace `tempstate'=17	 if `touse' & inlist(`varname',"IL","Il","17","il","Illinois","ILLINOIS")
		`noisily' replace `tempstate'=18	 if `touse' & inlist(`varname',"IN","In","18","in","Indiana","INDIANA")
		`noisily' replace `tempstate'=19	 if `touse' & inlist(`varname',"IA","Ia","19","ia","Iowa","IOWA")
		`noisily' replace `tempstate'=20	 if `touse' & inlist(`varname',"KS","Ks","20","ks","Kansas","KANSAS")
		`noisily' replace `tempstate'=21	 if `touse' & inlist(`varname',"KY","Ky","21","ky","Kentucky","KENTUCKY")
		`noisily' replace `tempstate'=22	 if `touse' & inlist(`varname',"LA","La","22","la","Louisiana","LOUISIANA")
		`noisily' replace `tempstate'=23	 if `touse' & inlist(`varname',"ME","Me","23","me","Maine","MAINE")
		`noisily' replace `tempstate'=24	 if `touse' & inlist(`varname',"MD","Md","24","md","Maryland","MARYLAND")
		`noisily' replace `tempstate'=25	 if `touse' & inlist(`varname',"MA","Ma","25","ma","Massachusetts","MASSACHUSETTS")
		`noisily' replace `tempstate'=26	 if `touse' & inlist(`varname',"MI","Mi","26","mi","Michigan","MICHIGAN")
		`noisily' replace `tempstate'=27	 if `touse' & inlist(`varname',"MN","Mn","27","mn","Minnesota","MINNESOTA")
		`noisily' replace `tempstate'=28	 if `touse' & inlist(`varname',"MS","Ms","28","ms","Mississippi","MISSISSIPPI")
		`noisily' replace `tempstate'=29	 if `touse' & inlist(`varname',"MO","Mo","29","mo","Missouri","MISSOURI")
		`noisily' replace `tempstate'=30	 if `touse' & inlist(`varname',"MT","Mt","30","mt","Montana","MONTANA")
		`noisily' replace `tempstate'=31	 if `touse' & inlist(`varname',"NE","Ne","31","ne","Nebraska","NEBRASKA")
		`noisily' replace `tempstate'=32	 if `touse' & inlist(`varname',"NV","Nv","32","nv","Nevada","NEVADA")
		`noisily' replace `tempstate'=33	 if `touse' & inlist(`varname',"NH","Nh","33","nh","New Hampshire","NEW HAMPSHIRE")
		`noisily' replace `tempstate'=34	 if `touse' & inlist(`varname',"NJ","Nj","34","nj","New Jersey","NEW JERSEY")
		`noisily' replace `tempstate'=35	 if `touse' & inlist(`varname',"NM","Nm","35","nm","New Mexico","NEW MEXICO")
		`noisily' replace `tempstate'=36	 if `touse' & inlist(`varname',"NY","Ny","36","ny","New York","NEW YORK")
		`noisily' replace `tempstate'=37	 if `touse' & inlist(`varname',"NC","Nc","37","nc","North Carolina","NORTH CAROLINA")
		`noisily' replace `tempstate'=38	 if `touse' & inlist(`varname',"ND","Nd","38","nd","North Dakota","NORTH DAKOTA")
		`noisily' replace `tempstate'=39	 if `touse' & inlist(`varname',"OH","Oh","39","oh","Ohio","OHIO")
		`noisily' replace `tempstate'=40	 if `touse' & inlist(`varname',"OK","Ok","40","ok","Oklahoma","OKLAHOMA")
		`noisily' replace `tempstate'=41	 if `touse' & inlist(`varname',"OR","Or","41","or","Oregon","OREGON")
		`noisily' replace `tempstate'=42	 if `touse' & inlist(`varname',"PA","Pa","42","pa","Pennsylvania","PENNSYLVANIA")
		`noisily' replace `tempstate'=44	 if `touse' & inlist(`varname',"RI","Ri","44","ri","Rhode Island","RHODE ISLAND")
		`noisily' replace `tempstate'=45	 if `touse' & inlist(`varname',"SC","Sc","45","sc","South Carolina","SOUTH CAROLINA")
		`noisily' replace `tempstate'=46	 if `touse' & inlist(`varname',"SD","Sd","46","sd","South Dakota","SOUTH DAKOTA")
		`noisily' replace `tempstate'=47	 if `touse' & inlist(`varname',"TN","Tn","47","tn","Tennessee","TENNESSEE")
		`noisily' replace `tempstate'=48	 if `touse' & inlist(`varname',"TX","Tx","48","tx","Texas","TEXAS")
		`noisily' replace `tempstate'=49	 if `touse' & inlist(`varname',"UT","Ut","49","ut","Utah","UTAH")
		`noisily' replace `tempstate'=50	 if `touse' & inlist(`varname',"VT","Vt","50","vt","Vermont","VERMONT")
		`noisily' replace `tempstate'=51	 if `touse' & inlist(`varname',"VA","Va","51","va","Virginia","VIRGINIA")
		`noisily' replace `tempstate'=53	 if `touse' & inlist(`varname',"WA","Wa","53","wa","Washington","WASHINGTON")
		`noisily' replace `tempstate'=54	 if `touse' & inlist(`varname',"WV","Wv","54","wv","West Virginia","WEST VIRGINIA")
		`noisily' replace `tempstate'=55	 if `touse' & inlist(`varname',"WI","Wi","55","wi","Wisconsin","WISCONSIN")
		`noisily' replace `tempstate'=56	 if `touse' & inlist(`varname',"WY","Wy","56","wy","Wyoming","WYOMING")
		if "`missing'"!="" {
			foreach mval in `missing' {
				`noisily' replace `tempstate'=. if `varname'=="`mval'"
			}
		}
		if "`onlystates'"=="" {
			`noisily' replace `tempstate'=60	 if `touse' & inlist(`varname',"AS","As","60","as","American Samoa","AMERICAN SAMOA")
			`noisily' replace `tempstate'=64	 if `touse' & inlist(`varname',"FM","Fm","64","fm","Federated States of Micronesia","FEDERATED STATES OF MICRONESIA")
			`noisily' replace `tempstate'=66	 if `touse' & inlist(`varname',"GU","Gu","66","gu","Guam","GUAM")
			`noisily' replace `tempstate'=68	 if `touse' & inlist(`varname',"MH","Mh","68","mh","Marshall Islands","MARSHALL ISLANDS")
			`noisily' replace `tempstate'=69	 if `touse' & inlist(`varname',"MP","Mp","69","mp","Northern Mariana Islands","NORTHERN MARIANA ISLANDS")
			`noisily' replace `tempstate'=70	 if `touse' & inlist(`varname',"PW","Pw","70","pw","Palau","PALAU")
			`noisily' replace `tempstate'=72	 if `touse' & inlist(`varname',"PR","Pr","72","pr","Puerto Rico","PUERTO RICO")
			`noisily' replace `tempstate'=74	 if `touse' & inlist(`varname',"UM","Um","74","um","U.S. Minor Outlying Islands","US Minor Outlying Islands","U.S. MINOR OUTLYING ISLANDS","US MINOR OUTLYING ISLANDS")
			`noisily' replace `tempstate'=78	 if `touse' & (inlist(`varname',"VI","Vi","78","vi","Virgin Islands of the U.S.","Virgin Islands of the US","US Virgin Islands","U.S. Virgin Islands") + inlist(`varname',"VIRGIN ISLANDS OF THE U.S.","VIRGIN ISLANDS OF THE US","US VIRGIN ISLANDS","U.S. VIRGIN ISLANDS") + inlist(`varname',"VQ"))
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
