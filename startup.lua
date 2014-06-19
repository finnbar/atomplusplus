startup = { }
startup._name = "startup"
local jingle = love.audio.newSource("assets/general/jingle.wav")
local time = 0
local caret = false
local delay = 0.06
local staying = true
local timeleft = 2
startup.start = function()
  logo = love.graphics.newImage("assets/general/transparentTera.png")
  love.graphics.setFont(fontTitle)
  subtitle = typing("a game 			by finnbar keating")
  return jingle:play()
end
startup.draw = function()
  love.graphics.draw(logo, 250, 50)
  return love.graphics.print(subtitle:text(caret), 200, 500)
end
startup.update = function(dt)
  time = time + dt
  if time - (math.floor(time)) > 0.5 then
    caret = true
  else
    caret = false
  end
  delay = delay - dt
  while delay <= 0 do
    staying = subtitle:inc()
    delay = delay + 0.06
  end
  if not jingle:isPlaying() then
    gamestate = introduction
  end
end
startup.finish = function()
  logo = nil
  subtitle = nil
end
startup.keypressed = function(key)
  if key == " " then
    jingle:stop()
    gamestate = introduction
  end
end
