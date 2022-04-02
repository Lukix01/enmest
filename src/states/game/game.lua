require("src/utils/timer")
require("src/states/game/ui/button")
require("src/states/game/ui/box")

Game = {
    nextInvestment = {
        name = "house",
        price = 50
    }
}

Stats = {
    investments = {
        houses = 1,
        lcoins = 0,
        hotels = 0
    },
    money = 100,
    income = 20
}

Box = {
    width = 600,
    height = 250,
    x = love.graphics.getWidth() / 2 - 600 / 2,
    y = love.graphics.getHeight() / 2 - 250 / 2,
    margin = 10,
    buttons = {
        { text = "Buy a new " .. Game.nextInvestment.name, fn = nil, x = love.graphics.getWidth() / 2 - 600 / 2 },
        { text = "Pay bills", fn = nil, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3 },
        { text = "Go to work", fn = nil, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3 * 2 }
    }
}

function Game:load()
    Stats.income = 20
    GameBox:load()
end

function Income()
    Stats.money = Stats.money + Stats.income
end

function Game:update(dt)
    Timer:start(dt, 10, Income)
end

function Game:draw()
    GameBox:draw()
end