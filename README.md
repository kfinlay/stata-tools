stata-tools
===========

Various scripts for Stata

* `cleanstates.ado`: converts state variables to [FIPS state code](https://en.wikipedia.org/wiki/FIPS_state_code)
  * can figure out state abbreviations and full state names
  * note that this creates a numeric FIPS with state name labels; the proper FIPS specification is a two-character string variable with a leading zero
* `countyfipsrecode`: recodes county FIPS codes based on changes in county-equivalent jurisdictions
  * present-oriented for use in 2016
  * very much a draft and unusable at this point
* `grepstr.ado`: runs grep on string variable and returns new variable with matches
  * requires shell access to grep (Mac, Linux, etc.)
  * allows Stata 13 long strings
  * currently very inefficient, but Stata's regex is pretty limited
* `shellout.ado`: exports output of shell command to a local
  * useful for more powerful regular expressions
  * this is a rewrite of Nikos Askitas's [`ashell`](http://ideas.repec.org/c/boc/bocode/s456833.html) taking advantage of Stata 13's long-string support
* `stbatch.ado`: batch convert files to Stata format using StatTransfer
  * requires Roger Newson's [`stcmd`](http://ideas.repec.org/c/boc/bocode/s414701.html) and that path be set to StatTransfer CLI app (e.g., `global StatTransfer_path /Applications/StatTransfer11/st`)

Feel free to contribute by making a pull request.
