local conta = 0
local spin = 360
local event1 = 0
local effect = 'linear';
local time = 0.1;
function onEvent(name, value1, value2)
	if name == "Endles Keys" then
        conta = conta+1
        event1 = (tonumber(value1))

        if conta % 2 == 0 then
            spin = 0
        else
            spin = 360
        end

        if songName == 'rapidaum' then
            spin = getRandomInt(0, 360)
            playSound('spin',1);
            triggerEvent("Add Camera Zoom",0.015,0.00)
            if event1 == 0 then
                spin = 0;
            end
        elseif songName == 'fastest-ratio' then
            triggerEvent("Add Camera Zoom",0.000,0.01)
            effect = 'circInOut';
            time = 0.2;
        end

        for i = 0,7 do
            noteTweenAngle(i, i, spin, time, effect)
        end
    end
end
