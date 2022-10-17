CreditsStep = 1
CreditsTimer = 5
credits = 
[[
    MUSIC
    HUNDRED

    CODE & CHART
    NAIT

    ART
    YOGA & HARI

    VOICE
    RUSBE GUAYANDO 

    ANIMATION
    NUKY
]]	
anim = 'quartInOut'

function onCreate()
	makeLuaText('credits', credits, 600, 1280/2 -350, 100 -900)
	setTextSize('credits', 25)
	setTextBorder('credits', 2, '000000')
	setObjectCamera('credits', 'other')
	setTextFont('credits', 'arcadepi.ttf')
	setTextAlignment('credits', 'center')
	addLuaText('credits')
end

function onSongStart()
    runTimer('starts', CreditsTimer-3);
end

function onTimerCompleted(tag)
    if tag == 'starts' then
        doTweenY('credits', 'credits', 200, 0.8, anim)
        runTimer('off', CreditsTimer)
    end

    if tag == 'off' then
        doTweenY('credits', 'credits', 100 -900, 0.8, anim)
    end
end