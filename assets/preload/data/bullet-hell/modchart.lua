local background = nil

function start (song)
	downscroll = false

	BlackBG = makeSprite('BlackFade','blackbg', true)
	WhiteBG = makeSprite('WhiteBG','whitebg', true)
	Fight = makeSprite('Fight','fight', true)

	setActorX(200,'whitebg')
	setActorY(500,'whitebg')
	setActorAlpha(0,'whitebg')
	setActorScale(4,'whitebg')

	setActorX(200,'fight')
	setActorY(200,'fight')
	setActorAlpha(0,'fight')
	setActorScale(1.5,'fight')

	setActorX(200,'blackbg')
    setActorY(500,'blackbg')
    setActorAlpha(1,'blackbg')
    setActorScale(4,'blackbg')
	
    setActorAlpha(0,'boyfriend')
	setActorAlpha(0,'dad')
	setActorAlpha(0,'girlfriend')
end

function update (elapsed)
	local currentBeat = (songPos / 1000)*(bpm/60)
	
	if zoom then
		setCamZoom(2)
	end

	if fightzoom then
	     setCamZoom(0.4)
	end
	
	if hide then
		for i=0,7 do
			setActorAlpha(0,i)
		end
	end

	if ghostwindow then
        setWindowPos(defaultWindowX + 64 * math.sin((currentBeat * 0.35) * math.pi), defaultWindowY + 64 * math.cos((currentBeat * 0.35) * math.pi))
    else 
        setWindowPos((getScreenWidth() / 2 - getWindowWidth() / 2),  (getScreenHeight() / 2 - getWindowHeight() / 2))
    end
	
	if swayingsmall then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat)) + 10, i)
		end
	end
	if swayingmedium then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*5)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*30)) + 10, i)
		end
	end
	if swayingrare then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*30)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 25 * math.cos((currentBeat + i*30)) + 20, i)
		end
	end
	if swayinglarge then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.cos((currentBeat + i*5) * math.pi),i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*30)) + 10, i)
		end
	end
	if swayingbiggest then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin((currentBeat + i*0)) + 350, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin((currentBeat + i*0)) - 275, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
    end
	if swayingbiggest2 then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin((currentBeat + i*0)) + 350, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin((currentBeat + i*0)) - 275, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
	end
	if swayingmove then
		for i=0,3 do
			setActorY(_G['defaultStrum'..i..'Y'] + 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
		for i=4,7 do
			setActorY(_G['defaultStrum'..i..'Y'] - 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
	end
	if spinhud then
	    for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
        for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'],i)
            setActorX(_G['defaultStrum'..i..'Y'],i)
        end
    end
		if swayingpog then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.5) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 28 * math.cos((currentBeat + i*0.5) * math.pi) + 10, i)
		end
	end
	if spinpog then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 95 * math.sin((currentBeat + i*40) * math.pi) + 20, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 90 * math.cos((currentBeat + i*20) * math.pi) + 10, i)
		end
	end
	if poggi then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 85 * math.sin((currentBeat + i*10) * math.pi) + 30, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 90 * math.cos((currentBeat + i*20) * math.pi) + 10, i)
		end
	end
	if spinnote then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 95 * math.cos((currentBeat + i*5) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] - 90 * math.sin((currentBeat + i*30) * math.pi), i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 95 * math.cos((currentBeat + i*5) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] - 90 * math.sin((currentBeat + i*30) * math.pi), i)
		end
	end
	if spinCrazy then -- spinning crazy
        camHudAngle = 32 * math.sin(currentBeat * math.pi)
        if getHudX() < 320 then
            setHudPosition(getHudX() + 4, 32 * math.cos(currentBeat * math.pi))
        else
            setHudPosition(-640, 32 * math.cos(currentBeat * math.pi))
        end
    end
	if spin then
        if getHudX() + 640 > 1280 and not hit then
            hit = not hit
            direction = 2 * directionMulti
        elseif hit then
            if getHudX() - 640 > -1280 and hit then
                direction = -2 * directionMulti
            else
                hit = not hit
                direction = 2 * directionMulti
            end
        end
        setHudPosition(getHudX() + direction, 32 * math.cos(currentBeat * math.pi) * heightMulti)
    end
	if normal1 then
        for i=0,3 do
            setActorX(_G['defaultStrum'..i..'X'],i)
            setActorY(_G['defaultStrum'..i..'Y'],i)
        end
    end
	if normal2 then
        for i=4,7 do
            setActorX(_G['defaultStrum'..i..'X'],i)
            setActorY(_G['defaultStrum'..i..'Y'],i)
        end
    end
	if finalduet then
        camHudAngle = 5 * math.cos(currentBeat)
	end
	if spinhud2 then
        camHudAngle = 9 * math.sin(currentBeat)
	end
	if noteswap then
	for i=1,2 do
			setActorY(_G['defaultStrum'..i..'Y'] - 100 * math.cos((currentBeat + i*100) * math.pi), i)
		end
		for i=5,6 do
			setActorY(_G['defaultStrum'..i..'Y'] - 100 * math.cos((currentBeat + i*100) * math.pi), i)
		end
	for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] - 100 * math.cos((currentBeat + i*20) * math.pi), i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 100 * math.cos((currentBeat + i*20) * math.pi), i)
		end
	end
	if noteswap2 then
	for i=1,2 do
			setActorY(_G['defaultStrum'..i..'Y'] - 100 * math.cos((currentBeat + i*100) * math.pi), i)
		end
		for i=5,6 do
			setActorY(_G['defaultStrum'..i..'Y'] - 100 * math.cos((currentBeat + i*100) * math.pi), i)
		end
	for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] - 100 * math.cos((currentBeat + i*5) * math.pi), i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 100 * math.cos((currentBeat + i*5) * math.pi), i)
		end
	end
	if notespin then
	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
	else
        	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'],i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        	end
	end
	if noteshake then
	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 50 * math.sin((currentBeat + i*1.25) * math.pi) + 10, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*3.25) * math.pi) + 10, i)
	end
	end
	if notewave then
	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 40 * math.sin((currentBeat + i*1.25)) + 20, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 40 * math.cos((currentBeat + i*3.25)) + 10, i)
	end
	end
	if notesans then
	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 90 * math.cos((currentBeat + i*50)) + 20, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 90 * math.cos((currentBeat + i*50)) + 20, i)
	end
	end
	if splitnote then
	for i=4,5 do
			setActorX(_G['defaultStrum'..i..'X'] + 200 * math.cos((currentBeat + i*50)) + 90, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 90 * math.cos((currentBeat + i*50)) + 0, i)
	end
	for i=6,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 100 * math.cos((currentBeat + i*50)) + 60, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 90 * math.cos((currentBeat + i*50)) + 0, i)
	end
	setActorX(100, 4)
	setActorX(200, 5)
	end
	if notemove then
	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin((currentBeat + i*0)) - 275, i)
	end
	end
	if center then
	for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 360, 0.4, 'setDefault')
    end
	end
	if lag1 then
	setActorX(100, 4)
	end
	if lag2 then
	setActorX(300, 5)
	end
	if lag3 then
	setActorX(600, 6)
	end
	if lag4 then
	setActorX(900, 7)
	end
	if lag5 then
	setActorX(500, 4)
	end
	if lag6 then
	setActorX(700, 5)
	end
	if normal3 then
	setActorX(400, 4)
	setActorX(500, 5)
	setActorX(600, 6)
	setActorX(700, 7)
	end
	if p1 then
	setActorX(800, 4)
	setActorX(900, 5)
	setActorX(1000, 6)
	setActorX(1100, 7)
	end
