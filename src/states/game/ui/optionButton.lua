function OptionButton(text, i)
    local font = love.graphics.newFont(20)
    local width = Box.width / 3 - Box.margin
    local height = 70
    local x = (Box.x + Box.width / 2) - Box.width / 3 - width / 2 + Box.margin
    if i == 2 then
        x = x + width + Box.margin
    elseif i == 3 then
        x = x + width * 2 + Box.margin
    end
    local y = 395
    love.graphics.setColor(0.3, 0.5, 0.2, 1)
    love.graphics.rectangle("fill", x, y, width, height)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(text, font, x + width / 2 - font:getWidth(text) / 2, y + font:getHeight())
end