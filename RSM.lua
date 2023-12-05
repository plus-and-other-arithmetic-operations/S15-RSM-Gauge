-- Font used in the LCD text
local lcdFont = "e39"
-- Font size used in most LCD text
local fontSize = vec2(80, 120)
-- Font size used in alternate LCD text
local altFontSize = vec2(60, 80)
-- Path to video
local player = ui.MediaPlayer("RSMIntro.mp4")

function DrawText(x, y, input)
    display.text({
        pos = vec2(x, y),
        letter = fontSize,
        text = input,
        spacing = -5,
        alignment = 0,
        width = 310,
        font = lcdFont,
        color = rgbm.colors.white
    })
end

function DrawAltText(x, y, input)
    display.text({
        pos = vec2(x, y+25),
        letter = altFontSize,
        text = input,
        spacing = -5,
        alignment = 0,
        width = 310,
        font = lcdFont,
        color = rgbm.colors.white
    })
end

function DrawMeasure(x, y, input)
    display.text({
        pos = vec2(x, y),
        letter = fontSize,
        text = input,
        spacing = -5,
        alignment = 1,
        width = 310,
        font = lcdFont,
        color = rgbm.colors.white
    })
end

local playIntro = true
player:play()
function PlayIntroSequence()
    display.rect { pos = vec2(0,0), size = vec2(1024,512), color = rgbm.colors.black } -- hack to fill background with a black color
    display.image { image = player, pos = vec2(0,50), size = vec2(1024,400), uvStart = vec2(0,0), uvEnd = vec2(1, 1) }
    if player:ended() then
        playIntro = false
    end
end

function script.update(dt)
    local baseHeight = 70
    if playIntro then
        PlayIntroSequence()
    else
        DrawText(50, baseHeight, "Rev")
        DrawText(50, baseHeight + 125, "Spd")
        DrawText(50, baseHeight + (125 * 2), "Bat")
        DrawText(850, baseHeight + (125 * 2), "V")

        DrawAltText(800, 50, "rpm")
        DrawAltText(800, 175, "km/h")

        DrawMeasure(480, baseHeight, math.round(car.rpm))
        DrawMeasure(480, baseHeight + 125, math.round(car.speedKmh))
        DrawMeasure(480, baseHeight + (125 * 2), math.round(car.batteryVoltage*10)/10)
    end
end