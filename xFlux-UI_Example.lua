-- Script de ejemplo para xFlux-UI
-- Copia este código en un LocalScript en StarterPlayer > StarterCharacterScripts o StarterPlayer > StarterPlayerScripts

local success, xFluxUI = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Txzp/xFlux-UI/refs/heads/main/dist/main.lua"))()
end)

if not success or not xFluxUI then
    error("No se pudo cargar xFlux-UI: " .. tostring(xFluxUI))
    return
end

-- Crear la ventana principal
local Window = xFluxUI:CreateWindow({
    Title = "xFlux-UI Demo",
    Theme = "Dark", -- Temas: Dark, Light, Rose, Plant, Red, Indigo, Sky, Violet, Amber
    Size = UDim2.fromOffset(600, 400),
})

-- Crear una pestaña "Main"
local MainTab = Window:AddTab({
    Title = "Main",
})

-- Sección de botones
MainTab:AddLabel({
    Title = "Botones",
})

-- Botón de prueba
MainTab:AddButton({
    Title = "Click me!",
    Callback = function()
        print("¡Botón pulsado!")
        xFluxUI:Notify({
            Title = "xFlux-UI",
            Content = "¡Has pulsado el botón!",
            Duration = 3
        })
    end,
})

-- Sección de controles
MainTab:AddLabel({
    Title = "Controles",
})

-- Toggle
local ToggleValue = false
MainTab:AddToggle({
    Title = "Toggle",
    Default = false,
    Callback = function(value)
        ToggleValue = value
        print("Toggle: " .. tostring(value))
        xFluxUI:Notify({
            Title = "Toggle",
            Content = "Toggle is now " .. (value and "ON" or "OFF"),
            Duration = 2
        })
    end,
})

-- Slider
local SliderValue = 50
MainTab:AddSlider({
    Title = "Slider",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(value)
        SliderValue = value
        print("Slider: " .. tostring(value))
    end,
})

-- Input
MainTab:AddInput({
    Title = "Text Input",
    Placeholder = "Escribe algo...",
    Callback = function(value)
        print("Input: " .. value)
        xFluxUI:Notify({
            Title = "Input",
            Content = "Escribiste: " .. value,
            Duration = 2
        })
    end,
})

-- Dropdown
MainTab:AddDropdown({
    Title = "Dropdown",
    Options = {"Opción 1", "Opción 2", "Opción 3"},
    Default = "Opción 1",
    Callback = function(value)
        print("Dropdown: " .. value)
    end,
})

-- Crear segunda pestaña
local SettingsTab = Window:AddTab({
    Title = "Settings",
})

SettingsTab:AddLabel({
    Title = "Tema",
})

-- Cambiar tema
SettingsTab:AddDropdown({
    Title = "Cambiar Tema",
    Options = {"Dark", "Light", "Rose", "Plant", "Red", "Indigo", "Sky", "Violet", "Amber"},
    Default = "Dark",
    Callback = function(theme)
        xFluxUI:SetTheme(theme)
        xFluxUI:Notify({
            Title = "Tema",
            Content = "Tema cambiado a " .. theme,
            Duration = 2
        })
    end,
})

SettingsTab:AddLabel({
    Title = "Otros",
})

-- Botón de cerrar todo
SettingsTab:AddButton({
    Title = "Close Window",
    Callback = function()
        Window:Close()
        xFluxUI:Notify({
            Title = "xFlux-UI",
            Content = "Ventana cerrada",
            Duration = 2
        })
    end,
})

print("✅ xFlux-UI cargado exitosamente!")
