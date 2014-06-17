export introduction = {}

introduction._name = "introduction"
bgm = love.audio.newSource "assets/general/introduction.wav"
time = 0
caret = false
delay = 0.09
started = false
staying = true
colour = 255
opening = [[	Welcome, 		friend.			

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

--this is where we draw the intro cutscene

introduction.start = () ->
	--set up the typing thing
	export subtitle = typing(opening)
	bgm\play!
	started = true

introduction.draw = () ->
	love.graphics.setColor 255,255,255,colour
	love.graphics.print subtitle\text(caret),2,0

introduction.update = (dt) ->
	if started
		time+=dt
		if time-(math.floor time)>0.5
			caret = true
		else
			caret = false
		delay-=dt
		if delay<=0
			staying = subtitle\inc!
			delay = 0.09
		if not bgm\isPlaying!
			export gamestate = menu
		if not staying
			if colour>0	
				colour-=(dt*100)

introduction.finish = () ->
	bgm = nil
	export subtitle = nil