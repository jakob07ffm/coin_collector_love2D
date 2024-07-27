
function love.load()

    doge = {
        x = 400,
        y = 300,
        size = 40,
        speed = 200
    }


    coin = {
        x = math.random(0, love.graphics.getWidth() - 20),
        y = math.random(0, love.graphics.getHeight() - 20),
        size = 20
    }


    score = 0
end


function love.update(dt)

    if love.keyboard.isDown("left") then
        doge.x = doge.x - doge.speed * dt
    elseif love.keyboard.isDown("right") then
        doge.x = doge.x + doge.speed * dt
    end
    if love.keyboard.isDown("up") then
        doge.y = doge.y - doge.speed * dt
    elseif love.keyboard.isDown("down") then
        doge.y = doge.y + doge.speed * dt
    end

    if checkCollision(doge.x, doge.y, doge.size, doge.size, coin.x, coin.y, coin.size, coin.size) then

        coin.x = math.random(0, love.graphics.getWidth() - coin.size)
        coin.y = math.random(0, love.graphics.getHeight() - coin.size)

        score = score + 1
    end
end


function love.draw()
  
    love.graphics.setColor(1, 1, 0) 
    love.graphics.circle("fill", doge.x + doge.size / 2, doge.y + doge.size / 2, doge.size / 2)

    love.graphics.setColor(1, 0.84, 0) 
    love.graphics.rectangle("fill", coin.x, coin.y, coin.size, coin.size)

    love.graphics.setColor(1, 1, 1) 
    love.graphics.print("Score: " .. score, 10, 10)
end


function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and
           x2 < x1 + w1 and
           y1 < y2 + h2 and
           y2 < y1 + h1
end
