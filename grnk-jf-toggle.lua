-- GRNK jf toggle
--
--- utility to toggle
--- just friend's mode

local current_mode = 0
local counter = 0

function init()
  crow.ii.jf.get('mode')
end

crow.ii.jf.event = function( e, value )
  if e.name == 'mode' then
    if counter == 0 then -- if this is the init funtion, just read the mode
      current_mode = value
      counter = counter + 1
      redraw()
    elseif counter > 0 then -- toggle the mode
      if current_mode == 0 then current_mode = 1 
      elseif current_mode == 1 then current_mode = 0 end
      crow.ii.jf.mode(current_mode)
      redraw()
    end
  end
end

function key(n,z)
  if n == 3 and z == 1 then
    crow.ii.jf.get('mode')
  end
end

function redraw()
  screen.clear()
  screen.aa(1)
  screen.font_face(1)
  screen.font_size(8)
  screen.level(4)
  screen.move(64, 28)
  screen.text_center('just friends')
  screen.level(15)
  screen.move(64, 40)
  screen.text_center('mode: ' .. current_mode)

  screen.fill()
  screen.update()
end




-- UTILITY TO RESTART SCRIPT FROM MAIDEN
function r()
  norns.script.load(norns.state.script)
end
