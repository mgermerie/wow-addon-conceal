local Conceal = CreateFrame("Frame")


function Conceal:ShowMouseOverElements()

	if IsAltKeyDown() then return end

	if BagsBar:IsMouseOver() or MicroMenuContainer:IsMouseOver() then
		
		BagsBar:SetAlpha(1)
		MicroMenuContainer:SetAlpha(1)
	
	else

		BagsBar:SetAlpha(0)
		MicroMenuContainer:SetAlpha(0)
		
	end 
end


function Conceal:ShowElements()

	BagsBar:SetAlpha(1)
	MicroMenuContainer:SetAlpha(1)
	
end


function Conceal:HideElements()

	if BagsBar:isMouseOver() then
		
		MicroMenuContainer:SetAlpha(0)
		
	elseif MicroMenuContainer:IsMouseOver() then
		
		BagsBar:SetAlpha(0)
		
	else

		BagsBar:SetAlpha(0)
		MicroMenuContainer:SetAlpha(0)
		
	end
	
end


function Conceal:OnInitialize()

	C_Timer.NewTicker(0.25, function()
		Conceal:ShowMouseOverElements()
	end)
	
end


function Conceal:ADDON_LOADED(event, addOnName)
	
	if event == "ADDON_LOADED" and (addOnName == "Conceal") then
		
		Conceal:OnInitialize()
		
	end
	
end


function Conceal:MODIFIER_STATE_CHANGED(key, inOrOut)
	
	if ( IsAltKeyDown() ) then
		
		Conceal:ShowElements()
		
	else
		Conceal:HideElements()
		
	end
	
end


Conceal:RegisterEvent("ADDON_LOADED")
Conceal:RegisterEvent("MODIFIER_STATE_CHANGED")


function Conceal:OnEvent(event, ...)
	
	self[event](self, event, ...)
	
end


Conceal:SetScript("OnEvent", Conceal.OnEvent)
