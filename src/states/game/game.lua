require("src/utils/timer")
require("src/states/game/ui/box")

Stats = {
    investments = {
        { name = "houses", amount = 1, income = 50 },
        { name = "lcoins", amount = 0, income = 250 },
        { name = "hotels", amount = 0, income = 700 }
    },
    money = 100,
    bills = 20,
    waitingBills = 0,
    income = 50
}

Game = {
    nextInvestment = {
        name = "house",
        inv = 1,
        price = 50,
        bills = 20,
    }
}

function buyNewInvestment()
    if Stats.money >= Game.nextInvestment.price then 
        Stats.investments[Game.nextInvestment.inv].amount = Stats.investments[Game.nextInvestment.inv].amount + 1
        Stats.money = Stats.money - Game.nextInvestment.price
        Stats.income = Stats.income + Stats.investments[Game.nextInvestment.inv].income 
        Game.nextInvestment.price = Game.nextInvestment.price * 1.5
        Stats.bills = Stats.bills + Game.nextInvestment.bills 
    else 
        print("not enough money")
    end
end

function PayBills()
    if Stats.money >= Stats.waitingBills and Stats.waitingBills >= 0 then
        Stats.money = Stats.money - Stats.waitingBills
        Stats.waitingBills = 0
    end
end


Box = {
    width = 600,
    height = 250,
    x = love.graphics.getWidth() / 2 - 600 / 2,
    y = love.graphics.getHeight() / 2 - 250 / 2,
    margin = 10,
    buttons = {
        { text = "[1] Buy a new " .. Game.nextInvestment.name, hover = Game.nextInvestment.price .. "$", fn = buyNewInvestment, x = love.graphics.getWidth() / 2 - 600 / 2 },
        { text = "[2] Pay bills", hover = "bills", fn = PayBills, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3, down = false },
        { text = "[3] Go to work", hover = "work", fn = Bills, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3 * 2, down = false }
    }
}


function Game:load()
    GameBox:load()
end

function Income()
    Stats.money = Stats.money + Stats.income
end

function Bills()
    if Stats.waitingBills == Stats.bills * 3 then
        love.event.quit()
    else
        Stats.waitingBills = Stats.waitingBills + Stats.bills
    end
end

function Game:update(dt)
    Timer:start(dt, { { timeLimit = 10, fn = Income}, { timeLimit = 5, fn = Bills}  })
end

function Game:draw()
    GameBox:draw()
end
