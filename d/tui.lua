local tui = {
    __tinfo = {}
}

function tui.__tinfo.screen_size(see_x, see_y)
    local x = see_x or false
    local y = see_y or false

    local lar = tonumber(io.popen("tput cols"):read("*a"))
    local alt = tonumber(io.popen("tput lines"):read("*a"))

    if x == true and y == false then
        return lar
    end
    if x == false and y == true then
        return alt
    end
    if x == true and y == true then
        return lar, alt
    end
end

function tui.menu()
    io.write("\n")
    for _ = 1, tui.__tinfo.screen_size(true, false) do
        io.write("-")
    end
    io.write("\n\n")
    print(" 1. Criptografar\n")
    print(" 2. Des-Criptografar\n\n")
    print(" 3. Sair\n\n")
    io.write("> ")
    local option = io.read("n")
    _ = io.read()

    return option
end

function tui.encrypt()
    io.write("\n")
    for _ = 1, tui.__tinfo.screen_size(true, false) do
        io.write("-")
    end
    io.write("\n\n")
    print("(obs: o aplicativo crasha ao usar caracteres não compativeis, por favor, olhe numbertable.md para saber os caracteres compativeis.)\n\n")
    print("Escreva oque que será Codificado!\n")
    io.write("> ")

    local text = io.read()

    return text
end

function tui.uncrypt()
    io.write("\n")
    for _ = 1, tui.__tinfo.screen_size(true, false) do
        io.write("-")
    end
    io.write("\n\n")
    print("(obs: o aplicativo crasha ao usar caracteres não compativeis, por favor, não insira codigo numbertable sem ter certeza que é um codigo valido.)\n\n")
    print("Escreva oque que será decodificado!\n")
    io.write("> ")

    local text = io.read()

    return text
end

function tui.show_uncrypt_or_encrypt(text, e)
    local e = e or false
    io.write("\n")
    for _ = 1, tui.__tinfo.screen_size(true, false) do
        io.write("-")
    end
    io.write("\n\n\n\n\n\n")
    if e == true then
        print("Codificação feita!\n")
    else
        print("De-Codificação feita!\n")
    end
    print("> "..text)

    _ = io.read("l")

    Scene = "menu"
    return
end


return tui
