program define stbatch, rclass
  version 12.0
  syntax anything (name=filelist), 
  preserve
  // capt ssc install stcmd
  global StatTransfer_path `"/Applications/StatTransfer11/st"'
  foreach f in `filelist' {
  	clear
  	inputst `f'
  	local shortname=subinstr("`f'",substr("`f'",-4,4),"",.)
  	di "`f' -> `shortname'.dta"
  	save `shortname', replace
  }
