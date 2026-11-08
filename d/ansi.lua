local ansi = {}

--@param enable boolean
function ansi.alt_screen(enable)
	if enable == true then
		io.write("\27[?1049h")
    else
        io.write("\27[?1049l")
	end
end

function ansi.clear()
	io.write("\27[2J\27[H")
end

function ansi.cursor(visible)
    local v = visible or false
    if v == false then
        io.write("\27[?25l")
    end
	if v == true then
		io.write("\27[?25h")
	end
end

return ansi
