require("src/utils/timer")

Game = {}
Box = {
    margin = 10,
    buttons = {
        { text = "Buy a new house", fn = nil },
        { text = "Pay bills (0$)", fn = nil },
        { text = "Go to work", fn = nil }
    }
}
Stats = {
    investments = {},
    money = 100,
    income = 20
}

function Game:load()
    Box.width = 600
    Box.height = 250
    Box.x = love.graphics.getWidth() / 2 - Box.width / 2
    Box.y = love.graphics.getHeight() / 2 - Box.height / 2
    Stats.investments.houses = 1
    Stats.investments.lcoins = 0
    Stats.investments.hotels = 0
    Stats.income = 20
end

function OptionButton(text, i)
    local font = love.graphics.newFont(20)
    local width = Box.width / 3 - Box.margin
    local height = 70
    local x = (Box.x + Box.width / 2) - Box.width / 3 - width / 2 + Box.margin
    if i == 2 then
        x = x + width + Box.margin
    elseif i == 3 then
        x = x + width * 2 + Box.margin
    end
    local y = 395
    love.graphics.setColor(0.3, 0.5, 0.2, 1)
    love.graphics.rectangle("fill", x, y, width, height)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(text, font, x + width / 2 - font:getWidth(text) / 2, y + font:getHeight())
end

function GameBox()
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
        OptionButton(button.text, i)
    end
end

function Income()
    Stats.money = Stats.money + Stats.income
end

function Game:update(dt)
    Timer:start(dt, 10, Income)
end

function Game:draw()
    GameBox()
end