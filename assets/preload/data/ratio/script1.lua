local alpha = 0.5;
local health = 0;
local ghost = 0;
local sufix = {nil, nil};
local sings = {nil, nil, nil, nil};

-- character name
local name = 'rolaldo';
local charlocal = 'rolaldo_assets';
local num = 6;

function onCreatePost()
	if not lowQuality then

		-- nao mexer lol
		if boyfriendName == name then
			sufix = {'boyfriend', 'Boyfriend'}
		elseif dadName == name then
			sufix = {'dad', 'Opponent'}
		elseif gfName == name then
			sufix = {'gf', 'Girlfriend'}
		end 

		-- here
		sings = {
			sufix[2]..'_left',
			sufix[2]..'_up',
			sufix[2]..'_down',
			sufix[2]..'_right',
			sufix[2]..'_bate',
			sufix[2]..'_fala'
		}

		-- here
		singsXML = {
			'ronildo left',
			'ronildo up',
			'ronildo down',
			'ronildo right',
			'ronildo filho da pu',
			'ronildoespanca'
		}

		-- X e Y
		local Xghs = getProperty(sufix[1]..'.x');
		local Yghs = getProperty(sufix[1]..'.y');

		-- height e width
		local height = getProperty(sufix[1]..'.height');
		local width = getProperty(sufix[1]..'.width');

		local scaleX = getProperty(sufix[1]..'.scale.x');
		local scaleY = getProperty(sufix[1]..'.scale.y');

		local flipX = getProperty(sufix[1]..'.flipX');
		local flipY = getProperty(sufix[1]..'.flipY');

		makeAnimatedLuaSprite(sings[1],'characters/'..charlocal,	Xghs*1.2	,Yghs*2);
		makeAnimatedLuaSprite(sings[2],'characters/'..charlocal,	Xghs*1.2	,Yghs*2);
		makeAnimatedLuaSprite(sings[3],'characters/'..charlocal, 	Xghs*1.2	,Yghs*2);
		makeAnimatedLuaSprite(sings[4],'characters/'..charlocal,	Xghs*1.2	,Yghs*2);
		makeAnimatedLuaSprite(sings[5],'characters/'..charlocal,	Xghs*1.2	,Yghs*2);
		makeAnimatedLuaSprite(sings[6],'characters/'..charlocal,	Xghs*1.2	,Yghs*2);


		for i= 1,num do 
			addAnimationByPrefix(sings[i],sings[i]..'_ghost',singsXML[i],24,false);
			setProperty(sings[i]..'.alpha',0);
			setProperty(sings[i]..'.flipX',flipX);
			setProperty(sings[i]..'.flipY',flipY);
			scaleObject(sings[i],scaleX,scaleY);
			setProperty(sings[i]..'.visible',true);
			addLuaSprite(sings[i],false);
		end
	end
end

function onUpdate(elapsed)   
	if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
        doTweenAlpha('showleft',sings[1],alpha,0.1,'linear');
		objectPlayAnimation(sings[1],sings[1]..'_ghost', true);
    end
	if getProperty('dad.animation.curAnim.name') == 'singUP' then
        doTweenAlpha('showup',sings[2],alpha,0.1,'linear');
		objectPlayAnimation(sings[2],sings[2]..'_ghost', true);
    end
	if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
        doTweenAlpha('showdown',sings[3],alpha,0.1,'linear');
		objectPlayAnimation(sings[3],sings[3]..'_ghost', true);
    end
    if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
        doTweenAlpha('showright',sings[4],alpha,0.1,'linear');
		objectPlayAnimation(sings[4],sings[4]..'_ghost', true);
    end
	if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
        doTweenAlpha('showdown-alt',sings[5],alpha,0.1,'linear');
		objectPlayAnimation(sings[5],sings[5]..'_ghost', true);
    end
	if getProperty('dad.animation.curAnim.name') == 'fdp' then
        doTweenAlpha('showfdp',sings[6],alpha,0.1,'linear');
		objectPlayAnimation(sings[6],sings[6]..'_ghost', true);
    end
end

function onTweenCompleted(t)
    if t == 'showleft' then
        doTweenAlpha('hideleft',sings[1],0,0.3);
    end
	if t == 'showup' then
        doTweenAlpha('hideup',sings[2],0,0.3);
    end
	if t == 'showdown' then
        doTweenAlpha('hidedown',sings[3],0,0.3);
    end
    if t == 'showright' then
        doTweenAlpha('hideright',sings[4],0,0.3);
    end
	if t == 'showdown-alt' then
        doTweenAlpha('hidedown-alt',sings[5],0,0.3);
    end
	if t == 'showfdp' then
        doTweenAlpha('hidefdp',sings[6],0,0.3);
    end
end

