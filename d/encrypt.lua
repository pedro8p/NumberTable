local encrypt = {}

function encrypt.text(text)
    local t = text or ""
    local cc = utf8.len(t)
    local cl = {}
    local i = 0
    for _, cdp in utf8.codes(t) do
        local char = utf8.char(cdp)
        i = i + 1
        table.insert(cl, encrypt.___char(char))
        if i < cc then
            table.insert(cl, "_")
        end
    end
    local r = table.concat(cl)
    return r
end

function encrypt.___char(char)
    for i, char_il in ipairs(Kt) do
        if char == char_il then
            return tostring(i)
        end
    end
    for i, char_il in ipairs(Ckt) do
        if char == char_il then
            return tostring(i) .. "-u"
        end
    end
    for i, char_il in ipairs(Skt) do
        if char == char_il then
            return tostring(i).."-s"
        end
    end
    for i, char_il in ipairs(Ekt) do
        if char == char_il then
            return tostring(i).."-e"
        end
    end
    for i, char_il in ipairs(Akt) do
        if char == char_il then
            return tostring(i).."-a"
        end
    end
    for i, char_il in ipairs(Uakt) do
        if char == char_il then
            return tostring(i).."-A"
        end
    end
end

return encrypt
