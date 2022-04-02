require("src/utils/timer")
require("src/states/game/ui/optionButton")
require("src/states/game/ui/box")

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

function Income()
    Stats.money = Stats.money + Stats.income
end

function Game:update(dt)
    Timer:start(dt, 10, Income)
end

function Game:draw()
    GameBox()
end