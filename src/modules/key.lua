Key = {
    instances = {}
}

function checkKey(checkedKey)
    for i, key in ipairs(Key.instances) do
        if checkedKey == key.key then
            return true
        end
    end
end

function Key:down(userKey, fn)
    if not checkKey(userKey) then
        table.insert(Key.instances, { key = userKey, fn = fn})
    end
    function love.keypressed(key)
        for i, instanceKey in ipairs(Key.instances) do
            if key == instanceKey.key then
                instanceKey.fn()
            end
        end
    end 
end