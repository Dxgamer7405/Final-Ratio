local flashtype = 0;
local flashtime = 1;
local camera = 'camGame';
local xxgr, yygr = 1280, 720;
local xspr, yspr = 0, 0;
function onEvent(n,v1,v2)

	if n == 'Flash Camera' then

		flashtime = tonumber(v1)
		flashtype = tonumber(v2)

		if flashtype == 1 then
			camera = 'camGame';
			xspr = -400;
			yspr = 500;
			xxgr = 4000;
			yygr = 2000;
		elseif flashtype == 2 then
			camera = 'other';
			xspr = 0;
			yspr = 0;
		else
			camera = 'camHUD';
			xspr = 0;
			yspr = 0;
			setObjectOrder('flash',-1)
		end

		if flashtime == null then
			flashtime = 1
		else
			flashtime = flashtime
		end


		makeLuaSprite('flash', '', xspr, yspr);
		makeGraphic('flash',xxgr,yygr,'ffffff')
		setObjectCamera('flash', camera);

		setObjectOrder('flash',0)

		doTweenAlpha('flTw','flash',0,flashtime,'linear')
	    addLuaSprite('flash', false);
	end
end