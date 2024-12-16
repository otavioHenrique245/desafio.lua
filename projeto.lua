-- habilitar UFT-8 no terminal
os.execute("chcp 65001")

--- ATRIBUTOS

-- atributos iniciais do player
local playerAttributeInicialDamage = 3
local playerAttributeInicialDefense = 5
local playerAttributeInicialSpeed = 4
local playerAttributeInicialInteligency = 7

-- atribudos do Creeper
local attributeCreeperAttack = 10
local attributeCreeperDefense = 1
local attributeCreeperSpeed = 4
local attributeCreeperInteligency = 0

-- atributos do Zombie
local attributeZombieAttack = 6
local attributeZombieDefense = 3
local attributeZombieSpeed = 4
local attributeZombieInteligency = 2



--- VIDA DO JOGADOR E DOS MONSTROS

local jogador = {
    vida = 50,
    dano = 5
    
}

local creeperTabela = {
    vida = 50,
    dano = 50 
}

local zombieTabela = {
    vida = 50,
    dano = 7
}


--- NOME DOS MONSTROS

local nameMonster = {
    "1. Creeper",
    "2. Zombie"
}

-- calcula a barra de atributos
local function getAttibuteBar(attribute)
    local fullchar = "⬜"
    local emptychar = "⬛"
    
    local result = ""
    for i = 1, 10, 1 do
        if i <= attribute then
            result = result .. fullchar
        else
            result = result .. emptychar
        end
    end
    return result
end

local acao = {
    "1. Atacar com a espada.",
    "2. Atacar com um arco e flecha.",
    "3. Jogar uma pedra do monstro."
}

local acaoCreeperPerto = {
    "1. Sim.",
    "2. Não."
}

local acaoPedra = {
    "1. Sim.",
    "2. Não."
}





print()
print("====================================")
print("        É HORA DA BATALHA!          ")
print("====================================")
print("Qual monstro deseja batalhar?")
for i = 1, #nameMonster do
    print(nameMonster[i])
end
print()
local resposta = io.read()
print()
    
if resposta == "1" then
    print("Monstro definido.")
elseif resposta == "2" then
    print("Monstro definido.")
else
    print("Monstro invalido.")
end
    
if resposta == "1" then
    print("----------------------")
    print("Atributos do jogador:")
    print("Ataque:        " .. getAttibuteBar(playerAttributeInicialDamage))
    print("Defesa:        " .. getAttibuteBar(playerAttributeInicialDefense))
    print("Velocidade:    " .. getAttibuteBar(playerAttributeInicialSpeed))
    print("Inteligência:  " .. getAttibuteBar(playerAttributeInicialInteligency))
            
    print()    
            
    print("Atributos do monstro:")
    print("Ataque:        " .. getAttibuteBar(attributeCreeperAttack))
    print("Defesa:        " .. getAttibuteBar(attributeCreeperDefense))
    print("Velocidade:    " .. getAttibuteBar(attributeCreeperSpeed))
    print("Inteligência:  " .. getAttibuteBar(attributeCreeperInteligency))


    repeat
        
    print("----------------------------")
    print("O que você vai fazer agora?")
    for i = 1, #acao do
        print(acao[i]) 
    end
    local respAcao = io.read()
        
    -- Caso o jogador escolha a resposta 1 (espada), isso aqui vai acontecer:
    if respAcao == "1" then
        print("O creeper está perto de você?")
        for i = 1, #acaoCreeperPerto do
            print(acaoCreeperPerto[i])
        end
        local respCreeperPerto = io.read()
        if respCreeperPerto == "1" then
            jogador.vida = jogador.vida - creeperTabela.dano
            print()
            print(string.format("O creeper explodiu, você recebeu %d de dano do monstro.", creeperTabela.dano))
            print(string.format("Vida atual: %d", jogador.vida))
            creeperTabela.vida = creeperTabela.vida - creeperTabela.vida
        elseif respCreeperPerto == "2" then   
            print() 
            print("Como você vai atacar com uma espada se o monstro não está perto? Tente ataques à distância.")
            print("Como você está longe, o creeper não reaje.")
        end
    end
        
        -- Caso o jogador escolha a opção 2, isso vai acontecer:
    if respAcao == "2" then
        creeperTabela.vida = creeperTabela.vida - playerAttributeInicialDamage
        print()
        print("O ataque foi um sucesso!")
        print(string.format("O Creeper recebeu %d de dano.", playerAttributeInicialDamage))
        print(string.format("Vida restante do monstro: %d", creeperTabela.vida))
    end

    -- Caso o jogador escolha a opção 3, isso vai acontecer:
    if respAcao == "3" then
       print("Há alguma pedra por perto?")
       for i = 1, #acaoPedra do
            print(acaoPedra[i])
       end
       local pedraResposta = io.read()
       if pedraResposta == "1" then
            creeperTabela.vida = creeperTabela.vida - 5
            print()
            print("O ataque foi um sucesso!")
            print(string.format("O creeper recebeu %d de dano.", 5))
            print(string.format("Vida atual do monstro: %d", creeperTabela.vida))
        elseif pedraResposta == "2" then
            print("Por causa da falta do objeto, não foi possível jogá-lo.")       
       end
    end

    print()
    until creeperTabela.vida <= 0 or jogador.vida <= 0
    if jogador.vida <= 0 then
        print("Você morreu, tente novamente.")
    elseif creeperTabela.vida <= 0 then
        print("O monstro morreu, você venceu!")    
    end
   
