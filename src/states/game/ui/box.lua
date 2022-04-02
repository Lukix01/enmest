GameBox = {}

function GameBox:load()
    Button:load()
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
        Button:draw(button.text, i)
    end
end
