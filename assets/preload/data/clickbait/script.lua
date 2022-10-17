function onCreate()
    makeLuaSprite('blckfade', '', 0, 0);
	makeGraphic('blckfade', 1280, 720, '000000');
	setProperty('blckfade.alpha', 1.0)
    setObjectCamera('blckfade', 'other')
	addLuaSprite('blckfade', false);

    makeLuaSprite('fleeplay', 'EXTRAS/fleeplay', 0, 0);
    setObjectCamera('fleeplay', 'other')
    scaleObject('fleeplay', 1.0,1.0)
    screenCenter('fleeplay');
    setProperty('fleeplay.alpha', 0)
    addLuaSprite('fleeplay', false);
end

function onSongStart()
    doTweenAlpha('fleeplay', 'fleeplay', 1, 1, 'linear');
end

function onEvent(name, value1, value2)
	if name == "Events" then
		doTweenAlpha('fadeOFF', 'blckfade', 1, 1, 'linear');
		doTweenZoom('zoom', 'camGame', 10, 1, 'linear')
    end
end

function onUpdate()
    if curStep == 16 then
        setProperty('fleeplay.alpha', 0)
        setProperty('blckfade.alpha', 0)
    elseif curStep == 656 then
        setProperty('blckfade.alpha', 1)
        doTweenAlpha('fleeplay', 'fleeplay', 1, 1, 'linear');
    elseif curStep == 672 then
        setProperty('fleeplay.alpha', 0)
        setProperty('blckfade.alpha', 0)
    end
end