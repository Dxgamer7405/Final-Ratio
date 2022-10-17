function onCreate()
	makeLuaSprite('wht','', -180, -150);
	makeGraphic('wht',1800,800,'FFFFFF');
	addLuaSprite('wht', false);

	setScrollFactor('dad', 1.2, 1.2);
	setScrollFactor('boyfriend', 2, 2);
end

function onCreatePost()
	setProperty('gf.visible', false);
end


function onUpdate()
	if mustHitSection then
		setProperty('defaultCamZoom', 1.1);
	else
		setProperty('defaultCamZoom', 2.5);
	end

	setProperty('scoreTxt.visible', false)
	setProperty('timeTxt.visible', false)

	makeLuaText('Legomar_Gamer', 'Legomar Gamer: ' ..getProperty('songMisses'), getProperty('scoreTxt.width'), getProperty('scoreTxt.x'), getProperty('scoreTxt.y'))
	scaleObject('Legomar_Gamer', getProperty('scoreTxt.scale.x'), getProperty('scoreTxt.scale.y'))
	setTextSize('Legomar_Gamer', 20)
	setTextAlignment('Legomar_Gamer', 'center')
	setObjectOrder('Legomar_Gamer', getObjectOrder('scoreTxt'))
	setTextWidth('Legomar_Gamer', getProperty('scoreTxt.width'))
	addLuaText('Legomar_Gamer')

	makeLuaText('Legomar_Gamer2', 'Legomar Gamer', getProperty('timeTxt.width'), getProperty('timeTxt.x'), getProperty('timeTxt.y') +5)
	scaleObject('Legomar_Gamer2', getProperty('timeTxt.scale.x'), getProperty('timeTxt.scale.y'))
	setTextSize('Legomar_Gamer2', 20)
	setProperty('Legomar_Gamer2.alpha', getProperty('timeTxt.alpha'))
	setTextAlignment('Legomar_Gamer2', 'center')
	setObjectOrder('Legomar_Gamer2', getObjectOrder('timeTxt'))
	setTextWidth('Legomar_Gamer2', getProperty('timeTxt.width'))
	addLuaText('Legomar_Gamer2')

	setProperty('botplayTxt.text', 'Legomar Game')
end