function onEvent(n,v1,v2)
	if n == 'Ghost' then
		ghost = tonumber(v1);
		for i = 1,num do
			if ghost == 1 then
				setProperty(sings[i]..'.visible',true);
			else
				setProperty(sings[i]..'.visible',false);
			end
		end
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	health = getProperty('health')
	if noteType == 'Alt Animation' and 'No Animation' then
		setProperty('health', health- 2/8);
		triggerEvent('Add Camera Zoom', '0.15', '0.03')
		triggerEvent('Screen Shake', '0.0, 0.00', '0.1, 0.01');
	end
end

--[[
local alpha = 0.5;
local health = 0;
local ghost = 0;
local sufix = {nil, nil};

-- character name
local name = 'rolaldo';
local namexml = 'rolaldo_assets';

function onCreatePost()
	if not lowQuality then

		if boyfriendName == name then
			sufix = {'boyfriend', 'Boyfriend'}
		elseif dadName == name then
			sufix = {'dad', 'Opponent'}
		elseif gfName == name then
			sufix = {'gf', 'Girlfriend'}
		end 

		-- temporario
		local Xgh = getProperty(sufix[1]..'.x');
		local Ygh = getProperty(sufix[1]..'.y');

		local XW = getProperty(sufix[1]..'.height');
		local XH = getProperty(sufix[1]..'.width');
		--width
		local ScaleX = getProperty(sufix[1]..'.scale.x');
		local ScaleY = getProperty(sufix[1]..'.scale.y');

		makeAnimatedLuaSprite('left','characters/'..namexml,	XH +100,XW -600);
		makeAnimatedLuaSprite('up','characters/'..namexml,		XH +100,XW -600);
		makeAnimatedLuaSprite('down','characters/'..namexml,	XH +100,XW -600);
		makeAnimatedLuaSprite('right','characters/'..namexml,	XH +100,XW -600);

		addAnimationByIndices('left','singLEFTghost','Left','14',24);
		addAnimationByIndices('up','singUPghost','Up','14',24);
		addAnimationByIndices('down','singDOWNghost','Down','14',24);
		addAnimationByIndices('right','singRIGHTghost','Right','14',24);

		setProperty('left.alpha',0);
		setProperty('up.alpha',0);
		setProperty('down.alpha',0);
		setProperty('right.alpha',0);

		setProperty('left.offset.x',0);
		setProperty('up.offset.x',0);
		setProperty('down.offset.x',0);
		setProperty('right.offset.x',0);

		setProperty('left.offset.y',offsetY);
		setProperty('up.offset.y',offsetY);
		setProperty('down.offset.y',offsetY);
		setProperty('right.offset.y',offsetY);

		scaleObject('left',ScaleX,ScaleY);
		scaleObject('up',ScaleX,ScaleY);
		scaleObject('down',ScaleX,ScaleY);
		scaleObject('right',ScaleX,ScaleY);
	
		setProperty('left.flipX',true);
		setProperty('up.flipX',true);
		setProperty('down.flipX',true);
		setProperty('right.flipX',true);

		addLuaSprite('left',false);
		addLuaSprite('up',false);
		addLuaSprite('down',false);
		addLuaSprite('right',false);
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	health = getProperty('health')
	if noteType == 'Alt Animation' and 'No Animation' then
		setProperty('health', health- 2/8);
		triggerEvent('Add Camera Zoom', '0.15', '0.03')
		triggerEvent('Screen Shake', '0.0, 0.00', '0.1, 0.01');
	end
end

function onTweenCompleted(t)
    if t == 'showleft' then
        doTweenAlpha('hideleft','left',0,0.3);
    end
    if t == 'showright' then
        doTweenAlpha('hideright','right',0,0.3);
    end
    if t == 'showup' then
        doTweenAlpha('hideup','up',0,0.3);
    end
    if t == 'showdown' then
        doTweenAlpha('hidedown','down',0,0.3);
    end
end

function onUpdate(elapsed)   
	if getProperty(sufix[1]..'.animation.curAnim.name') == 'singLEFT' then
        doTweenAlpha('showleft','left',alpha,0.1,'linear');
    end
    if getProperty(sufix[1]..'.animation.curAnim.name') == 'singRIGHT' then
        doTweenAlpha('showright','right',alpha,0.1,'linear');
    end
    if getProperty(sufix[1]..'.animation.curAnim.name') == 'singUP' then
        doTweenAlpha('showup','up',alpha,0.1,'linear');
    end
    if getProperty(sufix[1]..'.animation.curAnim.name') == 'singDOWN' then
        doTweenAlpha('showdown','down',alpha,0.1,'linear');
    end
end

function onEvent(n,v1,v2)
	if n == 'GhostShit' then
		ghost = tonumber(v1);
		if ghost == 0 then
			setProperty('left.visible',false);
			setProperty('up.visible',false);
			setProperty('down.visible',false);
			setProperty('right.visible',false);
		elseif 1 then
			setProperty('left.visible',true);
			setProperty('up.visible',true);
			setProperty('down.visible',true);
			setProperty('right.visible',true);
		end
	end
end
]]