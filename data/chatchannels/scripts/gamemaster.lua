function canJoin(cid)
        return Player(cid):getAccountType() >= ACCOUNT_TYPE_GAMEMASTER
end

function onSpeak(cid, type, message)
        if(type == TALKTYPE_CHANNEL_Y) then
                if(Player(cid):getAccountType() == ACCOUNT_TYPE_GOD) then
                        type = TALKTYPE_CHANNEL_O
                end
        elseif(type == TALKTYPE_CHANNEL_O) then
                if(Player(cid):getAccountType() ~= ACCOUNT_TYPE_GOD) then
                        type = TALKTYPE_CHANNEL_Y
                end
        elseif(type == TALKTYPE_CHANNEL_R1) then
                if(Player(cid):getAccountType() ~= ACCOUNT_TYPE_GOD and not getPlayerFlagValue(cid, PlayerFlag_CanTalkRedChannel)) then
                        type = TALKTYPE_CHANNEL_Y
                end
        end
return type
end
