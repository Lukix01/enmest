require("src/events/hover")

Button = {}

function Button:load() 
    Button.font = love.graphics.newFont(20)
    Button.mx, Button.my = love.mouse.getPosition()
    Button.width = Box.width / 3 - Box.margin
    Button.margin = 0
    Button.height = 70
    Button.x = (Box.x + Box.width / 2) - Box.width / 3 - Button.width / 2 + Button.margin
    Button.y = 395
    Button.hover = hover(Button.mx, Button.my, Button.x, Button.y, Button.width, Button.height)
end


function Button:draw(text,  fn, margin)
    Button.margin = Button.margin + margin
    love.graphics.setColor(0.3, 0.5, 0.2, 1)
    if hover then
        love.graphics.setColor(0.3, 0.5, 0.2, 0.7)
    end
    love.graphics.rectangle("fill", Button.x, Button.y, Button.width, Button.height)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(text, Button.font, Button.x + Button.width / 2 - Button.font:getWidth(text) / 2, Button.y + Button.font:getHeight())
end

-- function love.mousepressed(x, y, button, istouch, presses)
--     if Button.hover then 
--         if button == 1 then
--             Stats.money = Stats.money + 10
--         end
--     end
-- end