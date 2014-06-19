menu = { }
local caret = true
local delay = 0.015
menu._name = "menu"
local text = [[                               
                               
     you must get the atoms    
                               
                               
           continue            
           new game            
          level edit           
          best times           
             quit              
                               
                                ]]
local backing = [[                                              
   indeed                   you should        
                                              
                                              
                                              
      why wouldn't you?                       
                          they're great!      
                                              
 you'll be                                    
  powerful                                   
                                              
                               trust me!      
                                              
     they're                                  
 delicious, too!                              
                                              
                                  yeah!        ]]
menu.start = function()
  entire = typing(text)
  back = typing(backing)
end
menu.draw = function()
  love.graphics.setFont(fontTitle)
  love.graphics.setColor(255, 255, 0, 255)
  love.graphics.print(back:text(true), 2, 0)
  love.graphics.setFont(fontMenu)
  love.graphics.setColor(255, 255, 255, 255)
  return love.graphics.print(entire:text(caret), 2, 0)
end
menu.update = function(dt)
  delay = delay - dt
  while delay <= 0 do
    entire:inc()
    back:inc()
    back:inc()
    delay = delay + 0.015
  end
end
