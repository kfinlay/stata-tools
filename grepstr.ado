********************************************************************************
* NAME: grepstr.ado
* DESCRIPTION: grep search on string variable
* AUTHOR: Keith Finlay
* LAST UPDATED: 26 September 2014
********************************************************************************

program define grepstr
	version 13.1
	syntax varname(str) [if] [in], pattern(string asis) matchgen(name) [markgen(name) grepopts(string asis)]
	marksample touse
	tempvar matchtemp
	gen `matchtemp' = ""
	tempfile grepin grepout
	forval i=1/`=_N' {
		if `touse'[`i']==1 {
			outfile `varname' using `grepin' in `i', runtogether replace
			shell grep `grepopts' '`pattern'' "`grepin'" > `grepout'
			replace `matchtemp' = fileread("`grepout'") in `i'
			rm `grepout'
		}
	}
	gen `matchgen' = `matchtemp'
	if strlen("`markgen'") {
		gen `markgen'=strlen(`matchtemp')!=0
	}
end
