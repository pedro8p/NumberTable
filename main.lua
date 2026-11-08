print(" -- Number Table -- ")

-- Definindo Variaveis

Run = true

Kt = {
    "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"
}

Ckt = {
    "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
}

Skt = {
    " "
}

io.write("> d.ansi    [----]\r")
local ansi = require("d.ansi")
io.write("> d.encrypt [#---]\r")
local encrypt = require("d.encrypt")
io.write("> d.uncrypt [##--]\r")
local uncrypt = require("d.uncrypt")
io.write("> d.tui     [###-]\r")
local tui = require("d.tui")
io.write("> Inicializando.  \n")

-- NumberTable aí.
local texto = "Oi do NumberTable"
local encripted = encrypt.text(texto)

print("Original:\n"..texto.."\nEncriptado:\n"..encripted)
print(uncrypt.___convert_char_to_vars("1-s"))
