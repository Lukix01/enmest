Key = {}

function Key:down(key, fn)
    if love.keyboard.isDown(key) then
        fn()
    end
end