CreateClientConVar("lenny_chatspam", 0, true, false)
CreateClientConVar("lenny_spamchatorcommand", 1, true, false)



local concommcheck
local chatmsgcheck
local selectionlabel
local chatspamlabel
local chatspamentry
local chatframe


chatframe = vgui.Create('DFrame')
chatframe:SetSize(260, 135)
chatframe:SetPos(0, 260)
chatframe:SetTitle('Spam config')
chatframe:SetSizable(true)
chatframe:SetDeleteOnClose(false)
chatframe:SetVisible(false)
chatframe:MakePopup()

chatspamentry = vgui.Create('DTextEntry')
chatspamentry:SetParent(chatframe)
chatspamentry:SetSize(240, 20)
chatspamentry:SetPos(10, 105)
chatspamentry:SetText('')
chatspamentry.OnEnter = function()
	if GetConVarNumber("lenny_spamchatorcommand") == 1 then
		spamtext = ("say " ..chatspamentry:GetValue())
	else
		spamtext = chatspamentry:GetValue()
	end

end

chatspamlabel = vgui.Create('DLabel')
chatspamlabel:SetParent(chatframe)
chatspamlabel:SetPos(10, 90)
chatspamlabel:SetText('Type the Text you want to spam and hit enter')
chatspamlabel:SizeToContents()

selectionlabel = vgui.Create('DLabel')
selectionlabel:SetParent(chatframe)
selectionlabel:SetPos(10, 30)
selectionlabel:SetText('Spam...')
selectionlabel:SizeToContents()

chatmsgcheck = vgui.Create('DCheckBoxLabel')
chatmsgcheck:SetParent(chatframe)
chatmsgcheck:SetPos(10, 45)
chatmsgcheck:SetText('Checked = Chat; Unchecked = Command')
chatmsgcheck:SetValue(true)
chatmsgcheck:SetConVar("lenny_spamchatorcommand")
chatmsgcheck.DoClick = function()
end
chatmsgcheck:SizeToContents()


function chatspam()
	if GetConVarNumber("lenny_chatspam") == 1 then
			LocalPlayer():ConCommand(spamtext)
			return end
end


hook.Add("Think", "chatspammer", chatspam)


function lenny_chatspamopen()
	chatframe:SetVisible(true)
end

