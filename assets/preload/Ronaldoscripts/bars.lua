local camada = 'camHUD';
local accuarcesystem = true;
function onCreate()
	makeLuaSprite('bartop','',0,0);
    makeGraphic('bartop',1280,100,'000000');
    setObjectCamera('bartop', camada);

    makeLuaSprite('barbot','',0,620);
    makeGraphic('barbot',1280,100,'000000');
    setObjectCamera('barbot', camada);

    setObjectOrder('barbot',2)
    setObjectOrder('bartop',2)

    addLuaSprite('bartop', false);
    addLuaSprite('barbot', false);
end