local players, admins, keys = {}, {
    ["Poklava#0000"] = true
}, {0, 1, 2, 3, 32}
local yams, teams, gameStarted = {}, {"pac", "ghost"}, false
local timer, roundTime = 0, 0
local score = {
    pac = 0,
    ghost = 0,
    yamCollected = 0,
    winnerTeam = nil
}
local textAreaId = {
    winnerText = 1
}
local maps =
    {'<C><P defilante="0,0,0,0" G="0,0" MEDATA=";;;;-0;0:::1-" reload="" /><Z><S><S c="4" lua="175" L="2400" o="000000" H="2400" X="400" Y="200" T="12" P="0,0,0.3,0,0,0,0,0" /><S L="800" o="0000ff" H="10" X="400" Y="18" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" o="0000ff" H="393" X="0" Y="209" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" o="0000ff" H="393" X="800" Y="209" T="12" P="0,0,0,0,0,0,0,0" /><S L="800" o="0000ff" H="10" X="400" Y="400" T="12" P="0,0,0,0,0,0,0,0" /><S L="31" o="0000ff" H="10" X="365" Y="175" T="12" P="0,0,0,0,0,0,0,0" /><S L="100" o="0000ff" H="10" X="400" Y="225" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" o="0000ff" H="50" X="355" Y="200" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" o="0000ff" H="50" X="445" Y="200" T="12" P="0,0,0,0,0,0,0,0" /><S L="33" o="0000ff" H="10" X="434" Y="175" T="12" P="0,0,0,0,0,0,0,0" /><S L="200" o="0000ff" H="10" X="400" Y="115" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" o="0000ff" H="50" X="400" Y="41" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" o="0000ff" H="63" X="400" Y="366" T="12" P="0,0,0,0,0,0,0,0" /><S L="200" o="0000ff" H="10" X="400" Y="280" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" o="0000ff" H="125" X="560" Y="115" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" o="0000ff" H="125" X="240" Y="115" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" o="0000ff" H="63" X="455" Y="310" T="12" P="0,0,0,0,0,0,0,0" /><S L="20" o="0000ff" H="20" X="319" Y="69" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" o="0000ff" H="20" X="320" Y="70" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" o="0000ff" H="20" X="480" Y="70" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="0000ff" H="63" X="345" Y="310" T="12" P="0,0,0,0,0,0,0,0" /><S L="135" o="0000ff" H="10" X="622" Y="240" T="12" P="0,0,0,0,0,0,0,0" /><S L="135" o="0000ff" H="10" X="177" Y="240" T="12" P="0,0,0,0,0,0,0,0" /><S L="160" o="0000ff" H="10" X="60" Y="255" T="12" P="0,0,0,0,90,0,0,0" /><S L="160" o="0000ff" H="10" X="740" Y="255" T="12" P="0,0,0,0,90,0,0,0" /><S L="10" o="0000ff" H="125" X="620" Y="175" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" o="0000ff" H="125" X="180" Y="175" T="12" P="0,0,0,0,0,0,0,0" /><S L="20" o="0000ff" H="20" X="120" Y="185" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" o="0000ff" H="20" X="680" Y="185" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" o="0000ff" X="155" H="10" Y="320" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" o="0000ff" X="645" H="10" Y="320" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="0000ff" H="63" X="250" Y="366" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" o="0000ff" H="63" X="550" Y="366" T="12" P="0,0,0,0,0,0,0,0" /><S L="20" o="0000ff" H="20" X="120" Y="110" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" o="0000ff" H="20" X="680" Y="110" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="15" o="0000ff" X="505" H="10" Y="200" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S L="15" o="0000ff" X="290" H="10" Y="200" T="13" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="200" X="400" /></D><O><O C="14" Y="43" P="0" X="25" /><O C="14" Y="375" P="0" X="25" /><O C="14" Y="310" P="0" X="400" /><O C="14" Y="375" P="0" X="775" /><O C="14" Y="43" P="0" X="775" /><O C="14" Y="87" P="0" X="400" /><O C="14" Y="215" P="0" X="150" /><O C="14" Y="216" P="0" X="648" /><O C="22" Y="375" P="0" X="155" /><O C="22" Y="200" P="0" X="25" /><O C="22" Y="375" P="0" X="55" /><O C="22" Y="345" P="0" X="25" /><O C="22" Y="150" P="0" X="120" /><O C="22" Y="78" P="0" X="25" /><O C="22" Y="200" P="0" X="775" /><O C="22" Y="150" P="0" X="680" /><O C="22" Y="73" P="0" X="775" /><O C="22" Y="375" P="0" X="745" /><O C="22" Y="375" P="0" X="645" /><O C="22" Y="345" P="0" X="775" /><O C="22" Y="155" P="0" X="505" /><O C="22" Y="43" P="0" X="480" /><O C="22" Y="43" P="0" X="320" /><O C="22" Y="155" P="0" X="290" /><O C="22" Y="43" P="0" X="180" /><O C="22" Y="43" P="0" X="60" /><O C="22" Y="43" P="0" X="620" /><O C="22" Y="43" P="0" X="745" /><O C="22" Y="366" P="0" X="325" /><O C="22" Y="366" P="0" X="475" /><O C="22" Y="260" P="0" X="477" /><O C="22" Y="260" P="0" X="323" /></O><L /></Z></C>'}
