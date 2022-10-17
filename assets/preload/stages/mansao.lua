local xx, yy = 1100, 720;
local xx2, yy2 = 1400, 720;
local ofs = 50;
local followchars = true;

function onCreate()
	makeLuaSprite('whte','',0, 0);
	makeGraphic('whte', 3000, 2000,'ffffff');
	addLuaSprite('whte', false);

	makeLuaSprite('bg','bg/bg',-100,0);
	scaleObject('bg', 1.7,1.7);
	addLuaSprite('bg', false);

	addLuaScript('Ronaldoscripts/bars');
end

function onCreatePost()
	makeLuaSprite('mesa','bg/mesa',400,950);
	scaleObject('mesa', 0.8,0.8)
	setObjectOrder('mesa', 8);
	addLuaSprite('mesa', false);

	if songName == 'counter-ratio' then
		xx, yy = 1400, 790;
		xx2, yy2 = 1400, 790;
		setObjectOrder('mesa', 6);
	end
end

function onUpdate()
	runHaxeCode([[
		timeBarBG.color = FlxColor.WHITE;
	]])

	if songName == 'counter-ratio' then
		if curStep == 60 then
			xx, yy = 800, 790;
		elseif curStep == 127 then
			xx, yy = 1200, 750;
			xx2, yy2 = 1400, 770;
		end
	elseif songName == 'Ratio' then
		setProperty('gf.visible', false)
	end


	if followchars == true then
		if mustHitSection == false then
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx-ofs,yy)
			elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx+ofs,yy)
			elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',xx,yy-ofs)
			elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx,yy+ofs)
			elseif getProperty('dad.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',xx,yy)
			end
		else
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx2,yy2+10)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',xx2,yy2)
			end
		end
	else
		triggerEvent('Camera Follow Pos','','')
	end
	if lowQuality then
		ofs = 0
	end
end