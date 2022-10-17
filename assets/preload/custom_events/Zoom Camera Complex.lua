local time = 0
local zoom = 0
function onEvent(n, v1, v2)

	if n == "Zoom Camera Complex" then
        zoom = tonumber(v1)
        time = tonumber(v2)
        doTweenZoom('zoom1', 'camGame', zoom, time, 'linear');
        runTimer('zoom2', time);
    end
end


function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'zoom2' then
        setProperty("defaultCamZoom",zoom);
    end
end