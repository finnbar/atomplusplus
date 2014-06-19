export menu = {}

caret = true
delay = 0.015
menu._name = "menu"
text = [[                               
                               
     you must get the atoms    
                               
                               
           continue            
           new game            
          level edit           
          best times           
             quit              
                               
                                ]]

backing = [[                                              
   indeed                   you should        
                                              
                                              
                                              
      why wouldn't you?                       
                          they're great!      
                                              
 you'll be                                    
  powerful                                   
                                              
                               trust me!      
                                              
     they're                                  
 delicious, too!                              
                                              
                                  yeah!        ]]

menu.start = () ->
	export entire = typing(text)
	export back = typing(backing)

menu.draw = () ->
	love.graphics.setFont fontTitle
	love.graphics.setColor 255,255,0,255
	love.graphics.print back\text(true),2,0
	love.graphics.setFont fontMenu
	love.graphics.setColor 255,255,255,255
	love.graphics.print entire\text(caret),2,0

menu.update = (dt) ->
	delay-=dt
	while delay<=0
		entire\inc!
		back\inc!
		back\inc!
		delay+=0.015