require("src/utils/timer")
require("src/states/game/ui/box")

Stats = {
    investments = {
        {name = "houses", amount = 1},
        {name = "lcoins", amount = 0},
        {name = "hotels", amount = 0}
    },
    money = 100,
    bills = 0,
    income = 50
}

Game = {
    nextInvestment = {
        name = "house",
        inv = Stats.investments[1].name,
        price = 50
    }
}



Box = {
    width = 600,
    height = 250,
    x = love.graphics.getWidth() / 2 - 600 / 2,
    y = love.graphics.getHeight() / 2 - 250 / 2,
    margin = 10,
    buttons = {
        { text = "Buy a new " .. Game.nextInvestment.name, fn = buyNewInvestment, x = love.graphics.getWidth() / 2 - 600 / 2 },
        { text = "Pay bills", fn = nil, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3, down = false },
        { text = "Go to work", fn = nil, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3 * 2, down = false }
    }
}


function Game:load()
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