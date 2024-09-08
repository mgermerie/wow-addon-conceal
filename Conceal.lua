local Conceal = CreateFrame("Frame")


function Conceal:ShowMouseOverElements()
	if MicroMenuContainer:IsMouseOver() then
		MicroMenuContainer:SetAlpha(1)
	else
		MicroMenuContainer:SetAlpha(0)
	end 
end


function Conceal:ShowElements()

	MicroMenuContainer:SetAlpha(1)
end


function Conceal:HideElements()
	
	if not MicroMenuContainer:IsMouseOver() then
		MicroMenuContainer:SetAlpha(0);
	end
end


function Conceal:MODIFIER_STATE_CHANGED(key, inOrOut)
	if ( IsAltKeyDown() ) then
		Conceal:ShowElements()
	else
		Conceal:HideElements()
	end
end


Conceal:RegisterEvent("MODIFIER_STATE_CHANGED")


function Conceal:OnEvent(event, ...)
	self[event](self, event, ...)
end


Conceal:SetScript("OnEvent", Conceal.OnEvent)
