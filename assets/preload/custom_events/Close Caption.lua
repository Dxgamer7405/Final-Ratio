function onEvent(n, v1, v2)

	if n == "Close Caption" then
        removeLuaText('text', true)

        makeLuaText('text', v1, 1280, 0, 500); 
        setTextBorder('text', 2, '000000');
        setTextAlignment('text', 'center');
        setObjectOrder('text', 99)
        setTextSize('text', 30);  
		if songName == 'rapidaum' then
            setTextFont('text', 'Comic.ttf'); 
        elseif songName == 'Kindness' then
            setTextFont('text', 'Arial.ttf');
            setTextColor('text', 'fbff00');
            setTextSize('text', 40);  
        end
        addLuaText('text')
    end
end