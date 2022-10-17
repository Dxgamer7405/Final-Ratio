local xx, yy = 1400, 900;
local xx2, yy2 = 1400, 900;
local ofs = 50;
local followchars = true;
function onCreate()
	-- bg stuuf
	makeAnimatedLuaSprite('animabits', 'bg/animabits/animabits', -5, 0);
	addAnimationByPrefix('animabits', 'animabits', 'bg', 24, true);
	scaleObject('animabits', 1.5, 1.5)
	setProperty('animabits.antialiasing',false)
	addLuaSprite('animabits', false);

	makeLuaSprite('N','bg/animabits/N',1200,580);
	scaleObject('N', 0.7, 0.7)
	setObjectCamera('N','other')
	addLuaSprite('N',false);

	addLuaScript('Ronaldoscripts/ytb_player');
end

function onUpdate()
	if not middlescroll then
		for i=0,4 do
			setPropertyFromGroup('playerStrums',i,'x',92+112*i);
			setPropertyFromGroup('opponentStrums',i,'x',732+112*i);
		end
	end

	if curStep > 15 then
		xx, yy = 1000, 900;
	end
	setProperty('gf.visible', false);
	if followchars == true then
		if mustHitSection == false then
			setProperty("defaultCamZoom", 0.7);
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
			setProperty("defaultCamZoom", 0.5);
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
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

