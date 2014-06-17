introduction = { }
introduction._name = "introduction"
local bgm = love.audio.newSource("assets/general/introduction.wav")
local time = 0
local caret = false
local delay = 0.09
local started = false
local staying = true
local colour = 255
local opening = [[	Welcome, 		friend.			

	As you know, not everything is well here in
The System.
Chemistry has gone bad, to put it bluntly.
	Elements cascade around and mess with
everything, only yielded
by a few mortals with power.	.	.		
	
	Fortunately, you're one of them.

		Which is why we've picked you to do this.
	The mission's pretty simple,
	you'll learn on the way.

				Just remember.	.	.
			You must get the atoms.]]
introduction.start = function()
  subtitle = typing(opening)
  bgm:play()
  started = true
end
introduction.draw = function()
  love.graphics.setColor(255, 255, 255, colour)
  return love.graphics.print(subtitle:text(caret), 2, 0)
end
introduction.update = function(dt)
  if started then
    time = time + dt
    if time - (math.floor(time)) > 0.5 then
      caret = true
    else
      caret = false
    end
    delay = delay - dt
    if delay <= 0 then
      staying = subtitle:inc()
      delay = 0.09
    end
    if not bgm:isPlaying() then
      gamestate = menu
    end
    if not staying then
      if colour > 0 then
        colour = colour - (dt * 100)
      end
    end
  end
end
introduction.finish = function()
  bgm = nil
  subtitle = nil
end
