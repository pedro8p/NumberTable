local ansi = {}

--@param enable boolean
function ansi.alt_screen(enable)
	if enable == true then
		io.write("\27[?1049h")
    else
        io.write("\27[?1049l")
	end
end

return ansi
