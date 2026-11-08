local uncrypt = {}

local char_numbers_list = {
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
}

function uncrypt.text(text)
    local t = text or ""
    local cl = {}
    local r = {}
    for p in string.gmatch(t, "[^_]+") do
        table.insert(cl, p)
    end
    for _, en_char in ipairs(cl) do
        local c, tp = nil, nil
        c, tp = uncrypt.___convert_char_to_vars(en_char)
        table.insert(r, uncrypt.___char(c, tp))
    end
    return table.concat(r)
end

function uncrypt.___convert_char_to_vars(en_char)
    local enc = en_char or ""
    local is_normal_value = true
    local special = false
    local upper = false
    local extra = false
    local numbers_list = {}
    local numbers_str = ""

    local numbers_return = 0
    local type_return = 1
    for oc in string.gmatch(enc, ".") do
        for _, number in ipairs(char_numbers_list) do
            if oc:find(number) then
                table.insert(numbers_list, oc)
            end
        end
        if oc:find("-") then
            is_normal_value = false
        end
        if is_normal_value == false then
            if oc:find("s") then
                special = true
                break
            end
            if oc:find("u") then
                upper = true
                break
            end
            if oc:find("e") then
                extra = true
                break
            end
        end
    end
    if is_normal_value == false then
        if special == false and upper == false and extra == false then
            print("[ERR]: Um Char foi criptografado errado!")
            return
        end
        if special == true then
            type_return = 3
        end
        if upper == true then
            type_return = 2
        end
        if extra == true then
            type_return = 4
        end
    end
    numbers_str = table.concat(numbers_list)
    numbers_return = tonumber(numbers_str)

    if numbers_return == 0 then
        print("[ERR]: Um number continuou em 0 (o Minímo é 1)")
    end
    return numbers_return, type_return
end

-- Transforma um caractere (os valores do tipo e número já ajeitado.)
function uncrypt.___char(number, type)
    local n = number or 1
    if n > #Kt then
        n = 1
    end
    local t = type or 1
    if t == 1 then
        return Kt[n]
    end
    if t == 2 then
        return Ckt[n]
    end
    if t == 3 then
        return Skt[n]
    end
    if t == 4 then
        return Ekt[n]
    end
end
uncrypt["___number_char_list"] = char_numbers_list
return uncrypt