elseif resposta == "2" then    
    print("------------------------")
    print("Atributos do jogador:")
    print("Ataque:        " .. getAttibuteBar(playerAttributeInicialDamage))
    print("Defesa:        " .. getAttibuteBar(playerAttributeInicialDefense))
    print("Velocidade:    " .. getAttibuteBar(playerAttributeInicialSpeed))
    print("Inteligência:  " .. getAttibuteBar(playerAttributeInicialInteligency))

    print()
    print("Atributos do monstro:")
    print("Ataque:       " .. getAttibuteBar(attributeZombieAttack))
    print("Defesa:       " .. getAttibuteBar(attributeZombieDefense))
    print("Velocidade:   " .. getAttibuteBar(attributeZombieSpeed))
    print("Inteligência: " .. getAttibuteBar(attributeZombieInteligency))


    repeat
        print("---------------------------")
    print("O que você vai fazer agora?")
    for i = 1, #acao do
        print(acao[i])
    end
    print()
    local respAcao1 = io.read()
        
    if respAcao1 == "1" then
        zombieTabela.vida = zombieTabela.vida - 8
        print()
        print("O ataque foi um sucesso!")
        print(string.format("Dano causado: %d", 8))
        print(string.format("Vida restante: %d", zombieTabela.vida))
        print()
        jogador.vida = jogador.vida - 7

        print(string.format("O monstro conseguiu te acertar, dano causado: %d", 7))
        print()

    elseif respAcao1 == "2" then
        zombieTabela.vida = zombieTabela.vida - jogador.dano
        print()  
        print("O ataque foi um sucesso!")
        print(string.format("Dano causado: %d", jogador.dano))
        print(string.format("Vida restante: %d", zombieTabela.vida))

    elseif respAcao1 == "3" then
        print("Há alguma pedra por perto?")
        for i = 1, #acaoPedra do
            print(acaoPedra[i])
        end
        local pedraResposta1 = io.read()

        if pedraResposta1 == "1" then
            zombieTabela.vida = zombieTabela.vida - 4
            print()
            print("O ataque foi um sucesso!")
            print(string.format("Dano causado: %d", 4))
            print(string.format("Vida restante: %d", zombieTabela.vida))
            print()
        elseif pedraResposta1 == "2" then
            print("Por causa da falta do objeto, não foi possível jogá-lo.")    
            print()
        end
    end
    
    until jogador.vida <= 0 or zombieTabela.vida <= 0     
    if jogador.vida <= 0 then
        print("Você morreu, tente novamente.")
    elseif zombieTabela.vida <= 0 then
        print("O monstro morreu, você venceu!")    
    end
end    
