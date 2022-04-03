Key = {}

function Key:down(userKey, fn)
    function love.keypressed(key)
        if key == userKey then
            fn()
        end
    end 
end