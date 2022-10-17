local anglevar = 30;
local efectbro = 'circIn';
local eventSC = false
local numevent = 0;
function onEvent(name, value1, value2)

	if name == "Screen Rotation" then
        numevent = tonumber(value1)
        if numevent == 0 then
            eventSC = false
            doTweenAngle('tt1', 'camGame', 360, 1, efectbro)
        elseif numevent == 1 then
            eventSC = true
        end
    end
end

function onStepHit()
    if eventSC == true then
        if curStep > 0 then
	        if curStep % 16 == 0 then
                doTweenAngle('tt1', 'camGame', anglevar, 1.3, efectbro)
            elseif curStep % 32 == 1 then
                doTweenAngle('tt1', 'camGame', -anglevar, 1.3, efectbro)
	        end
        end
    end
end