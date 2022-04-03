require("modules/key")
require("states/game/ui/alert")
require("utils/timer")


Work = {}

function Work:load()
    Work.x = Box.x
    Work.y = Box.y + Box.height + 20
    Work.width = Box.width
    Work.height = 150
    Work.clicks = 0
end

function working()
    if Game.working then
        if Work.clicks < 49 then
            Work.clicks = Work.clicks + 1
        else
            Game.working = false
            Timer:start(dt, { { timeLimit = 10, fn = Income}, { timeLimit = 15, fn = Bills }  })
        end
    end
end

function Work:draw()
    love.graphics.setColor(0, 0, 0, 0.3)
    love.graphics.rectangle("fill", Work.x, Work.y, Work.width, Work.height)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("You are in work", love.graphics.newFont(20), Work.x, Work.y + 20, Work.width, "center")
    love.graphics.printf("Click the 'W' button 50 times to get paycheck", love.graphics.newFont(15), Work.x, Work.y + 50, Work.width, "center")
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.printf(Work.clicks, love.graphics.newFont(15), Work.x, Work.y + 70, Work.width, "center")
    love.graphics.setColor(1, 1, 1, 1)
    Key:down("w", working)
end