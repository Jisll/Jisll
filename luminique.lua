Hier ist der komplette Code, bei dem der Name "NEVERLOSE" durch "Luminique" ersetzt wurde und das Design entsprechend angepasst wurde:

```lua
--[[	

	|	LUMINIQUE	UI	|
		THIS UI MAKE BY [Your Name]		
		original Luminique
		
		[https://yourwebsite.com/] - custom UI design
]]

local LocalPlayer = game:GetService('Players').LocalPlayer;
local Mouse = LocalPlayer:GetMouse();
local InputService = game:GetService('UserInputService');
local TextService = game:GetService('TextService');
local TweenService = game:GetService('TweenService');
local CoreGui = game:FindFirstChild('CoreGui') or LocalPlayer.PlayerGui;

local ProtectGui = protectgui or (syn and syn.protect_gui) or (function() end);

local function create_button(asd)
	local button = Instance.new('TextButton')
	button.Size = UDim2.new(1, 0, 1, 0)
	button.BackgroundTransparency = 1
	button.TextTransparency = 1
	button.Text = ""
	button.Parent = asd
	button.ZIndex = 5000
	return button
end

local function ConnectButtonEffect(UIFrame, UIStroke, int)
	if not UIStroke then
		return
	end

	int = int or 0.2
	local OldColor = UIStroke.Color
	local R, G, B = OldColor.R, OldColor.G, OldColor.B
	local MainColor = Color3.fromHSV(R, G, B + int)

	UIFrame.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseMovement then
			TweenService:Create(UIStroke, TweenInfo.new(0.2), {Color = MainColor}):Play()
		end
	end)

	UIFrame.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseMovement then
			TweenService:Create(UIStroke, TweenInfo.new(0.2), {Color = OldColor}):Play()
		end
	end)
end

local function scrolling_connect(scrollframe)
	task.spawn(function()
		local addres = 45
		local UIListLayout = scrollframe:WaitForChild('UIListLayout', 9999999)
		scrollframe.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + addres)

		UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
			scrollframe.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + addres)
		end)
	end)
end

local function GetImageData(name, image)
	name = name or "ADS"
	name = name:lower()
	local NigImage = "rbxassetid://3926305904"
	if name == "ads" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(205, 565)
		image.ImageRectSize = Vector2.new(35, 35)
	end

	if name == "list" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(485, 205)
		image.ImageRectSize = Vector2.new(35, 35)
	end

	if name == "folder" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(805, 45)
		image.ImageRectSize = Vector2.new(35, 35)
	end

	if name == "earth" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(604, 324)
		image.ImageRectSize = Vector2.new(35, 35)
	end

	if name == "locked" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(524, 644)
		image.ImageRectSize = Vector2.new(35, 35)
	end

	if name == "home" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(964, 205)
		image.ImageRectSize = Vector2.new(35, 35)
	end

	if name == "mouse" then
		image.Image = "rbxassetid://3515393063"
	end

	if name == "user" then
		image.Image = "rbxassetid://10494577250"
	end
end

local LUMINIQUE = {
	auto_function = {},
	Themes = {
		BackgroundColor = Color3.fromRGB(240, 240, 240),
		ForegroundColor = Color3.fromRGB(255, 255, 255),
		AccentColor = Color3.fromRGB(0, 122, 255),
		StrokeColor = Color3.fromRGB(200, 200, 200),
		TextColor = Color3.fromRGB(0, 0, 0),
	},
	_Version = "10.C",
	_Name = "Luminique"
}

print(LUMINIQUE._Name..":", LUMINIQUE._Version..':', [[https://yourwebsite.com/]], ": UI BY [Your Name]","__ui")

function LUMINIQUE:Theme(name)
	name = tostring(name or "original"):lower()
	if name == "original" then
		LUMINIQUE.Themes.BackgroundColor = Color3.fromRGB(240, 240, 240)
		LUMINIQUE.Themes.ForegroundColor = Color3.fromRGB(255, 255, 255)
		LUMINIQUE.Themes.AccentColor = Color3.fromRGB(0, 122, 255)
		LUMINIQUE.Themes.StrokeColor = Color3.fromRGB(200, 200, 200)
		LUMINIQUE.Themes.TextColor = Color3.fromRGB(0, 0, 0)
	end

	if name == "nightly" then
		LUMINIQUE.Themes.BackgroundColor = Color3.fromRGB(43, 43, 43)
		LUMINIQUE.Themes.ForegroundColor = Color3.fromRGB(16, 16, 16)
		LUMINIQUE.Themes.AccentColor = Color3.fromRGB(255, 140, 0)
		LUMINIQUE.Themes.StrokeColor = Color3.fromRGB(65, 54, 31)
		LUMINIQUE.Themes.TextColor = Color3.fromRGB(100, 100, 100)
	end

	if name == "dark" then
		LUMINIQUE.Themes.BackgroundColor = Color3.fromRGB(37, 37, 37)
		LUMINIQUE.Themes.ForegroundColor = Color3.fromRGB(8, 8, 8)
		LUMINIQUE.Themes.AccentColor = Color3.fromRGB(0, 172, 247)
		LUMINIQUE.Themes.StrokeColor = Color3.fromRGB(64, 65, 67)
		LUMINIQUE.Themes.TextColor = Color3.fromRGB(25, 25, 25)
	end
end

function LUMINIQUE:AddWindow(NameScriptHub, Text, UICustomSize)
	local WindowFunctions = {}
	local ToggleUI = false
	local oldsize = UICustomSize or UDim2.new(0.200000003, 210, 0.200000003, 175)
	local Tabs = {}

	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Frame_2 = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Frame_3 = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local DropShadow = Instance.new("ImageLabel")
	local HeadName = Instance.new("TextLabel")
	local TabButtons = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local TabHose = Instance.new("Frame")
	local outlo = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local outlo_2 = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")
	local outlo_3 = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local UserData = Instance.new("Frame")
	local UICorner_7 = Instance.new("UICorner")
	local UserImage = Instance.new("ImageLabel")
	local UICorner_8 = Instance.new("UICorner")
	local UserName = Instance.new("TextLabel")
	local headd2text
	local oldPositionClose
	
	--Anti Spoofer
	ScreenGui:GetPropertyChangedSignal('Enabled'):Connect(function()
		if not ScreenGui.Enabled then
			ScreenGui.Enabled=true
		end
	end)
	
	task.spawn(function()
		if Text then
			local TextLabel = Instance.new("TextLabel")

			TextLabel.Parent = Frame
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.243000001, 0, 0.0250000004, 0)
			TextLabel.Size = UDim2.new(0.666889787, 0, 0.0627818182, 0)
			TextLabel.ZIndex = 5
			TextLabel.Font = Enum.Font.SourceSansBold
			TextLabel.Text = Text or" "
			TextLabel.TextColor3

 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 255, 255)
			TextLabel.TextStrokeTransparency = 0.900
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel.RichText=true

			headd2text=TextLabel
		end
	end)

	local toggle_valu = true

	local function ui_toggleong(val)
		local uptime=1.4
		if val then
			TweenService:Create(Frame,TweenInfo.new(uptime,Enum.EasingStyle.Quint),{Size=oldsize,Position=UDim2.new(0.5,0,0.5,0)}):Play()
			TweenService:Create(HeadName,TweenInfo.new(uptime/3,Enum.EasingStyle.Quint),{Size=UDim2.new(0.205458686, 0, 0.133462012, 0),Position=UDim2.new(0.0100000342, 0, 0.010000146, 0)}):Play()


			TweenService:Create(TabHose,TweenInfo.new(0.3),{Position=UDim2.new(.223,0,0.143,0)}):Play()
			TweenService:Create(TabButtons,TweenInfo.new(0.3),{Position=UDim2.new(.008,0,0.143,0)}):Play()

			if headd2text then
				TweenService:Create(headd2text,TweenInfo.new(0.3),{TextTransparency=0,TextStrokeTransparency=0.900}):Play()
			end

			TweenService:Create(UserName,TweenInfo.new(0.3),{TextTransparency=0,TextStrokeTransparency=1}):Play()
			TweenService:Create(UserImage,TweenInfo.new(0.3),{ImageTransparency=0}):Play()
			TweenService:Create(outlo,TweenInfo.new(0.3),{BackgroundTransparency=0.7}):Play()
			TweenService:Create(outlo_2,TweenInfo.new(0.3),{BackgroundTransparency=0.7}):Play()
			TweenService:Create(outlo_3,TweenInfo.new(0.3),{BackgroundTransparency=0.7}):Play()
			TweenService:Create(Frame_2,TweenInfo.new(0.3),{BackgroundTransparency=0}):Play()
			TweenService:Create(Frame_3,TweenInfo.new(0.3),{BackgroundTransparency=0.9}):Play()
			TweenService:Create(DropShadow,TweenInfo.new(0.3),{ImageTransparency=0.86}):Play()

		else
			TweenService:Create(Frame,TweenInfo.new(uptime,Enum.EasingStyle.Quint),{Size=UDim2.new(0.14, 0,0.14, 0),Position=oldPositionClose}):Play()
			TweenService:Create(HeadName,TweenInfo.new(uptime/1.2,Enum.EasingStyle.Quint),{Size=UDim2.new(0.9, 0,0.5, 0),Position=UDim2.new(0.046,0,0.24,0)}):Play()

			TweenService:Create(TabHose,TweenInfo.new(0.3),{Position=UDim2.new(1.5,0,0.143,0)}):Play()
			TweenService:Create(TabButtons,TweenInfo.new(0.3),{Position=UDim2.new(-1.25,0,0.143,0)}):Play()

			if headd2text then
				TweenService:Create(headd2text,TweenInfo.new(0.3),{TextTransparency=1,TextStrokeTransparency=1}):Play()
			end

			TweenService:Create(UserName,TweenInfo.new(0.3),{TextTransparency=1,TextStrokeTransparency=1}):Play()
			TweenService:Create(UserImage,TweenInfo.new(0.3),{ImageTransparency=1}):Play()
			TweenService:Create(outlo,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
			TweenService:Create(outlo_2,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
			TweenService:Create(outlo_3,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
			TweenService:Create(Frame_2,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
			TweenService:Create(Frame_3,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
			TweenService:Create(DropShadow,TweenInfo.new(0.3),{ImageTransparency=1}):Play()
		end
	end

	task.spawn(function()
		local ImageButton = Instance.new("ImageButton")

		ImageButton.Parent = Frame
		ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageButton.BackgroundTransparency = 1.000
		ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageButton.BorderSizePixel = 0
		ImageButton.Position = UDim2.new(0.908723712, 0, 0.0239103697, 0)
		ImageButton.Size = UDim2.new(0.0900000036, 0, 0.0900000036, 0)
		ImageButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
		ImageButton.ZIndex = 4
		ImageButton.Image = "rbxassetid://10002398990"
		ImageButton.ScaleType = Enum.ScaleType.Fit

		ImageButton.MouseButton1Click:Connect(function()
			toggle_valu=not toggle_valu

			if toggle_valu then
				oldPositionClose = Frame.Position
				TweenService:Create(ImageButton,TweenInfo.new(0.5),{
					Size=UDim2.new(0.0900000036, 0, 0.0900000036, 0),
					Position=UDim2.new(0.908723712, 0, 0.0239103697, 0),
					AnchorPoint=Vector2.new(0,0)
				}):Play()
			else
				TweenService:Create(ImageButton,TweenInfo.new(0.5),{
					Size=UDim2.new(0.3, 0,0.3, 0),
					Position=UDim2.new(1,0,-0.009,0),
					AnchorPoint=Vector2.new(1,0)
				}):Play()
			end

			ui_toggleong(toggle_valu)
		end)
	end)

	task.spawn(function()
		local dragToggle = nil
		local dragSpeed = 0.15
		local dragStart = nil
		local startPos = nil

		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(Frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
		end

		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not toggle_valu then 
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)

		InputService.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle and not toggle_valu then
					updateInput(input)
				end
			end
		end)
	end)

	ScreenGui.Parent = CoreGui
	ScreenGui.ResetOnSpawn = false
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
	ProtectGui(ScreenGui)

	Frame.Parent = ScreenGui
	Frame.Active = true
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = LUMINIQUE.Themes.BackgroundColor
	Frame.BackgroundTransparency = 0.200
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.Size = UDim2.new(0,0,0,0)
	Frame.ZIndex = 2
	Frame.ClipsDescendants=true

	TweenService:Create(Frame,TweenInfo.new(1,Enum.EasingStyle.Quint),{Size=oldsize}):Play()

	UICorner.Parent = Frame

	Frame_2.Parent = Frame
	Frame_2.BackgroundColor

3 = LUMINIQUE.Themes.ForegroundColor
	Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_2.BorderSizePixel = 0
	Frame_2.Position = UDim2.new(0.223214373, 0, 0, 0)
	Frame_2.Size = UDim2.new(0.774634778, 0, 1, 0)
	Frame_2.ZIndex = 2

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Frame_2

	Frame_3.Parent = Frame
	Frame_3.BackgroundColor3 = LUMINIQUE.Themes.HeaderColor
	Frame_3.BackgroundTransparency = 0.900
	Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_3.BorderSizePixel = 0
	Frame_3.Position = UDim2.new(0.223214373, 0, 0, 0)
	Frame_3.Size = UDim2.new(0.774999976, 0, 0.140000001, 0)
	Frame_3.ZIndex = 4

	UICorner_3.CornerRadius = UDim.new(0, 4)
	UICorner_3.Parent = Frame_3

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = Frame
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.963742971, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(-0.0510042384, 47, 0.839458942, 47)
	DropShadow.ZIndex = 3
	DropShadow.Image = "rbxassetid://6014261993"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.860
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	HeadName.Name = "HeadName"
	HeadName.Parent = Frame
	HeadName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HeadName.BackgroundTransparency = 1.000
	HeadName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HeadName.BorderSizePixel = 0
	HeadName.Position = UDim2.new(0.0100000342, 0, 0.010000146, 0)
	HeadName.Size = UDim2.new(0.205458686, 0, 0.133462012, 0)
	HeadName.ZIndex = 4
	HeadName.Font = Enum.Font.SourceSansBold
	HeadName.Text = NameScriptHub or "LUMINIQUE"
	HeadName.TextColor3 = Color3.fromRGB(255, 255, 255)
	HeadName.TextScaled = true
	HeadName.TextSize = 14.000
	HeadName.TextStrokeColor3 = Color3.fromRGB(0, 251, 255)
	HeadName.TextStrokeTransparency = 0.720
	HeadName.TextWrapped = true

	TabButtons.Name = "TabButtons"
	TabButtons.Parent = Frame
	TabButtons.Active = true
	TabButtons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabButtons.BackgroundTransparency = 1.000
	TabButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabButtons.BorderSizePixel = 0
	TabButtons.Position = UDim2.new(0.00760957832, 0, 0.143462211, 0)
	TabButtons.Size = UDim2.new(0.20784913, 0, 0.753122032, 0)
	TabButtons.ZIndex = 5
	TabButtons.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabButtons.ScrollBarThickness = 1


	UIListLayout.Parent = TabButtons
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 4)

	scrolling_connect(TabButtons)

	TabHose.Name = "TabHose"
	TabHose.Parent = Frame
	TabHose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabHose.BackgroundTransparency = 1.000
	TabHose.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabHose.BorderSizePixel = 0
	TabHose.Position = UDim2.new(0.223214373, 0, 0.143462211, 0)
	TabHose.Size = UDim2.new(0.774635077, 0, 0.856537759, 0)
	TabHose.ZIndex = 5

	outlo.Name = "outlo"
	outlo.Parent = Frame
	outlo.AnchorPoint = Vector2.new(1, 0)
	outlo.BackgroundColor3 = LUMINIQUE.Themes.TraceColor
	outlo.BackgroundTransparency = 0.700
	outlo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	outlo.BorderSizePixel = 0
	outlo.Position = UDim2.new(1, 0, 0.136999995, 0)
	outlo.Size = UDim2.new(0.774999976, 0, 0, 1)
	outlo.ZIndex = 4

	UICorner_4.CornerRadius = UDim.new(0, 4)
	UICorner_4.Parent = outlo

	outlo_2.Name = "outlo"
	outlo_2.Parent = Frame
	outlo_2.AnchorPoint = Vector2.new(1, 0.5)
	outlo_2.BackgroundColor3 = LUMINIQUE.Themes.TraceColor
	outlo_2.BackgroundTransparency = 0.700
	outlo_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	outlo_2.BorderSizePixel = 0
	outlo_2.Position = UDim2.new(0.223908007, 0, 0.5, 0)
	outlo_2.Size = UDim2.new(0, 1, 1, 0)
	outlo_2.ZIndex = 4

	UICorner_5.CornerRadius = UDim.new(0, 4)
	UICorner_5.Parent = outlo_2

	outlo_3.Name = "outlo"
	outlo_3.Parent = Frame
	outlo_3.AnchorPoint = Vector2.new(1, 0)
	outlo_3.BackgroundColor3 = LUMINIQUE.Themes.TraceColor
	outlo_3.BackgroundTransparency = 0.700
	outlo_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	outlo_3.BorderSizePixel = 0
	outlo_3.Position = UDim2.new(0.223908007, 0, 0.923109949, 0)
	outlo_3.Size = UDim2.new(0.223908007, 0, 0, 1)
	outlo_3.ZIndex = 4

	UICorner_6.CornerRadius = UDim.new(0, 4)
	UICorner_6.Parent = outlo_3

	UserData.Name = "UserData"
	UserData.Parent = Frame
	UserData.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserData.BackgroundTransparency = 1.000
	UserData.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserData.BorderSizePixel = 0
	UserData.Position = UDim2.new(-0.000179085735, 0, 0.926525652, 0)
	UserData.Size = UDim2.new(0.225179195, 0, 0.0718210712, 0)
	UserData.ZIndex = 5

	UICorner_7.CornerRadius = UDim.new(0, 2)
	UICorner_7.Parent = UserData

	UserImage.Name = "UserImage"
	UserImage.Parent = UserData
	UserImage.AnchorPoint = Vector2.new(0.5, 0.5)
	UserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserImage.BackgroundTransparency = 1.000
	UserImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserImage.BorderSizePixel = 0
	UserImage.Position = UDim2.new(0.150000006, 0, 0.5, 0)
	UserImage.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
	UserImage.SizeConstraint = Enum.SizeConstraint.RelativeYY
	UserImage.ZIndex = 5
	UserImage.Image = game:GetService('Players'):GetUserThumbnailAsync(LocalPlayer.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size150x150)

	UICorner_8.CornerRadius

 = UDim.new(0, 4)
	UICorner_8.Parent = UserImage

	UserName.Name = "UserName"
	UserName.Parent = UserData
	UserName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserName.BackgroundTransparency = 1.000
	UserName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserName.BorderSizePixel = 0
	UserName.Position = UDim2.new(0.259000003, 0, 0, 0)
	UserName.Size = UDim2.new(0.730000019, 0, 1, 0)
	UserName.ZIndex = 5
	UserName.Font = Enum.Font.SourceSans
	UserName.Text = LocalPlayer.Name or "USER"
	UserName.TextColor3 = LUMINIQUE.Themes.TextColor
	UserName.TextScaled = true
	UserName.TextSize = 14.000
	UserName.TextStrokeTransparency = 1
	UserName.TextWrapped = true
	UserName.TextXAlignment = Enum.TextXAlignment.Left

	function WindowFunctions:AddTab(Name)
		local TabFunctions = {}
		local TabFrames = {}
		local Title

		Name = Name or "Tab"

		local MainTab = Instance.new("Frame")
		local ScrollFrame = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local TextButton = Instance.new("TextButton")
		local TextLabel = Instance.new("TextLabel")

		MainTab.Name = Name
		MainTab.Parent = TabHose
		MainTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MainTab.BackgroundTransparency = 1.000
		MainTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		MainTab.BorderSizePixel = 0
		MainTab.Size = UDim2.new(1, 0, 1, 0)
		MainTab.ZIndex = 5
		MainTab.Visible = false

		ScrollFrame.Name = "ScrollFrame"
		ScrollFrame.Parent = MainTab
		ScrollFrame.Active = true
		ScrollFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollFrame.BackgroundTransparency = 1.000
		ScrollFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ScrollFrame.BorderSizePixel = 0
		ScrollFrame.Size = UDim2.new(1, 0, 1, 0)
		ScrollFrame.ZIndex = 5
		ScrollFrame.BottomImage = "rbxassetid://5231289525"
		ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollFrame.ScrollBarThickness = 2
		ScrollFrame.TopImage = "rbxassetid://5231289525"

		scrolling_connect(ScrollFrame)

		UIListLayout.Parent = ScrollFrame
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 4)

		local UIBUTTONzIndex=0
		local function UIFrameZindexUI(i)
			if i.Name=="UIFrame" then
				UIBUTTONzIndex=UIBUTTONzIndex+1
				if UIBUTTONzIndex>=20 then
					UIBUTTONzIndex=1
				end

				i.ZIndex=UIBUTTONzIndex
			end

			if #i:GetChildren() > 0 then
				for _, a in pairs(i:GetChildren()) do
					UIFrameZindexUI(a)
				end
			end
		end

		TabButtons.ChildAdded:Connect(function(child)
			UIFrameZindexUI(child)
		end)

		TextButton.Parent = TabButtons
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.BackgroundTransparency = 1.000
		TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.BorderSizePixel = 0
		TextButton.Position = UDim2.new(0.048275861, 0, 0.0236475087, 0)
		TextButton.Size = UDim2.new(1, 0, 0, 22)
		TextButton.ZIndex = 5
		TextButton.Font = Enum.Font.SourceSans
		TextButton.Text = ""
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextSize = 14.000
		TextButton.TextXAlignment = Enum.TextXAlignment.Center
		create_button(TextButton)

		TextLabel.Parent = TextButton
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0, 0, 0, 0)
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.ZIndex = 5
		TextLabel.Font = Enum.Font.Gotham
		TextLabel.Text = Name or "Tab"
		TextLabel.TextColor3 = LUMINIQUE.Themes.TextColor
		TextLabel.TextSize = 14.000
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		TextButton.MouseButton1Click:Connect(function()
			for _, tab in pairs(TabHose:GetChildren()) do
				tab.Visible = false
			end

			MainTab.Visible = true

			for _, tab in pairs(TabButtons:GetChildren()) do
				if tab:IsA("TextButton") then
					TweenService:Create(tab.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {TextColor3 = LUMINIQUE.Themes.TextColor}):Play()
				end
			end

			TweenService:Create(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {TextColor3 = LUMINIQUE.Themes.AccentColor}):Play()
		end)

		local function UpdateCanvasSize()
			ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
		end

		ScrollFrame.ChildAdded:Connect(UpdateCanvasSize)
		ScrollFrame.ChildRemoved:Connect(UpdateCanvasSize)

		function TabFunctions:UpdateCanvasSize()
			UpdateCanvasSize()
		end

		function TabFunctions:AddTitle(Text)
			Title = Instance.new("TextLabel")
			local Padding = Instance.new("UIPadding")
			local TextSizeConstraint = Instance.new("UITextSizeConstraint")

			Title.Parent = ScrollFrame
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Size = UDim2.new(1, 0, 0, 30)
			Title.ZIndex = 5
			Title.Font = Enum.Font.Gotham
			Title.Text = Text or ""
			Title.TextColor3 = LUMINIQUE.Themes.TextColor
			Title.TextSize = 14.000
			Title.TextStrokeTransparency = 0.900
			Title.TextWrapped = true
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.TextYAlignment = Enum.TextYAlignment.Bottom
			Title.RichText = true

			Padding.Parent = Title
			Padding.PaddingBottom = UDim.new(0, 5)
			Padding.PaddingLeft = UDim.new(0, 5)
			Padding.PaddingRight = UDim.new(0, 5)
			Padding.PaddingTop = UDim.new(0, 5)

			TextSizeConstraint.Parent = Title
			TextSizeConstraint.MaxTextSize = 20

			table.insert(TabFrames, Title)
		end

		function TabFunctions:AddSeperator()
			local LineFrame = Instance.new("Frame")
			local Line = Instance.new("Frame")

			LineFrame.Parent = ScrollFrame
			LineFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LineFrame.BackgroundTransparency = 1.000
			LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			LineFrame.BorderSizePixel = 0
			LineFrame.Position = UDim2.new(0.048275861, 0, 0.1627907, 0)
			LineFrame.Size = UDim2.new(1, 0, 0, 8)
			LineFrame.ZIndex = 5

			Line.Parent = LineFrame
			Line.AnchorPoint = Vector2.new(0.5, 0.5)
			Line.BackgroundColor3 = LUMINIQUE.Themes.TraceColor
			Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Line.BorderSizePixel = 0
			Line.Position = UDim2.new(0.5, 0, 0.5, 0)
			Line.Size = UDim2.new(1, -15

, 0, 1)
			Line.ZIndex = 5

			table.insert(TabFrames, LineFrame)
		end

		function TabFunctions:AddButton(Text, Func)
			local TextButton = Instance.new("TextButton")
			local Padding = Instance.new("UIPadding")
			local TextSizeConstraint = Instance.new("UITextSizeConstraint")
			local UICorner = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")

			TextButton.Parent = ScrollFrame
			TextButton.BackgroundColor3 = LUMINIQUE.Themes.HeaderColor
			TextButton.BackgroundTransparency = 0.200
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Position = UDim2.new(0.012820513, 0, 0.316666663, 0)
			TextButton.Size = UDim2.new(1, -5, 0, 30)
			TextButton.ZIndex = 5
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.Gotham
			TextButton.Text = Text or ""
			TextButton.TextColor3 = LUMINIQUE.Themes.TextColor
			TextButton.TextSize = 14.000
			TextButton.TextStrokeTransparency = 0.900
			TextButton.TextWrapped = true

			create_button(TextButton)
			TextButton.MouseButton1Click:Connect(function()
				if Func then
					task.spawn(function()
						pcall(Func)
					end)
				end
			end)

			Padding.Parent = TextButton
			Padding.PaddingBottom = UDim.new(0, 5)
			Padding.PaddingLeft = UDim.new(0, 5)
			Padding.PaddingRight = UDim.new(0, 5)
			Padding.PaddingTop = UDim.new(0, 5)

			TextSizeConstraint.Parent = TextButton
			TextSizeConstraint.MaxTextSize = 16

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = TextButton

			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Parent = TextButton
			UIStroke.Color = Color3.fromRGB(255, 255, 255)
			UIStroke.Thickness = 0

			table.insert(TabFrames, TextButton)
		end

		function TabFunctions:AddDropdown(Name, List, Callback)
			local DropFunctions = {}
			local DropFrames = {}
			local optioncount = 0
			local droptoggle = false
			local Frame = Instance.new("Frame")
			local TextButton = Instance.new("TextButton")
			local Padding = Instance.new("UIPadding")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local TextSizeConstraint = Instance.new("UITextSizeConstraint")
			local Dropdown = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")

			Frame.Parent = ScrollFrame
			Frame.BackgroundColor3 = LUMINIQUE.Themes.HeaderColor
			Frame.BackgroundTransparency = 0.200
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.0340000018, 0, 0.213000193, 0)
			Frame.Size = UDim2.new(1, -5, 0, 34)
			Frame.ZIndex = 5
			Frame.ClipsDescendants = true

			TextButton.Parent = Frame
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(1, 0, 1, 0)
			TextButton.ZIndex = 5
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.Gotham
			TextButton.Text = ""
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000
			TextButton.TextStrokeTransparency = 0.900
			TextButton.TextWrapped = true
			create_button(TextButton)

			TextLabel.Parent = TextButton
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0, 0, 0, 0)
			TextLabel.Size = UDim2.new(1, 0, 1, 0)
			TextLabel.ZIndex = 5
			TextLabel.Font = Enum.Font.Gotham
			TextLabel.Text = Name
			TextLabel.TextColor3 = LUMINIQUE.Themes.TextColor
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			Padding.Parent = Frame
			Padding.PaddingBottom = UDim.new(0, 5)
			Padding.PaddingLeft = UDim.new(0, 5)
			Padding.PaddingRight = UDim.new(0, 5)
			Padding.PaddingTop = UDim.new(0, 5)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Frame

			TextSizeConstraint.Parent = Frame
			TextSizeConstraint.MaxTextSize = 16

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = Frame
			Dropdown.Active = true
			Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Dropdown.BackgroundTransparency = 1.000
			Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Dropdown.BorderSizePixel = 0
			Dropdown.Size = UDim2.new(1, 0, 1, -34)
			Dropdown.Position = UDim2.new(0, 0, 0, 34)
			Dropdown.ZIndex = 6
			Dropdown.BottomImage = "rbxassetid://5231289525"
			Dropdown.CanvasSize = UDim2.new(0, 0, 0, 0)
			Dropdown.ScrollBarThickness = 2
			Dropdown.TopImage = "rbxassetid://5231289525"
			scrolling_connect(Dropdown)

			UIListLayout.Parent = Dropdown
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 4)

			local function UpdateCanvasSize()
				Dropdown.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
			end

			Dropdown.ChildAdded:Connect(UpdateCanvasSize)
			Dropdown.ChildRemoved:Connect(UpdateCanvasSize)

			UpdateCanvasSize()

			TextButton.MouseButton1Click:Connect(function()
				droptoggle = not droptoggle
				if droptoggle then
					TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, -5, 0, 34 + UIListLayout.AbsoluteContentSize.Y + 5)}):Play()
				else
					TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, -5, 0, 34)}):Play()
				end
			end)

			for _, option in ipairs(List) do
				optioncount = optioncount + 1

				local TextButton = Instance.new("TextButton")
				local Padding = Instance.new("UIPadding")
				local TextSizeConstraint = Instance.new("UITextSizeConstraint")
				local UICorner = Instance.new("UICorner")

				TextButton.Parent = Dropdown
				TextButton.BackgroundColor3 = LUMINIQUE.Themes.HeaderColor
				TextButton.BackgroundTransparency = 0.200
				TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.BorderSizePixel = 0
				TextButton.Position = UDim2.new(0.012820513, 0, 0.316666663, 0)
				TextButton.Size = UDim2.new(1, -5, 0, 30)
				TextButton.ZIndex = 6
				TextButton.AutoButtonColor = false
				TextButton.Font = Enum.Font.Gotham
				TextButton.Text = option
				TextButton.TextColor3 = LUMINIQUE.Themes.TextColor
				TextButton.TextSize = 14.000
				TextButton.TextStrokeTransparency = 0.900
				TextButton.TextWrapped = true

				create_button(TextButton)

				Padding.Parent = TextButton
				Padding.PaddingBottom = UDim.new(0, 5)
				Padding.PaddingLeft = UDim.new(0, 5)
				Padding.PaddingRight = UDim.new(0, 5)
				Padding.PaddingTop = UDim.new(

0, 5)

				TextSizeConstraint.Parent = TextButton
				TextSizeConstraint.MaxTextSize = 16

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = TextButton

				table.insert(TabFrames, TextButton)

				TextButton.MouseButton1Click:Connect(function()
					Callback(option)
					TextLabel.Text = Name..": "..option
					droptoggle = false
					TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, -5, 0, 34)}):Play()
				end)
			end

			table.insert(TabFrames, Frame)

			function DropFunctions:UpdateList(List)
				for _, v in pairs(Dropdown:GetChildren()) do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end

				for _, option in ipairs(List) do
					optioncount = optioncount + 1

					local TextButton = Instance.new("TextButton")
					local Padding = Instance.new("UIPadding")
					local TextSizeConstraint = Instance.new("UITextSizeConstraint")
					local UICorner = Instance.new("UICorner")

					TextButton.Parent = Dropdown
					TextButton.BackgroundColor3 = LUMINIQUE.Themes.HeaderColor
					TextButton.BackgroundTransparency = 0.200
					TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextButton.BorderSizePixel = 0
					TextButton.Position = UDim2.new(0.012820513, 0, 0.316666663, 0)
					TextButton.Size = UDim2.new(1, -5, 0, 30)
					TextButton.ZIndex = 6
					TextButton.AutoButtonColor = false
					TextButton.Font = Enum.Font.Gotham
					TextButton.Text = option
					TextButton.TextColor3 = LUMINIQUE.Themes.TextColor
					TextButton.TextSize = 14.000
					TextButton.TextStrokeTransparency = 0.900
					TextButton.TextWrapped = true

					create_button(TextButton)

					Padding.Parent = TextButton
					Padding.PaddingBottom = UDim.new(0, 5)
					Padding.PaddingLeft = UDim.new(0, 5)
					Padding.PaddingRight = UDim.new(0, 5)
					Padding.PaddingTop = UDim.new(0, 5)

					TextSizeConstraint.Parent = TextButton
					TextSizeConstraint.MaxTextSize = 16

					UICorner.CornerRadius = UDim.new(0, 4)
					UICorner.Parent = TextButton

					table.insert(TabFrames, TextButton)

					TextButton.MouseButton1Click:Connect(function()
						Callback(option)
						TextLabel.Text = Name..": "..option
						droptoggle = false
						TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, -5, 0, 34)}):Play()
					end)
				end
			end

			return DropFunctions
		end


		function TabFunctions:AddColorPicker(Name, DefaultColor, Callback)
			local DefaultColor = DefaultColor or Color3.fromRGB(255, 255, 255)

			local PickerFunctions = {}
			local PickerFrames = {}

			local Frame = Instance.new("Frame")
			local TextButton = Instance.new("TextButton")
			local Padding = Instance.new("UIPadding")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local TextSizeConstraint = Instance.new("UITextSizeConstraint")
			local DropFrame = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")
			local Pallete = Instance.new("ImageButton")
			local SatV = Instance.new("ImageButton")
			local ColorBoxOutline = Instance.new("Frame")
			local Hue = Instance.new("ImageButton")
			local ColorPoint = Instance.new("Frame")
			local ColorBoxOutline_2 = Instance.new("Frame")
			local DisplayFrame = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")

			Frame.Parent = ScrollFrame
			Frame.BackgroundColor3 = LUMINIQUE.Themes.HeaderColor
			Frame.BackgroundTransparency = 0.200
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.0340000018, 0, 0.213000193, 0)
			Frame.Size = UDim2.new(1, -5, 0, 34)
			Frame.ZIndex = 5
			Frame.ClipsDescendants = true

			TextButton.Parent = Frame
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(1, 0, 1, 0)
			TextButton.ZIndex = 5
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.Gotham
			TextButton.Text = ""
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000
			TextButton.TextStrokeTransparency = 0.900
			TextButton.TextWrapped = true
			create_button(TextButton)

			TextLabel.Parent = TextButton
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0, 0, 0, 0)
			TextLabel.Size = UDim2.new(1, 0, 1, 0)
			TextLabel.ZIndex = 5
			TextLabel.Font = Enum.Font.Gotham
			TextLabel.Text = Name
			TextLabel.TextColor3 = LUMINIQUE.Themes.TextColor
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			Padding.Parent = Frame
			Padding.PaddingBottom = UDim.new(0, 5)
			Padding.PaddingLeft = UDim.new(0, 5)
			Padding.PaddingRight = UDim.new(0, 5)
			Padding.PaddingTop = UDim.new(0, 5)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Frame

			TextSizeConstraint.Parent = Frame
			TextSizeConstraint.MaxTextSize = 16

			UIListLayout.Parent = DropFrame
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 4)

			ColorBoxOutline.Name = "ColorBoxOutline"
			ColorBoxOutline.Parent = Frame
			ColorBoxOutline.AnchorPoint = Vector2.new(0.5, 0.5)
			ColorBoxOutline.BackgroundTransparency = 1.000
			ColorBoxOutline.BorderSizePixel = 0
			ColorBoxOutline.Position = UDim2.new(0.5, 0, 0.5, 0)
			ColorBoxOutline.Size = UDim2.new(1, -5, 0, 1)
			ColorBoxOutline.ZIndex = 5

			UIListLayout.Parent = ColorBoxOutline
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 4)

			Pallete.Name = "Pallete"
			Pallete.Parent = ColorBoxOutline
			Pallete.BackgroundTransparency = 1.000
			Pallete.BorderSizePixel = 0
			Pallete.Position = UDim2.new(0.5, 0, 0.5, 0)
			Pallete.Size = UDim2.new(1, 0, 0, 1)
			Pallete.ZIndex = 5
			Pallete.Image = "rbxassetid://6980520011"
			Pallete.ImageColor3 = Color3.fromRGB(1, 1, 1)
			Pallete.ImageTransparency = 0.500
			Pallete.ScaleType = Enum.ScaleType.Fit

			SatV.Name = "SatV"
			SatV.Parent = Pallete
			SatV.AnchorPoint = Vector2.new(0.5, 0.5)
			SatV.BackgroundTransparency = 1.000
			SatV.BorderSizePixel = 0
			SatV.Position = UDim2.new(0.5, 0, 0.5, 0)
			SatV.Size = UDim2.new(1, 0, 0.849999964, 0)
			SatV.Z

Index = 5
			SatV.Image = "rbxassetid://4155801252"
			SatV.ImageTransparency = 0.500

			ColorBoxOutline_2.Name = "ColorBoxOutline_2"
			ColorBoxOutline_2.Parent = SatV
			ColorBoxOutline_2.AnchorPoint = Vector2.new(0.5, 0.5)
			ColorBoxOutline_2.BackgroundTransparency = 1.000
			ColorBoxOutline_2.BorderSizePixel = 0
			ColorBoxOutline_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			ColorBoxOutline_2.Size = UDim2.new(1, 0, 1, 0)
			ColorBoxOutline_2.ZIndex = 5

			ColorPoint.Name = "ColorPoint"
			ColorPoint.Parent = ColorBoxOutline_2
			ColorPoint.AnchorPoint = Vector2.new(0.5, 0.5)
			ColorPoint.BackgroundColor3 = DefaultColor
			ColorPoint.BackgroundTransparency = 0.000
			ColorPoint.BorderSizePixel = 0
			ColorPoint.Position = UDim2.new(0.5, 0, 0.5, 0)
			ColorPoint.Size = UDim2.new(0, 10, 0, 10)
			ColorPoint.ZIndex = 5

			Hue.Name = "Hue"
			Hue.Parent = SatV
			Hue.AnchorPoint = Vector2.new(0.5, 0.5)
			Hue.BackgroundTransparency = 1.000
			Hue.BorderSizePixel = 0
			Hue.Position = UDim2.new(0.5, 0, 0.5, 0)
			Hue.Size = UDim2.new(1, 0, 0.849999964, 0)
			Hue.ZIndex = 5
			Hue.Image = "rbxassetid://4155801252"
			Hue.ImageTransparency = 0.500

			ColorBoxOutline_2.Name = "ColorBoxOutline_2"
			ColorBoxOutline_2.Parent = Hue
			ColorBoxOutline_2.AnchorPoint = Vector2.new(0.5, 0.5)
			ColorBoxOutline_2.BackgroundTransparency = 1.000
			ColorBoxOutline_2.BorderSizePixel = 0
			ColorBoxOutline_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			ColorBoxOutline_2.Size = UDim2.new(1, 0, 1, 0)
			ColorBoxOutline_2.ZIndex = 5

			DisplayFrame.Name = "DisplayFrame"
			DisplayFrame.Parent = DropFrame
			DisplayFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DisplayFrame.BackgroundTransparency = 1.000
			DisplayFrame.BorderSizePixel = 0
			DisplayFrame.Size = UDim2.new(1, 0, 0, 24)
			DisplayFrame.ZIndex = 5
			DisplayFrame.ClipsDescendants = true

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = DisplayFrame

			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Parent = Frame
			UIStroke.Color = Color3.fromRGB(255, 255, 255)
			UIStroke.Thickness = 0

			local function UpdateCanvasSize()
				DropFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
			end

			DropFrame.ChildAdded:Connect(UpdateCanvasSize)
			DropFrame.ChildRemoved:Connect(UpdateCanvasSize)

			UpdateCanvasSize()

			TextButton.MouseButton1Click:Connect(function()
				droptoggle = not droptoggle
				if droptoggle then
					TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, -5, 0, 34 + UIListLayout.AbsoluteContentSize.Y + 5)}):Play()
				else
					TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, -5, 0, 34)}):Play()
				end
			end)

			Pallete.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					while task.wait() do
						if not input.UserInputState == Enum.UserInputState.End then
							break
						end
						--Hue
					end
				end
			end)

			Hue.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					while task.wait() do
						if not input.UserInputState == Enum.UserInputState.End then
							break
						end
						--Pallete
					end
				end
			end)

			DropFrame.Parent = Frame
			DropFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropFrame.BackgroundTransparency = 1.000
			DropFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropFrame.BorderSizePixel = 0
			DropFrame.Size = UDim2.new(1, 0, 1, 0)
			DropFrame.Position = UDim2.new(0, 0, 0, 34)
			DropFrame.ZIndex = 6
			DropFrame.BottomImage = "rbxassetid://5231289525"
			DropFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			DropFrame.ScrollBarThickness = 2
			DropFrame.TopImage = "rbxassetid://5231289525"
			scrolling_connect(DropFrame)

			local function UpdateCanvasSize()
				DropFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
			end

			DropFrame.ChildAdded:Connect(UpdateCanvasSize)
			DropFrame.ChildRemoved:Connect(UpdateCanvasSize)

			UpdateCanvasSize()

			return PickerFunctions
		end


		function TabFunctions:AddSlider(Name, Min, Max, Default, Callback)
			local SliderFunctions = {}
			local SliderFrames = {}

			Min = Min or 0
			Max = Max or 100
			Default = Default or 0

			local Frame = Instance.new("Frame")
			local TextButton = Instance.new("TextButton")
			local Padding = Instance.new("UIPadding")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local TextSizeConstraint = Instance.new("UITextSizeConstraint")
			local Slider = Instance.new("Frame")
			local SliderValue = Instance.new("TextLabel")
			local SliderButton = Instance.new("TextButton")
			local UIListLayout = Instance.new("UIListLayout")

			Frame.Parent = ScrollFrame
			Frame.BackgroundColor3 = LUMINIQUE.Themes.HeaderColor
			Frame.BackgroundTransparency = 0.200
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.0340000018, 0, 0.213000193, 0)
			Frame.Size = UDim2.new(1, -5, 0, 50)
			Frame.ZIndex = 5
			Frame.ClipsDescendants = true

			TextButton.Parent = Frame
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(1, 0, 1, 0)
			TextButton.ZIndex = 5
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.Gotham
			TextButton.Text = ""
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000
			TextButton.TextStrokeTransparency = 0.900
			TextButton.TextWrapped = true
			create_button(TextButton)

			TextLabel.Parent = TextButton
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0, 0, 0, 0)
			TextLabel.Size = UDim2.new(1, 0, 1, 0)
			TextLabel.ZIndex = 5
			TextLabel.Font = Enum.Font.Gotham
			TextLabel.Text = Name
			TextLabel.TextColor3 = LUMINIQUE.Themes.TextColor
			TextLabel.Text

Size = 14.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			Padding.Parent = Frame
			Padding.PaddingBottom = UDim.new(0, 5)
			Padding.PaddingLeft = UDim.new(0, 5)
			Padding.PaddingRight = UDim.new(0, 5)
			Padding.PaddingTop = UDim.new(0, 5)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Frame

			TextSizeConstraint.Parent = Frame
			TextSizeConstraint.MaxTextSize = 16

			Slider.Name = "Slider"
			Slider.Parent = Frame
			Slider.BackgroundColor3 = LUMINIQUE.Themes.HeaderColor
			Slider.BackgroundTransparency = 0.200
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Position = UDim2.new(0.0340000018, 0, 0.213000193, 0)
			Slider.Size = UDim2.new(1, -5, 0, 34)
			Slider.ZIndex = 6
			Slider.ClipsDescendants = true

			SliderButton.Name = "SliderButton"
			SliderButton.Parent = Slider
			SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderButton.BackgroundTransparency = 1.000
			SliderButton.BorderSizePixel = 0
			SliderButton.Size = UDim2.new(1, 0, 1, 0)
			SliderButton.ZIndex = 6
			SliderButton.AutoButtonColor = false
			SliderButton.Font = Enum.Font.Gotham
			SliderButton.Text = ""
			SliderButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderButton.TextSize = 14.000
			SliderButton.TextStrokeTransparency = 0.900
			SliderButton.TextWrapped = true
			create_button(SliderButton)

			SliderValue.Parent = Slider
			SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.BackgroundTransparency = 1.000
			SliderValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderValue.BorderSizePixel = 0
			SliderValue.Position = UDim2.new(0, 0, 0, 0)
			SliderValue.Size = UDim2.new(1, 0, 1, 0)
			SliderValue.ZIndex = 6
			SliderValue.Font = Enum.Font.Gotham
			SliderValue.Text = ""
			SliderValue.TextColor3 = LUMINIQUE.Themes.TextColor
			SliderValue.TextSize = 14.000
			SliderValue.TextWrapped = true
			SliderValue.TextXAlignment = Enum.TextXAlignment.Left

			Padding.Parent = Frame
			Padding.PaddingBottom = UDim.new(0, 5)
			Padding.PaddingLeft = UDim.new(0, 5)
			Padding.PaddingRight = UDim.new(0, 5)
			Padding.PaddingTop = UDim.new(0, 5)

			UIListLayout.Parent = Slider
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 4)

			local function UpdateCanvasSize()
				Slider.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
			end

			Slider.ChildAdded:Connect(UpdateCanvasSize)
			Slider.ChildRemoved:Connect(UpdateCanvasSize)

			UpdateCanvasSize()

			TextButton.MouseButton1Click:Connect(function()
				droptoggle = not droptoggle
				if droptoggle then
					TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, -5, 0, 34 + UIListLayout.AbsoluteContentSize.Y + 5)}):Play()
				else
					TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, -5, 0, 34)}):Play()
				end
			end)

			return SliderFunctions
		end


		return TabFunctions
	end

	function LuminiqueFunctions:SelectTab(Tab)
		for _, v in pairs(LuminiqueFrames.Tabs:GetChildren()) do
			if v:IsA("Frame") then
				v.Visible = false
			end
		end

		if typeof(Tab) == "string" then
			local found = false
			for _, v in pairs(LuminiqueFrames.Tabs:GetChildren()) do
				if v:IsA("Frame") and v.Name == Tab then
					found = true
					v.Visible = true
					break
				end
			end

			if not found then
				error("Tab not found: "..Tab)
			end
		elseif typeof(Tab) == "Instance" then
			Tab.Visible = true
		end
	end


	return LuminiqueFunctions
end


return LUMINIQUE
