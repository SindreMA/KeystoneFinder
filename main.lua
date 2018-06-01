--VV---------------------------------------------Locals---------------------------------------------VV--
--VV---------------------------------------------Locals---------------------------------------------VV--
--VV---------------------------------------------Locals---------------------------------------------VV--
local BolsteringSkittishFortified = {"Return to Karazhan: Upper","Halls of Valor","Eye of Azshara","Vault of the Wardens","Cathedral of Eternal Night","Darkheart Thicket","Court of Stars","Neltharion's Lair","The Arcway","Return to Karazhan: Lower","Maw of Souls","Black Rook Hold","Seat of the Triumvirate"}
local BolsteringGrievousTyrannical = {"Cathedral of Eternal Night","Court of Stars","The Arcway","Vault of the Wardens","Return to Karazhan: Upper","Neltharion's Lair","Black Rook Hold","Eye of Azshara","Maw of Souls","Darkheart Thicket","Return to Karazhan: Lower","Halls of Valor","Seat of the Triumvirate"}
local BolsteringExplosiveTyrannical = {"Cathedral of Eternal Night","Court of Stars","The Arcway","Neltharion's Lair","Vault of the Wardens","Return to Karazhan: Upper","Halls of Valor","Eye of Azshara","Darkheart Thicket","Black Rook Hold","Maw of Souls","Return to Karazhan: Lower","Seat of the Triumvirate"}
local BurstingQuakingFortified = {"Return to Karazhan: Upper","Halls of Valor","Cathedral of Eternal Night","Vault of the Wardens","Return to Karazhan: Lower","Eye of Azshara","Neltharion's Lair","Black Rook Hold","Court of Stars","Darkheart Thicket","The Arcway","Maw of Souls","Seat of the Triumvirate"}
local BurstingSkittishTyrannical = {"Court of Stars","Cathedral of Eternal Night","Neltharion's Lair","The Arcway","Black Rook Hold","Vault of the Wardens","Return to Karazhan: Lower","Return to Karazhan: Upper","Eye of Azshara","Seat of the Triumvirate","Maw of Souls","Darkheart Thicket","Halls of Valor"}
local RagingVolcanicTyrannical = {"Court of Stars","Cathedral of Eternal Night","The Arcway","Neltharion's Lair","Black Rook Hold","Vault of the Wardens","Return to Karazhan: Lower","Eye of Azshara","Return to Karazhan: Upper","Darkheart Thicket","Maw of Souls","Seat of the Triumvirate","Halls of Valor"}
local RagingNecroticTyrannical = {"Neltharion's Lair","Court of Stars","Eye of Azshara","Cathedral of Eternal Night","The Arcway","Darkheart Thicket","Halls of Valor","Black Rook Hold","Return to Karazhan: Lower","Return to Karazhan: Upper","Seat of the Triumvirate","Vault of the Wardens","Maw of Souls"}
local SanguineGrievousFortified = {"Return to Karazhan: Upper","Eye of Azshara","Halls of Valor","Vault of the Wardens","Cathedral of Eternal Night","Neltharion's Lair","Return to Karazhan: Lower","The Arcway","Darkheart Thicket","Court of Stars","Black Rook Hold","Maw of Souls","Seat of the Triumvirate"}
local SanguineNecroticFortified = {"Return to Karazhan: Upper","Halls of Valor","Eye of Azshara","Neltharion's Lair","Cathedral of Eternal Night","Darkheart Thicket","Vault of the Wardens","Court of Stars","The Arcway","Return to Karazhan: Lower","Black Rook Hold","Maw of Souls","Seat of the Triumvirate"}
local SanguineVolcanicFortified = {"Halls of Valor","Return to Karazhan: Upper","Vault of the Wardens","Eye of Azshara","Return to Karazhan: Lower","Cathedral of Eternal Night","Neltharion's Lair","The Arcway","Darkheart Thicket","Court of Stars","Black Rook Hold","Seat of the Triumvirate","Maw of Souls"}
local TeemingQuakingFortified = {"Return to Karazhan: Upper","Vault of the Wardens","Return to Karazhan: Lower","Eye of Azshara","Cathedral of Eternal Night","Halls of Valor","Court of Stars","Black Rook Hold","Neltharion's Lair","Darkheart Thicket","Seat of the Triumvirate","Maw of Souls","The Arcway"}
local TeemingExplosiveFortified = {"Return to Karazhan: Upper","Vault of the Wardens","Halls of Valor","Eye of Azshara","Court of Stars","Cathedral of Eternal Night","Black Rook Hold","Neltharion's Lair","Darkheart Thicket","Return to Karazhan: Lower","Maw of Souls","The Arcway","Seat of the Triumvirate"}
local TeemingVolcanicTyrannical = {"Cathedral of Eternal Night","Court of Stars","Vault of the Wardens","Return to Karazhan: Lower","The Arcway","Neltharion's Lair","Black Rook Hold","Eye of Azshara","Maw of Souls","Return to Karazhan: Upper","Darkheart Thicket","Seat of the Triumvirate","Halls of Valor"}
local Checking = false
local keystones = {}

