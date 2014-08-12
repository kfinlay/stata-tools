program def shellout, rclass
	version 13.0
	syntax anything (name=cmd)
	tempfile fname
	shell `cmd' >> `fname'
	tempname fh
	local linesout ""
	file open `fh' using `fname', read
	file read `fh' line
	while r(eof)==0 {
		local linesout = trim(`"`linesout' `line'"') /* may not want trim in here for a general case */
		file read `fh' line
	}
	return local shellout = `"`linesout'"'
	file close `fh'
end
