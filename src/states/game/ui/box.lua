GameBox = {}
Button = {}
require("src/events/hover")


function GameBox:load()
    Button.font = love.graphics.newFont(20)
    Button.width = Box.width / 3
    Button.height = 70
    Button.y = 395
end

function GameBox:draw()
    love.graphics.printf(Stats.money .. "$", love.graphics.newFont(20), Box.x - 15, Box.y - 50, Box.width, "right")
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", Box.x, Box.y, Box.width, Box.height)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("Your Investments", love.graphics.newFont(25), 0, 280, 1280, "center")
    love.graphics.printf("Income: " .. Stats.income .. "$/day", love.graphics.newFont(18), 0, 320, 1280, "center")
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.printf("Houses: " .. Stats.investments.houses .. " | " .. "Lcoins: " .. Stats.investments.lcoins .. " | " .. "Hotels: " .. Stats.investments.hotels, love.graphics.newFont(18), 0, 350, 1280, "center")
    love.graphics.setColor(1, 1, 1, 1)
    for i, button in ipairs(Box.buttons) do
        button.pressed = button.down
        Button.mx, Button.my = love.mouse.getPosition()
        Button.hover = Hover(Button.mx, Button.my, button.x, Button.y, Button.width, Button.height)
        button.down = love.mouse.isDown(1)
        love.graphics.setColor(0.3, 0.5, 0.2, 1)
        if Button.hover then
            love.graphics.setColor(0.3, 0.5, 0.2, 0.7)
            if button.down and not button.pressed then
                button.fn()
            end
        end
        love.graphics.rectangle("fill", button.x, Button.y, Button.width, Button.height)
        love.graphics.setColor(1, 1, 1, 1)                                                                          
        love.graphics.print(button.text, Button.font, button.x + Button.width / 2 - Button.font:getWidth(button.text) / 2, Button.y + Button.font:getHeight())
    end
end
