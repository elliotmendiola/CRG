local CRG = LibStub("AceAddon-3.0"):NewAddon("CRG");
local Console = LibStub("AceConsole-3.0"); -- Manages console commands in game
local Events = LibStub("AceEvent-3.0"); -- Manages blizzard and ace events
local DB =  LibStub("AceDB-3.0"); -- Manages profiles, local storage, etc
local GUI = LibStub("AceGUI-3.0"); -- Manages creating UI Elements
LibStub("AceConfig-3.0"):RegisterOptionsTable("CRG", CRG:GenerateOptions, "/crg options"); -- Options frame hook, http://www.wowace.com/addons/ace3/pages/ace-config-3-0-options-tables/
LibStub("AceHook-3.0"):Embed(CRG) -- Manages hooking into other functions

local defaults = {}

function CRG:OnInitialize ()
    Console:RegisterChatCommand("crg", self:Command)
    self.db = DB:New("CRGDB"); -- Creates a new db for this profile.
    self.options = DB:New("CRGOptionsDB");
    self:CreateGUI();
end

function CRG:Command (...)
    for i,v in ipairs(arg) do
        printResult = printResult .. tostring(v) .. "\t"
    end
    printResult = printResult .. "\n"
end

function CRG:OnEnable ()
    
end

function CRG:OnDisable ()
    
end

function CRG:GenerateOptions ()
    local options = {
        
    };
    
    return options;
end

function CRG:CreateGUI ()
    -- Create a container frame
    local f = GUI:Create("Frame")
    f:SetCallback("OnClose",function(widget) GUI:Release(widget) end)
    f:SetTitle("AceGUI-3.0 Example")
    f:SetStatusText("Status Bar")
    f:SetLayout("Flow")
    -- Create a button
    local btn = GUI:Create("Button")
    btn:SetWidth(170)
    btn:SetText("Button !")
    btn:SetCallback("OnClick", function() print("Click!") end)
    -- Add the button to the container
    f:AddChild(btn)
end

function CRG:OnGUIClose (widget)
    GUI:Release(widget);
end