require("src/events/hover")

Button = {}

function Button:load() 
    Button.font = love.graphics.newFont(20)
    Button.mx, Button.my = love.mouse.getPosition()
    Button.width = Box.width / 3
    Button.height = 70
    Button.x = (Box.x + Box.width / 2) - Box.width / 3 - Button.width / 2
    Button.y = 395
    Button.hover = Hover(Button.mx, Button.my, Button.x, Button.y, Button.width, Button.height)
end


function Button:draw(text,  fn, x, y)
    love.graphics.setColor(0.3, 0.5, 0.2, 1)
    if Hover then
        love.graphics.setColor(0.3, 0.5, 0.2, 0.7)
    end
    love.graphics.rectangle("fill", x, y, Button.width, Button.height)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(text, Button.font, x + Button.width / 2 - Button.font:getWidth(text) / 2, y + Button.font:getHeight())
end

-- function love.mousepressed(x, y, button, istouch, presses)
--     if Button.hover then 
--         if button == 1 then
--             Stats.money = Stats.money + 10
--         end
--     end
-- end