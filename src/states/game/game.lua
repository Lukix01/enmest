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
    margin = 10,
    buttons = {
        { text = "Buy a new " .. Game.nextInvestment.name, fn = nil },
        -- { text = "Pay bills", fn = nil },
        -- { text = "Go to work", fn = nil }
    }
}


function Game:load()
    Box.width = 600
    Box.height = 250
    Box.x = love.graphics.getWidth() / 2 - Box.width / 2
    Box.y = love.graphics.getHeight() / 2 - Box.height / 2
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