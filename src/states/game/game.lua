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

function test()
    print("test")
end

function second()
    print("second")
end

Box = {
    width = 600,
    height = 250,
    x = love.graphics.getWidth() / 2 - 600 / 2,
    y = love.graphics.getHeight() / 2 - 250 / 2,
    margin = 10,
    buttons = {
        { text = "Buy a new " .. Game.nextInvestment.name, fn = test, x = love.graphics.getWidth() / 2 - 600 / 2, down = false, pressed = false },
        { text = "Pay bills", fn = test, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3, down = false, pressed = false },
        { text = "Go to work", fn = second, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3 * 2, down = false, pressed = false }
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