local yamColors = {
    [14] = '179d81d5aa2.png', -- green
    [22] = '179d81d8985.png', -- pink
    yellow = '179d81dfebe.png' -- yellow
}
for _, i in next,
    {'AfkDeath', 'AutoShaman', 'MinimalistMode', 'WatchCommand', 'MortCommand', 'AutoScore', 'PhysicalConsumables',
     'AutoTimeLeft'} do
    tfm.exec["disable" .. i]()
end

--------------------------------
eventNewPlayer = function(name)
    players[name] = {
        point = 0,
        speed = 35,
        power = false,
        cooldown = 0,
        team = nil
    }
    for i = 1, #keys do
        system.bindKeyboard(name, keys[i], true, true)
        system.bindKeyboard(name, keys[i], false, true)
    end
end

getTagProperties = function(tag)
    local properties = {}
    for name, value in string.gmatch(tag, '(%S+)%s*=%s*"([^"]*)"') do
        properties[name] = tonumber(value) or value
    end
    return properties
end

spawnYams = function()
    for i in next, yams do
        for name in next, players do
            if players[name].team == "pac" then
                tfm.exec.addBonus(0, yams[i].x, yams[i].y, i, 0, false, name)
            end
        end
        yams[i].color = tfm.exec.addImage(yamColors[yams[i].yamType], "_100", yams[i].x, yams[i].y, nil, 0.08, 0.08,
            nil, 1, 0.5, 0.5)
    end
end

stopGame = function()
    score["winnerTeam"] =
        score["yamCollected"] >= #yams and "<font color='#FFFF00'>PACS</font>" or getAlive("pac") <= 0 and
            "<font color='#7700FF'>GHOSTS</font>" or "<font color='#FFFFFF'>DRAW</font>"
            ui.addTextArea(textAreaId.winnerText,
                "<p align='center'><font size='100'>\n" .. score["winnerTeam"] .. "</font></p>", nil, 0, 17, 800, 383,
                0x000000, 0x7700FF, 0.5, true)
    if score["winnerTeam"] == "<font color='#FFFFFF'>DRAW</font>" then
        return
    end
    for _, i in next, {"pac", "ghost"} do
        if getAlive(i) > 0 and gameStarted then
            score[i] = score[i] + 1
        end
    end
    for name in next, players do
        players[name].team = nil
    end
end

