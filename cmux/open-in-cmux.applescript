-- Droplet that hands dropped/opened files to ~/.local/bin/cmux-open-file.
-- Installed as ~/Applications/Open in cmux.app by cmux/bin/install-open-in-cmux
-- and registered as the macOS default app for .json.

on run
	-- Launched with no files: nothing to do.
end run

on open theFiles
	set opener to (POSIX path of (path to home folder)) & ".local/bin/cmux-open-file"
	repeat with f in theFiles
		do shell script quoted form of opener & " " & quoted form of POSIX path of f
	end repeat
	try
		tell application id "com.cmuxterm.app" to activate
	end try
end open
