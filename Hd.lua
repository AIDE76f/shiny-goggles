-- إنشاء الواجهة البرمجية (GUI)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CodeBox = Instance.new("TextBox")
local ExecuteBtn = Instance.new("TextButton")
local UICorner_Main = Instance.new("UICorner")
local UICorner_Box = Instance.new("UICorner")
local UICorner_Btn = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")

-- إعدادات الشاشة الرئيسية
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "CustomExecutor"

-- تصميم الإطار الرئيسي (Main Frame)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true -- لجعل الواجهة قابلة للسحب

UICorner_Main.CornerRadius = UDim.new(0, 15)
UICorner_Main.Parent = MainFrame

-- العنوان
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 10)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "HASSAN EXECUTOR V1"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

-- مكان وضع الكود (TextBox)
CodeBox.Name = "CodeBox"
CodeBox.Parent = MainFrame
CodeBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
CodeBox.Position = UDim2.new(0.05, 0, 0.2, 0)
CodeBox.Size = UDim2.new(0.9, 0, 0.55, 0)
CodeBox.ClearTextOnFocus = false
CodeBox.Font = Enum.Font.Code
CodeBox.MultiLine = true
CodeBox.PlaceholderText = "-- ضع السكربت الخاص بك هنا..."
CodeBox.Text = ""
CodeBox.TextColor3 = Color3.fromRGB(200, 200, 200)
CodeBox.TextSize = 14
CodeBox.TextXAlignment = Enum.TextXAlignment.Left
CodeBox.TextYAlignment = Enum.TextYAlignment.Top

UICorner_Box.CornerRadius = UDim.new(0, 10)
UICorner_Box.Parent = CodeBox

-- زر التشغيل (Execute Button)
ExecuteBtn.Name = "ExecuteBtn"
ExecuteBtn.Parent = MainFrame
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
ExecuteBtn.Position = UDim2.new(0.05, 0, 0.8, 0)
ExecuteBtn.Size = UDim2.new(0.9, 0, 0.12, 0)
ExecuteBtn.Font = Enum.Font.GothamBold
ExecuteBtn.Text = "تـشـغـيـل الـسـكـربـت"
ExecuteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteBtn.TextSize = 16

UICorner_Btn.CornerRadius = UDim.new(0, 8)
UICorner_Btn.Parent = ExecuteBtn

-- إضافة تأثير لوني متدرج للزر
UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 211, 158)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 150, 110))
}
UIGradient.Parent = ExecuteBtn

--- وظيفة التشغيل ---
ExecuteBtn.MouseButton1Click:Connect(function()
	local code = CodeBox.Text
	if code ~= "" then
		local success, err = pcall(function()
			local func = loadstring(code)
			if func then
				func()
			else
				warn("Error in script: Invalid Syntax")
			end
		end)
		
		if not success then
			warn("Execution Error: " .. err)
		end
	end
end)

-- تأثير بصري بسيط عند الضغط على الزر
ExecuteBtn.MouseEnter:Connect(function()
	ExecuteBtn.BackgroundColor3 = Color3.fromRGB(0, 190, 140)
end)
ExecuteBtn.MouseLeave:Connect(function()
	ExecuteBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
end)
