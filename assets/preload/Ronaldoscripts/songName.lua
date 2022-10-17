local songNameSysten = false;
local author = 'Hundred'
function onCreate()
	if songNameSysten then
		if songName == 'Counter-Ratio' then
			author = 'LazyBudd'
		elseif songName == 'final-Ratio' then
			author = 'Hundred ft. Nasa'
		elseif songName == 'legomar-game' then
			author = 'DudaBu'
		end
		-- setProperty('skipCountdown',true)
		makeLuaSprite('blck','',0,0);
		makeGraphic('blck',1280,720,'000000')
		setObjectCamera('blck','other')
		addLuaSprite('blck',false);
		makeLuaSprite('startS','startscreens/'..dadName,1000,0);
		setObjectCamera('startS','other')
		addLuaSprite('startS',false);
		
		makeLuaText('songNametxt',songName,-3,-700,250);
		setTextFont('songNametxt','NiseSegaSonic.ttf');
		setObjectCamera('songNametxt','other');
		setTextSize('songNametxt',100);
		addLuaText('songNametxt');

		makeLuaText('author','by: '..author,-3,-700,350);
		setTextFont('author','NiseSegaSonic.ttf');
		setObjectCamera('author','other');
		setTextSize('author',50);
		addLuaText('author');
	end
end

function onCountdownTick(counter)
	if counter == 0 then
		runTimer('startS', 1.1)
		doTweenX('startS', 'startS', 0, 0.5, 'linear')
		doTweenX('songNametxt', 'songNametxt', 160, 0.5, 'linear')
		doTweenX('author', 'author', 250, 0.5, 'linear')
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if songNameSysten then
		if tag == 'startS' then
			doTweenAlpha('alpha', 'blck', 0, 0.5, 'linear')
			doTweenAlpha('alpha1', 'startS', 0, 0.5, 'linear')
			doTweenAlpha('alpha2', 'songNametxt', 0, 0.5, 'linear')
			doTweenAlpha('alpha3', 'author', 0, 0.5, 'linear')
		end
	end
end