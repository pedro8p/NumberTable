-- Definindo Variaveis

Run = true
Scene = "menu"

Kt = {
    "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"
}

Ckt = {
    "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
}

Skt = {
    " ", "~", "^", "´", "`", "[", "]", "{", "}", "/", ":", ";", "<", ">", "@", "#", "$", "%", "¨", "&", "*", "(", ")", "-", "_", "=", "+"
}

Ekt = {
    ".", ",", "?", "!"
}

io.write("> d.ansi    [----]\r")
local ansi = require("d.ansi")
io.write("> d.encrypt [#---]\r")
local encrypt = require("d.encrypt")
io.write("> d.uncrypt [##--]\r")
local uncrypt = require("d.uncrypt")
io.write("> d.tui     [###-]\r")
local tui = require("d.tui")
print("> Inicializando NumberTable.")
ansi.alt_screen(true)
while Run do
    if Scene == "encrypt" then
        ansi.cursor(true)
        local encrypt_this = tui.encrypt()
        local encrypted = encrypt.text(encrypt_this)
        ansi.clear()
        ansi.cursor(false)
        tui.show_uncrypt_or_encrypt(encrypted, true)
        ansi.clear()
    end
    if Scene == "uncrypt" then
        ansi.cursor(true)
        local uncrypt_this = tui.uncrypt()
        local uncrypted = uncrypt.text(uncrypt_this)
        ansi.clear()
        ansi.cursor(false)
        tui.show_uncrypt_or_encrypt(uncrypted, false)
        ansi.clear()
    end
    if Scene == "menu" then
        ansi.clear()
        ansi.cursor(true)
        local O = tui.menu()
        ansi.cursor(false)
        if O == 1 then
            Scene = "encrypt"
            ansi.clear()
        end
        if O == 2 then
            Scene = "uncrypt"
            ansi.clear()
        end
        if O == 3 then
            Run = false
        end
    end
end
ansi.alt_screen(false)
ansi.cursor(true)
-- NumberTable aí.
