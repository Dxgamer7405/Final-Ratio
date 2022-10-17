local finalRatioVersion = '2.0 DEMO';
function onCreatePost()
	setObjectOrder('healthBar', 11)
	setObjectOrder('healthBarBG', 12)

	makeLuaText('beta', '-- FINAL RATIO '..finalRatioVersion..' --', -3, 0,0)
	setTextAlignment('beta', 'left')
	setTextSize('beta', 99999);  
	setObjectOrder('beta', 9999)
	setObjectCamera('beta', 'other')
	addLuaText('beta')
end