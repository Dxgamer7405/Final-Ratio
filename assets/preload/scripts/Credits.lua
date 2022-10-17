credits = 'nao terminados lol'
anim = 'quartInOut'
CreditsStep = 1
CreditsTimer = 5
function onCreate()
	addLuaScript('data/'..songName..'/credits');
	
	makeLuaSprite('blacbar', 'credits/box', 1280/2 -208, -800)
	setProperty('blacbar.scale.x', 1.42)
	setObjectCamera('blacbar', 'other')
	addLuaSprite('blacbar', false)


	makeLuaText('creditsTXT', 'CREDITS', 200, 1280/2 -110, 200 -900)
	setTextSize('creditsTXT', 25)
	setTextBorder('creditsTXT', 2, '000000')
	setObjectCamera('creditsTXT', 'other')
	setTextFont('creditsTXT', 'arcadepi.ttf')
	addLuaText('creditsTXT')
end

function onSongStart()
    runTimer('starts', CreditsTimer-3);
end

function onTimerCompleted(tag)
	if tag == 'starts' then
		doTweenY('blacbar', 'blacbar', 0, 0.8, 'circInOut')
		doTweenY('creditsTXT', 'creditsTXT', 100, 0.8, 'circInOut')
		runTimer('off', CreditsTimer)
    end

    if tag == 'off' then
		doTweenY('blacbar', 'blacbar', -800, 0.8, 'circInOut')
		doTweenY('creditsTXT', 'creditsTXT', 200 -900, 0.8, 'circInOut')    
	end
end
