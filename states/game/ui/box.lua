require("modules/key")

GameBox = {}
Button = {}

function GameBox:load()
    Button.font = love.graphics.newFont(15)
    Button.width = Box.width / 3
    Button.height = 50
    Button.y = 395
end

function GameBox:draw()
    love.graphics.printf("Money: " .. Stats.money .. "$", love.graphics.newFont(20), Box.x - 15, Box.y - 70, Box.width, "right")
    love.graphics.printf("Bills: " .. Stats.waitingBills .. "$", love.graphics.newFont(20), Box.x - 15, Box.y - 45, Box.width, "right")
    love.graphics.setColor(0, 0, 0, 0.3)
    love.graphics.rectangle("fill", Box.x, Box.y, Box.width, Box.height)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("Your Investments", love.graphics.newFont(25), 0, 280, 1280, "center")
    love.graphics.printf("Income: " .. Stats.income .. "$/day" .. " | " .. "Bills: " .. Stats.bills .. "$/month", love.graphics.newFont(18), 0, 320, 1280, "center")
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.printf("Houses: " .. Stats.investments[1].amount .. " | " .. "Lcoins: " .. Stats.investments[2].amount .. " | " .. "Hotels: " .. Stats.investments[3].amount, love.graphics.newFont(18), 0, 350, 1280, "center")
    for i, button in ipairs(Box.buttons) do
        Key:down(tostring(i), button.fn)
        love.graphics.setColor(0.3, 0.5, 0.2, 0.3)
        love.graphics.rectangle("fill", button.x, Button.y, Button.width, Button.height)
        love.graphics.setColor(1, 1, 1, 1)                                                                          
        love.graphics.print(button.text, Button.font, button.x + Button.width / 2 - Button.font:getWidth(button.text) / 2, Button.y + Button.height / 2 - Button.font:getHeight() / 2)
        if Box.buttons[1].secondText then
            local text = "Price: " .. Game.nextInvestment.price .. "$"
            love.graphics.print(text, love.graphics.newFont(13), Box.buttons[1].x + Button.width / 2 - Button.font:getWidth(text) / 2, Button.y + Button.height / 2 - Button.font:getHeight() / 2 + 45)
        end
    end
end


    