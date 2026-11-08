devh= {}
function devh.log(str)
    io.write("\27[?1049l")
    print("[LOG]: " .. str)
    io.write("\27[?1049h")
end
function devh.err(str)
    io.write("\27[?1049l")
    print("[ERR]: " .. str)
    io.write("\27[?1049h")
end
function devh.fatal(str)
    io.write("\27[?1049l")
    print("[FATAL]: "..str)
    io.write("\27[?1049h")
    Run = false
    Scene = "menu"
end
return devh
