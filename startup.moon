export startup = {}

startup._name = "startup"
jingle = love.audio.newSource "assets/general/jingle.wav"
time = 0
caret = false
delay = 0.06
staying = true
timeleft = 2

startup.start = () ->
	export logo = love.graphics.newImage "assets/general/transparentTera.png"
	love.graphics.setFont fontTitle
	export subtitle = typing("a game 			by finnbar keating") --three tabs == three pauses
	jingle\play!

startup.draw = () ->
	love.graphics.draw logo,250,50
	love.graphics.print subtitle\text(caret),200,500

startup.update = (dt) ->
	time+=dt
	if time-(math.floor time)>0.5
		caret = true
	else
		caret = false
	delay-=dt
	while delay<=0
		staying = subtitle\inc!
		delay += 0.06
	if not jingle\isPlaying!
		export gamestate = introduction

startup.finish = () ->
	export logo = nil
	export subtitle = nil

startup.keypressed = (key) ->
	if key==" "
		jingle\stop!
		export gamestate = introduction