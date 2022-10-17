local time = 0
local zoom = 0
function onEvent(n, v1, v2)

	if n == "Zoom Camera" then
        setProperty("defaultCamZoom",v1);
    end
end
