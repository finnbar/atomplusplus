require("requirer")
gamestate = startup
oldGamestate = {
  finish = function() end,
  _name = "blank"
}
fontTitle = love.graphics.newFont("assets/general/FantasqueSansMono-Regular.ttf", 32)
fontNorm = love.graphics.newFont("assets/general/FantasqueSansMono-Regular.ttf", 12)
fontBold = love.graphics.newFont("assets/general/FantasqueSansMono-Bold.ttf", 12)
love.load = function(args)
  if args then
    local arguments = ""
    for i, v in pairs(args) do
      arguments = arguments .. tostring(v) .. ", "
    end
    return print(tostring(arguments) .. ", don't argue with me")
  end
end
love.draw = function()
  if gamestate.draw then
    return gamestate.draw()
  end
end
love.update = function(dt)
  if oldGamestate._name ~= gamestate._name then
    if oldGamestate.finish then
      oldGamestate.finish()
    end
    if gamestate.start then
      gamestate.start()
    end
    oldGamestate = gamestate
  end
  if gamestate.update then
    gamestate.update(dt)
  end
  if oldGamestate._name ~= gamestate._name then
    if oldGamestate.finish then
      oldGamestate.finish()
    end
    if gamestate.start then
      gamestate.start()
    end
  end
  oldGamestate = gamestate
end
love.keypressed = function(key, uni)
  if gamestate.keypressed then
    return gamestate.keypressed(key, uni)
  end
end
love.keyreleased = function(key)
  if gamestate.keyreleased then
    return gamestate.keyreleased(key)
  end
end
love.mousepressed = function(x, y, button)
  if gamestate.mousepressed then
    return gamestate.mousepressed(x, y, button)
  end
end
love.mousereleased = function(x, y, button)
  if gamestate.mousereleased then
    return gamestate.mousereleased(x, y, button)
  end
end
love.quit = function()
  if gamestate.quit then
    return gamestate.quit()
  end
end
love.textinput = function(text)
  if gamestate.textinput then
    return gamestate.textinput(text)
  end
end
love.focus = function(f)
  if gamestate.focus then
    return gamestate.focus(f)
  end
end
