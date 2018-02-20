SAYSAPPED_CHANNEL = "SAY";
SAYSAPPED_MESSAGE = "Sapped!";

function SaySapped_OnLoad()		
	this:RegisterEvent("PLAYER_AURAS_CHANGED");
	this.saidSap = false;
end

function SaySapped_OnEvent()

	local isSapped = false;
	
	local i = 1;
	
	while UnitDebuff("player",i) do
		SaySappedTooltipTextLeft1:SetText("");
		SaySappedTooltip:SetUnitDebuff("player",i);
		local tooltipName = SaySappedTooltipTextLeft1:GetText();
		
		if tooltipName == "Sap" then
			isSapped = true;
			break;
		end
		
		i = i+1;
	end
	
	if isSapped then
		if not this.saidSap then
			SendChatMessage(SAYSAPPED_MESSAGE, SAYSAPPED_CHANNEL);
			this.saidSap = true;
		end
	else
		this.saidSap = false;
	end
end