--^^---------------------------------------------Locals---------------------------------------------^^--
--^^---------------------------------------------Locals---------------------------------------------^^--
--^^---------------------------------------------Locals---------------------------------------------^^--
--VV---------------------------------------------Frames---------------------------------------------VV--
--VV---------------------------------------------Frames---------------------------------------------VV--
--VV---------------------------------------------Frames---------------------------------------------VV--
local frame3=CreateFrame("Frame");
frame3:RegisterEvent("CHAT_MSG_PARTY")
frame3:RegisterEvent("CHAT_MSG_PARTY_LEADER")
frame3:SetScript("OnEvent",function(self,event,msg)
    if string.find(msg, "eystone") and msg ~= "Keystone added to list!" and msg ~= "Link your Keystones in party chat!" and Checking then
     	SendChatMessage("Keystone added to list!","PARTY")
		table.insert(keystones,msg)
	end
end)
--^^---------------------------------------------Frames---------------------------------------------^^--
--^^---------------------------------------------Frames---------------------------------------------^^--
--^^---------------------------------------------Frames---------------------------------------------^^--
--VV---------------------------------------------Function---------------------------------------------VV--
--VV---------------------------------------------Function---------------------------------------------VV--
--VV---------------------------------------------Function---------------------------------------------VV--
function split(s, sep)
    local fields = {}
    local sep = sep or " "
    local pattern = string.format("([^%s]+)", sep)
    string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
    return fields
end
function GetAffixesFromKey(Keyname)
  local _split = split(Keyname, ":")  
  local name, description = C_ChallengeMode.GetAffixInfo(_split[4])
  local affixcomonation = name
  local name, description = C_ChallengeMode.GetAffixInfo(_split[5])
  affixcomonation = affixcomonation .. name
  local _split = split(_split[6],"[")
  if string.find(_split[1], "10") then
	name = "Fortified  else	
	name = "Tyrannical"
  end
  affixcomonation = affixcomonation .. name
  return affixcomonation
end
function GetFirstItem(list, Keys)
  for i = 1, #list do
    local itemlist = list[i]
    for o = 1, #Keys do
      local itemkeys = Keys[o]
      if string.find(itemkeys,itemlist) then
        return itemkeys 
      end
    end
  end
  return "Didnt find key"
end
function GetBestDungeon(Keys , AffixCombo)

  if AffixCombo == "BolsteringSkittishFortified" then
    local firstitem = GetFirstItem(BolsteringSkittishFortified,Keys)
    return(firstitem)
  elseif AffixCombo == "BolsteringGrievousTyrannical" then
    local firstitem = GetFirstItem(BolsteringGrievousTyrannical,Keys)
    return(firstitem)
  elseif AffixCombo == "BolsteringExplosiveTyrannical" then
  local firstitem = GetFirstItem(BolsteringExplosiveTyrannical,Keys)
    return(firstitem)
  elseif AffixCombo == "BurstingQuakingFortified" then
  local firstitem = GetFirstItem(BurstingQuakingFortified,Keys)
    return(firstitem)
  elseif AffixCombo == "BurstingSkittishTyrannical" then
  local firstitem = GetFirstItem(BurstingSkittishTyrannical,Keys)
    return(firstitem)
  elseif AffixCombo == "RagingVolcanicTyrannical" then
  local firstitem = GetFirstItem(RagingVolcanicTyrannical,Keys)
    return(firstitem)
  elseif AffixCombo == "RagingNecroticTyrannical" then
  local firstitem = GetFirstItem(RagingNecroticTyrannical,Keys)
    return(firstitem)
  elseif AffixCombo == "SanguineGrievousFortified" then
  local firstitem = GetFirstItem(SanguineGrievousFortified,Keys)
    return(firstitem)
  elseif AffixCombo == "SanguineNecroticFortified" then
  local firstitem = GetFirstItem(SanguineNecroticFortified,Keys)
    return(firstitem)
  elseif AffixCombo == "SanguineVolcanicFortified" then
  local firstitem = GetFirstItem(SanguineVolcanicFortified,Keys)
    return(firstitem)
  elseif AffixCombo == "TeemingQuakingFortified" then
  local firstitem = GetFirstItem(TeemingQuakingFortified,Keys)
    return(firstitem)
  elseif AffixCombo == "TeemingExplosiveFortified" then
  local firstitem = GetFirstItem(TeemingExplosiveFortified,Keys)
    return(firstitem)
  elseif AffixCombo == "TeemingVolcanicTyrannical" then
    local firstitem = GetFirstItem(TeemingVolcanicTyrannical,Keys)
    return(firstitem)
  else
    return "cant get affix"
  end
