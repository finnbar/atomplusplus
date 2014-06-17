require "requirer"

export gamestate = startup
export oldGamestate = {
	finish: () ->
	_name: "blank"
}

export fontTitle = love.graphics.newFont("assets/general/FantasqueSansMono-Regular.ttf",32)
export fontNorm = love.graphics.newFont("assets/general/FantasqueSansMono-Regular.ttf",12)
export fontBold = love.graphics.newFont("assets/general/FantasqueSansMono-Bold.ttf",12)

love.load = (args) ->
	if args
		arguments = ""
		for i,v in pairs(args)
			arguments..="#{v}, "
		print "#{arguments}, don't argue with me"

love.draw = () ->
	gamestate.draw! if gamestate.draw

love.update = (dt) ->
	if oldGamestate._name ~= gamestate._name
		oldGamestate.finish! if oldGamestate.finish
		gamestate.start! if gamestate.start
		oldGamestate = gamestate
	gamestate.update(dt) if gamestate.update
	if oldGamestate._name ~= gamestate._name
		oldGamestate.finish! if oldGamestate.finish
		gamestate.start! if gamestate.start
	oldGamestate = gamestate

love.keypressed = (key,uni) ->
	gamestate.keypressed(key,uni) if gamestate.keypressed

love.keyreleased = (key) ->
	gamestate.keyreleased(key) if gamestate.keyreleased

love.mousepressed = (x, y, button) ->
	gamestate.mousepressed(x,y,button) if gamestate.mousepressed

love.mousereleased = (x, y, button) ->
	gamestate.mousereleased(x,y,button) if gamestate.mousereleased

love.quit = () ->
	gamestate.quit! if gamestate.quit

love.textinput = (text) ->
	gamestate.textinput(text) if gamestate.textinput

love.focus = (f) ->
	gamestate.focus(f) if gamestate.focus