end


function beatHit (beat)
    if camerabeat then
	    setCamZoom(1)
	end
	if camerahit then
	    setCamZoom(2)
	end
	if camerahit2 then
	    setCamZoom(3)
	end
end

function stepHit (step)
    if step == 1 then
	setActorX(90, 4)
	setActorX(80, 5)
	tweenFadeIn('boyfriend',1,0.1)
	end
	if step == 62 then
	tweenFadeIn('dad',1,0.1)
	end
	if step == 123 then 
	zoom = false
	tweenFadeIn(WhiteBG,1,0.2)
	end
	if step == 127 then
	tweenFadeIn(WhiteBG,0,0.01)
	tweenFadeIn(BlackBG,0,0.01)
	tweenFadeIn('girlfriend',1,0.1)
	end
	if step == 267 then
	initBackgroundVideo('SansFight')
	setVideoSpritePos(getVideoSpriteX() + 300, getVideoSpriteY() + 200)
	setVideoSpriteScale(2)
	tweenFadeIn(BlackBG,1,0.01)
	tweenPosXAngle('dad', 70, 0, 0.6, 'dad')
	tweenPosYAngle('dad', 120, 0, 0.6, 'dad')
	tweenPosXAngle('boyfriend', 500, 0, 0.6, 'boyfriend')
	tweenPosYAngle('boyfriend', 200, 0, 0.6, 'boyfriend')
	tweenFadeIn('girlfriend',0,0.1)
	tweenFadeIn('dad',0,0.1)
	fightzoom = true
	setCamPosition(0)
	for i=0,3 do
		tweenFadeIn(i,0,0.01)
    end
	notesans = true
	showOnlyStrums = true
	end
	if step == 412 then
	for i = 0,7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 90,getActorAngle(i) + 360, 0.7, 'setDefault')
    end
	splitnote = true
	notesans = false
	end
	if step == 549 then
	for i = 0,7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0,getActorAngle(i) + 360, 0.7, 'setDefault')
    end
	setActorX(300, 4)
	setActorX(400, 5)
	splitnote = false
	end
	if step == 559 then
	for i = 0,7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0,getActorAngle(i) + 360, 0.4, 'setDefault')
    end
	notemove = true
	end
	if step == 832 then
	notemove = false
	lag1 = true
	end
	if step == 845 then
	lag2 = true
	lag1 = false
	end
	if step == 851 then
	lag3 = true
	lag2 = false
	end
	if step == 863 then
	lag4 = true
	lag3 = false
	end
	if step == 877 then
	lag5 = true
	lag4 = false
	end
	if step == 887 then
	lag6 = true	
	lag5 = false
	end
	if step == 894 then
	normal3 = true
	end
	if step == 959 then
	noteswap2 = true
	spinhud2 = true
	noteshake = true
	end
	if step == 1103 then
	notespin = true
	end
	if step == 1487 then
	tweenFadeIn(BlackBG,0,0.01)
	p1 = true
	tweenPosXAngle('dad', 0, 0, 0.6, 'dad')
	tweenPosYAngle('dad', 200, 0, 0.6, 'dad')
	tweenPosXAngle('boyfriend', 800, 0, 0.6, 'boyfriend')
	tweenPosYAngle('boyfriend', 700, 0, 0.6, 'boyfriend')
	tweenFadeIn('girlfriend',1,0.1)
	tweenFadeIn('dad',1,0.1)
	fightzoom = false
	spinhud2 = false
	noteshake = false
	notespin = false
	camHudAngle = 0
	for i=0,3 do
		tweenFadeIn(i,1,0.01)
    end
	showOnlyStrums = false
	end
end