end
function GetBestDungeons(AffixCombo)
  if AffixCombo == "BolsteringSkittishFortified" then
    local firstitem = BolsteringSkittishFortified
    return(firstitem)
  elseif AffixCombo == "BolsteringGrievousTyrannical" then
    local firstitem = BolsteringGrievousTyrannical
    return(firstitem)
  elseif AffixCombo == "BolsteringExplosiveTyrannical" then
  local firstitem = BolsteringExplosiveTyrannical
    return(firstitem)
  elseif AffixCombo == "BurstingQuakingFortified" then
  local firstitem = BurstingQuakingFortified
    return(firstitem)
  elseif AffixCombo == "BurstingSkittishTyrannical" then
  local firstitem = BurstingSkittishTyrannical
    return(firstitem)
  elseif AffixCombo == "RagingVolcanicTyrannical" then
  local firstitem = RagingVolcanicTyrannical
    return(firstitem)
  elseif AffixCombo == "RagingNecroticTyrannical" then
  local firstitem = RagingNecroticTyrannical
    return(firstitem)
  elseif AffixCombo == "SanguineGrievousFortified" then
  local firstitem = SanguineGrievousFortified
    return(firstitem)
  elseif AffixCombo == "SanguineNecroticFortified" then
  local firstitem = SanguineNecroticFortified
    return(firstitem)
  elseif AffixCombo == "SanguineVolcanicFortified" then
  local firstitem = SanguineVolcanicFortified
    return(firstitem)
  elseif AffixCombo == "TeemingQuakingFortified" then
  local firstitem = TeemingQuakingFortified
    return(firstitem)
  elseif AffixCombo == "TeemingExplosiveFortified" then
  local firstitem = TeemingExplosiveFortified
    return(firstitem)
  elseif AffixCombo == "TeemingVolcanicTyrannical" then
    local firstitem = TeemingVolcanicTyrannical
    return(firstitem)
  else
    return "cant get affix"
  end
end
function MyAddonCommands(msg, editbox, self)
    print("")
    if msg == 'start' then
    -------------------------------------------
		keystones = {}
		Checking = true
        local SendMsg = "Link your Keystones in party chat!"
     	SendChatMessage(SendMsg,"PARTY")

    -------------------------------------------
    elseif msg == 'end' then
	-------------------------------------------
		Checking = false
		math.random()
		math.random()
		math.random()
		local Random = math.random(1, #keystones)
		if #keystones > 0 then
			local SendMsg = "Random key is: " .. keystones[Random]
			SendChatMessage(SendMsg,"PARTY")
			local _AffixCombo = GetAffixesFromKey(keystones[Random])
			local l = GetBestDungeon(keystones,_AffixCombo)
			SendChatMessage("Best dungeon for affix: " .. l,"PARTY")
		else
		   local SendMsg = "No keystones found!"
			SendChatMessage(SendMsg,"PARTY")
		end
    -------------------------------------------   
	elseif msg == 'list' then
	-------------------------------------------
	for bag = 0,4 do
		for slot = 1,GetContainerNumSlots(bag) do
			local item = GetContainerItemLink(bag,slot)
			if item and item:find("eystone") then
					local w = GetAffixesFromKey(item)
					local q = GetBestDungeons(w)
					local Ranks = ""
					if	UnitInParty("player") then
						SendChatMessage("Best dungeons for current affixes : ","PARTY")					
						for i = 1, #q do
							SendChatMessage(i .. "." .. q[i],"PARTY")
						end
					else
						print("Best dungeons for current affixes : ")
						for i = 1, #q do
							print(i .. "." .. q[i])
						end
					end			
			end
		end
	end
    -------------------------------------------
    else
        print("|cFF0070DEKeystoneFinder command list:|r")
        print("|cFFFF7D0A/kf|r |cFFFFF569start|r : Start gathering keys")
        print("|cFFFF7D0A/kf|r |cFFFFF569end|r : Ends the keysearch and selects a random, and tells whats best for the week")
		print("|cFFFF7D0A/kf|r |cFFFFF569list|r : Prints the whole list to you, sends to party chat if ur in a party")
    end
    print("")
end
--^^---------------------------------------------Function---------------------------------------------^^--
--^^---------------------------------------------Function---------------------------------------------^^--
--^^---------------------------------------------Function---------------------------------------------^^--
SLASH_KF1 = '/kf'
SlashCmdList["KF"] = MyAddonCommands