local scl = 3.3
local ysno = 0
function onCreate()
	makeAnimatedLuaSprite('static', 'bg/Phase3Static', -5, 0);
	addAnimationByPrefix('static', 'Phase3Static', 'Phase3Static instance 1', 24, true);
	scaleObject('static', scl, scl)
	setObjectCamera('static','other');
	setProperty('static.visible', false);
	addLuaSprite('static', false);	
end

function onEvent(n,v1,v2)

	if n == 'Hit Static' then
		ysno = tonumber(v1)
		if ysno == 0 then
			setProperty('static.visible', false);
		else
			setProperty('static.visible', true);
			objectPlayAnimation('static', 'Phase3Static', true);
		end
	end
end