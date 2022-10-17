
function onUpdate()
	r = getRandomInt(1, 2)
end

function onEvent(n,v1,v2)
	if n == "Jumpscare" then
		makeLuaSprite('Jumpscare', 'bg/sanic/jumpscare'..r, 0, 0);
		setObjectCamera('Jumpscare', 'other');
		addLuaSprite('Jumpscare', false)

		doTweenAlpha('Jumpscare','Jumpscare',0,1.5,'linear')
		playSound('vineboom');
	end
end