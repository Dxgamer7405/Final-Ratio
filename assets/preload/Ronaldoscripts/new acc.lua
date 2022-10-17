function onUpdate()
    local score = 'SCORE: ' .. getProperty('songScore');
    local miss = '\nMISSES: ' .. getProperty('songMisses');
    local rating = '\nRATING: ' .. getProperty('ratingName');
    local ratingP = math.floor(getProperty('ratingPercent')* 100);
    local ratingFC = getProperty('ratingFC');

    local acc = {score, miss, rating, '\n('..ratingP.. '%)', ' - ' .. ratingFC};

    -- criando font
    makeLuaText('acc', acc[1] .. acc[2] .. acc[3] .. acc[4] .. acc[5],
                getProperty('scoreTxt.width'), getProperty('scoreTxt.x'),
                getProperty('scoreTxt.y') - 250);
    setTextSize('acc', 40);
    setObjectCamera('acc', 'other');
    setTextAlignment('acc', 'left');
    setObjectOrder('acc', getObjectOrder('scoreTxt'));
    setTextWidth('acc', getProperty('scoreTxt.width'));
    setTextFont('acc', 'Sonic Advanced 2.ttf');
    addLuaText('acc');

	setObjectOrder('acc', 0)
end

function goodNoteHit() end
