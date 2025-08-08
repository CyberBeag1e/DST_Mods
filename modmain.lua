local GLOBAL = GLOBAL
local DEBUG  = false

local FONT_SIZE   = GetModConfigData("font_size")
local SPEECH_TIME = GetModConfigData("speech_time")
local SANITY_GAIN = 1
local SAY_CHANCE  = GetModConfigData("say_chance")

local THANK_YOU_TEXT = GLOBAL.require "thank_you_lines_EN"

local log = function(...)
    if DEBUG then print("[ThankfulPlant]", ...) end
end

log("Mod loaded.")

AddComponentPostInit("farmplanttendable", function(self)

    local old_TendTo = self.TendTo
    
    function self:TendTo(doer, ...)

        local result = old_TendTo(self, doer, ...)

        if not GLOBAL.TheWorld.ismastersim then
            return result
        end

        -- Won't apply when a friendly fruit fly tends to a plant
        if not (doer and doer:HasTag("player")) then
            return result
        end

        if math.random() > SAY_CHANCE then
            return result
        end

        local plant = self.inst

        if not plant.components.talker then
            plant:AddComponent("talker")
        end

        local talker = plant.components.talker
        talker.fontsize         = FONT_SIZE
        talker.font             = GLOBAL.TALKINGFONT
        talker.colour           = GLOBAL.Vector3(1, 1, 1)
        talker.timeon           = SPEECH_TIME
        talker.no_speech_sound  = true
        
        local char = doer and doer.prefab or "_default"
        local bank = THANK_YOU_TEXT[char] or THANK_YOU_TEXT._default
        local line = bank[math.random(#bank)]

        plant:DoTaskInTime(1, function()
            if plant:IsValid() then
                talker:Say(line)
                
                if doer and doer.components.sanity then
                    doer.components.sanity:DoDelta(SANITY_GAIN)
                    log(string.format("Gave %s + %d sanity", 
                                      doer:GetDisplayName(), 
                                      SANITY_GAIN))
                end
            end
        end)
        
        return result
    end
end)