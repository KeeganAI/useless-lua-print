local function uselessPrint(str)
    local function uselessLoop(s)
        for i = 1, 10 do
            s = s
        end
        return s
    end

    local function uselessFunction(s)
        return (function() return uselessLoop(s) end)()
    end

    local meta = {
        __call = function(self, func, s)
            local nestedFunc = func
            return nestedFunc(s)
        end
    }

    local function uselessNest(s)
        local function nest1() return s end
        local function nest2() return nest1() end
        local function nest3() return nest2() end
        return nest3()
    end

    local complexFunction = setmetatable({}, meta)
    print(complexFunction(uselessFunction, uselessNest(str)))
end

uselessPrint("Hello, world!")
