function onCreatePost()
	--Variable Shit
		actnum = 1 -- the act number you want displayed, the options are: '1' '2' '1 no act text' '2 no act text'
		TheCustomZoneName = songName --custom zone name text.
		CustomZoneName = false -- put to true if you want a custom zone name or else it will be the song name.
		ZoneFont = "Andes.ttf" -- the font used for the zone name.
		barname = 'FNF PE' -- the text on the red bar you want displayed, the options are: 'S3' 'SK' 'S3&K' 'FNF' 'FNF no line' 'full FNF' 'PE' 'FNF PE' 'FNF & PE' 'FNF + PE' 'Blank'
		zone = 'zone' -- the text that says "ZONE", you can change it to whatever you want or leave it blank if you don't want anything to show there.
end

local allowCountdown = false

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startText' and not CustomZoneName then
		if songName == 'counter-ratio' then
			actnum = 2
		elseif songName == 'final-ratio' then
			actnum = 3
		elseif songName == 'rapidaum' then
			ZoneFont = 'Comic.ttf'
			barname = 'low quality'
			actnum = 69
		elseif songName == 'legomar_game' then
			TheCustomZoneName = 'LEGOMAR GAME'
			zone = 'ZONE'
			ZoneFont = 'legomar-game.ttf'
		end

		makeLuaSprite('black','',0,0);
		makeGraphic('black',1280,720,'000000')
		setObjectCamera('black','other')
		addLuaSprite('black',false);

		makeLuaSprite('bar','S3 Title Card/'.. barname.. ' Redbar',100,-1000)
		setObjectCamera('bar','other')
		setProperty('bar.antialiasing',false)
		scaleObject('bar',3,3);
		addLuaSprite('bar',true)

		makeLuaSprite('act','S3 Title Card/Act'.. actnum,2200,500)
		setProperty('act.antialiasing',false)
		scaleObject('act',4,4);
		setObjectCamera('act','other')
		addLuaSprite('act',true)

		makeLuaText('text',TheCustomZoneName,2000,2200,250)
		setObjectCamera('text','other')
		setTextSize('text',130)
		setTextBorder('text',0)
		setTextFont('text',ZoneFont)
		addLuaText('text')

		makeLuaText('zone',zone,2000,2200,350)
		setObjectCamera('zone','other')
		setTextSize('zone',130)
		setTextBorder('zone',0)
		setTextFont('zone',ZoneFont)
		addLuaText('zone')

		runTimer('appear', 0.3, 1)
		runTimer('fadeout', 2, 1)
		runTimer('flyoff', 3, 1)
	elseif tag == 'appear' then
		doTweenY('bartween', 'bar', -100, 1.2, 'circInOut')
		doTweenX('texttween', 'text', -400, 1.2, 'circInOut')
		doTweenX('zonetween', 'zone', -200, 1.2, 'circInOut')
		doTweenX('acttween', 'act', 800, 1.2, 'circInOut')
	end
	if tag == 'fadeout' then
		doTweenAlpha('blackfade', 'black', 0, 0.5, 'circInOut')
	end
	if tag == 'flyoff' then
		doTweenY('bartween', 'bar', -1000, 1.2, 'circInOut')
		doTweenX('texttween', 'text', 2200, 1.2, 'circInOut')
		doTweenX('zonetween', 'zone', 2200, 1.2, 'circInOut')
		doTweenX('acttween', 'act', 2200, 1.2, 'circInOut')
	end
	if tag == 'countdown' then
		startCountdown()
	end
end

function onTweenCompleted(tag)
	if tag == 'act' then
		removeLuaSprite('act')
		removeLuaSprite('bar')
		removeLuaText('zone')
		removeLuaText('text')
	end
end