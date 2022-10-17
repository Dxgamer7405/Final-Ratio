local xx, yy = 450, 800;
local xx2, yy2 = 620, 790;
local ofs = 10;
local followchars = true;
function onCreate()
	makeLuaSprite('blck', '', 0, 0);
	makeGraphic('blck', 1280, 720, '000000');
	setProperty('blck.alpha', 0.5)
    setObjectCamera('blck', 'camHUD');
	addLuaSprite('blck', true);

	makeLuaSprite('bg', 'bg/hulkbr/bg', -570, 335);
	scaleObject('bg', 1.1,1.1)
	addLuaSprite('bg', false);

	makeLuaSprite('cama', 'bg/hulkbr/cama', -300, 750);
	addLuaSprite('cama', false);

	addLuaScript('Ronaldoscripts/ytb_player');
end

function onUpdate()
	if followchars == true then
		if mustHitSection == false then
			setProperty("defaultCamZoom", 0.8);
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
			setProperty("defaultCamZoom", 0.75);
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