stata-tools
===========

Various scripts for Stata

* `shellout.ado`: exports output of shell command to a local
  * useful for more powerful regular expressions
  * this is a rewrite of Nikos Askitas's [`ashell`](http://ideas.repec.org/c/boc/bocode/s456833.html) taking advantage of Stata 13's long-string support
* `stbatch.ado`: batch convert files to Stata format using StatTransfer
  * requires [`stcmd`](http://ideas.repec.org/c/boc/bocode/s414701.html) and that path be set to StatTransfer CLI app (e.g., `global StatTransfer_path /Applications/StatTransfer11/st`)
