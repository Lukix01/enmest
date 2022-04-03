require("utils/timer")
require("states/game/ui/box")
require("states/game/ui/alert")
require("modules/audio")

Stats = {
    investments = {
        { name = "houses", amount = 1, income = 50 },
        { name = "lcoins", amount = 0, income = 250 },
        { name = "hotels", amount = 0, income = 700 }
    },
    money = 1000000,
    bills = 20,
    waitingBills = 0,
    billsTime = 4,
    income = 50
}

Game = {
    alert = false,
    nextInvestment = {
        name = "house",
        inv = 1,
        price = 300,
        bills = 20,
    }
}

function buyNewInvestment()
    if Stats.money >= Game.nextInvestment.price then 
        Stats.investments[Game.nextInvestment.inv].amount = Stats.investments[Game.nextInvestment.inv].amount + 1
        Stats.money = Stats.money - Game.nextInvestment.price
        Stats.income = Stats.income + Stats.investments[Game.nextInvestment.inv].income 
        Stats.bills = Stats.bills + Game.nextInvestment.bills 
        if Stats.investments[1].amount == 10 and Stats.investments[2].amount == 0 then
            Game.nextInvestment.name = "lcoin"
            Game.nextInvestment.inv = 2
            Game.nextInvestment.price = 1000
            Game.nextInvestment.bills = 70
        elseif Stats.investments[2].amount == 10 then
            Game.nextInvestment.name = "hotel"
            Game.nextInvestment.inv = 3
            Game.nextInvestment.price = 5000
            Game.nextInvestment.bills = 200
        end
    end
end

function PayBills()
    if Stats.money >= Stats.waitingBills and Stats.waitingBills >= 0 then
        Stats.money = Stats.money - Stats.waitingBills
        Stats.waitingBills = 0
        Stats.billsTime = 4
    end
end

function Work()
    
end

Box = {
    width = 600,
    height = 250,
    x = love.graphics.getWidth() / 2 - 600 / 2,
    y = love.graphics.getHeight() / 2 - 250 / 2,
    margin = 10,
    buttons = {
        { text = "[1] Buy a new " .. Game.nextInvestment.name, secondText = true, fn = buyNewInvestment, x = love.graphics.getWidth() / 2 - 600 / 2 },
        { text = "[2] Pay bills", secondText = true, fn = PayBills, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3, down = false },
        { text = "[3] Go to work", fn = Work, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3 * 2, down = false }
    }
}


function Game:load()
    GameBox:load()
    Alert:load()
end

function Income()
    Stats.money = Stats.money + Stats.income
end


function Game:update(dt)
    function Bills()
        if Stats.billsTime == 0 then
            love.event.quit()
        else
            Stats.waitingBills = Stats.waitingBills + Stats.bills
            Stats.billsTime = Stats.billsTime - 1
            Audio:play("assets/sounds/alert.wav")
            Game.alert = true
        end
    end
    if Game.alert then
        Alert:update(dt, "New bills to pay ("  .. Stats.waitingBills .. "$) " .. "You have " .. Stats.billsTime ..  " weeks to do that, otherwise you lose the game.")
    end 
    Timer:start(dt, { { timeLimit = 10, fn = Income}, { timeLimit = 40, fn = Bills }  })
end

function Game:draw()
    Alert:draw()
    GameBox:draw()
end