setTeams = function()
    local all, count = {}, 0
    local half = 0
    for name in next, players do
        half = half + 1
        all[half] = name
    end
    half = half / 2
    repeat
        local player = all[math.random(#all)]
        if players[player].team == nil then
            if count < half then
                players[player].team = "pac"
                tfm.exec.movePlayer(player, 400, 257, false, 0, 0, true)
            else
                players[player].team = "ghost"
            end
            tfm.exec.setNameColor(player, players[player].team == "pac" and 0xffff00 or 0x7700ff)
            count = count + 1
        end
    until (count >= half * 2)
end

getClosestPlayerTo = function(name)
    local list = {}
    for iname in next, players do
        if name ~= iname then
            table.insert(list, iname)
            list[#list] = {((tfm.get.room.playerList[name].x - tfm.get.room.playerList[iname].x) ^ 2 +
                (tfm.get.room.playerList[name].y - tfm.get.room.playerList[iname].y) ^ 2) ^ 0.5, iname,
                           tfm.get.room.playerList[iname].x - tfm.get.room.playerList[name].x,
                           tfm.get.room.playerList[iname].y - tfm.get.room.playerList[name].y}
        end
    end
    local tempLocation = list[1]
    for i = 1, #list do
        if list[i][1] < tempLocation[1] then
            tempLocation = list[i]
        end
    end
    if tempLocation[1] <= 25 then
        if players[name].team == "ghost" and players[tempLocation[2]].team == "pac" and
            players[tempLocation[2]].cooldown <= 0 or players[name].team == "pac" and players[name].cooldown > 0 then
            return tempLocation[2]
        else
            return nil
        end
    end
end

getAlive = function(a)
    local count = 0
    for name in next, players do
        if players[name].team == a and not tfm.get.room.playerList[name].isDead then
            count = count + 1
        end
    end
    return count
end
--------------------------------

for name in next, tfm.get.room.playerList do
    eventNewPlayer(name)
end

eventLoop = function(et, rt)
    if gameStarted then
        roundTime = roundTime + 0.5
        if roundTime >= 60 * 5 + 3 then
            stopGame()
            roundTime = 0
        end
        for name in next, players do
            if players[name].cooldown > 0 then
                players[name].cooldown = players[name].cooldown - 1
            else
                if players[name].team == "ghost" then
                    tfm.exec.respawnPlayer(name)
                end
                tfm.exec.setNameColor(name, players[name].team == "pac" and 0xffff00 or 0x7700ff)
            end
        end
        if score["winnerTeam"] then
            tfm.exec.setGameTime(0)
            stopGame()
            timer = timer + 1
            if timer >= 5 then
                ui.removeTextArea(textAreaId.winnerText, nil)
                tfm.exec.newGame(maps[1])
                score["winnerTeam"] = false
                gameStarted = false
                timer = 0
            end
        end
    end
end

eventPlayerDied = function(name)
    if players[name].team == "ghost" then
        players[name].cooldown = 12
    else

    end
end

eventNewGame = function()
    gameStarted = true
    for name in next, players do
        tfm.exec.setPlayerScore(name, 0, false)
        players[name].team = nil
    end
    score["yamCollected"] = 0
    if #yams > 0 then
        for i in next, yams do
            tfm.exec.removeImage(yams[i])
        end
    end
    yams = {}
    local xml = tfm.get.room.xmlMapInfo.xml

    local yamCounts = 1
    local mouse_start = string.match(xml, '<DS%s+(.-)%s+/>')

    for tag in string.gmatch(xml, '<O%s+(.-)%s+/>') do
        properties = getTagProperties(tag)
        yams[yamCounts] = {
            x = properties.X,
            y = properties.Y,
            yamType = properties.C,
            color = nil
        }
        yamCounts = yamCounts + 1
    end
    setTeams()
    spawnYams()
    ui.setMapName(
        "<font color='#FFFF00'> Pacs</font> : " .. score["pac"] .. " <font color='#ffffff'>|</font> Ghosts : " ..
            score["ghost"])
    tfm.exec.setGameTime(60 * 5 + 3)
end

eventKeyboard = function(name, key, down, x, y)
    if gameStarted then
        if key == 1 then
            if down then
                tfm.exec.movePlayer(name, 0, 0, false, 0, -players[name].speed, false)
            else
                tfm.exec.movePlayer(name, 0, 0, false, 0, -1, false)
                tfm.exec.movePlayer(name, 0, 0, false, 0, 1, true)
            end
        elseif key == 3 then
            if down then
                tfm.exec.movePlayer(name, 0, 0, false, 0, players[name].speed, false)
            else
                tfm.exec.movePlayer(name, 0, 0, false, 0, -1, false)
                tfm.exec.movePlayer(name, 0, 0, false, 0, 1, true)
            end
        elseif key == 0 then
            if down then
                tfm.exec.movePlayer(name, 0, 0, false, -players[name].speed + 5, 0, false)
            else
                tfm.exec.movePlayer(name, 0, 0, false, -1, 0, false)
                tfm.exec.movePlayer(name, 0, 0, false, 1, 0, true)
            end
        elseif key == 2 then
            if down then
                tfm.exec.movePlayer(name, 0, 0, false, players[name].speed - 5, 0, false)
            else
                tfm.exec.movePlayer(name, 0, 0, false, -1, 0, false)
                tfm.exec.movePlayer(name, 0, 0, false, 1, 0, true)
            end
        elseif key == 32 then
            if not tfm.get.room.playerList[name].isDead and players[getClosestPlayerTo(name)] then
                if players[name].team == "ghost" or players[name].cooldown > 0 then
                    tfm.exec.killPlayer(getClosestPlayerTo(name))
                    if getAlive("pac") <= 0 then
                        score["winnerTeam"] =
                        score["yamCollected"] >= #yams and "<font color='#FFFF00'>PACS</font>" or getAlive("pac") <= 0 and
                            "<font color='#7700FF'>GHOSTS</font>" or "<font color='#FFFFFF'>DRAW</font>"
                    end
                end
            end
        end
    end
end

eventPlayerBonusGrabbed = function(name, bonusId)
    score["yamCollected"] = score["yamCollected"] + 1
    if yams[bonusId].yamType == 14 then
        players[name].cooldown = 10
        tfm.exec.setNameColor(name, 0xff0000)
    end
    if score["yamCollected"] >= #yams then
        score["winnerTeam"] =
                        score["yamCollected"] >= #yams and "<font color='#FFFF00'>PACS</font>" or getAlive("pac") <= 0 and
                            "<font color='#7700FF'>GHOSTS</font>" or "<font color='#FFFFFF'>DRAW</font>"
    end
    tfm.exec.removeBonus(bonusId, nil)
    tfm.exec.removeImage(yams[bonusId].color)
    tfm.exec.setPlayerScore(name, 1, true)
    ui.setMapName(
        "<font color='#FFFF00'> Pacs</font> : " .. score["pac"] .. " <font color='#ffffff'>|</font> Ghosts : " ..
            score["ghost"])
end
tfm.exec.newGame(maps[1])
