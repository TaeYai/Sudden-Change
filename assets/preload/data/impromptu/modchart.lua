local background = nil
local normal1 = false
local normal2 = false

function start (song)
    hudX = getHudX()
    hudY = getHudY()

	WhiteBG = makeSprite('WhiteBG','whitebg', true)
	BlackBG = makeSprite('BlackFade','blackbg', true)
	WhiteFade = makeSprite('WhiteBG','whitefade', false)
	BlackFade = makeSprite('BlackFade','blackfade', false)
	YellowBG = makeSprite('YellowBG','yellowbg', true)


	setActorX(200,'whitebg')
	setActorY(500,'whitebg')
	setActorAlpha(0,'whitebg')
	setActorScale(4,'whitebg')

	setActorX(200,'yellowbg')
	setActorY(500,'yellowbg')
	setActorAlpha(0,'yellowbg')
	setActorScale(4,'yellowbg')

	setActorX(200,'blackbg')
	setActorY(500,'blackbg')
	setActorAlpha(0,'blackbg')
	setActorScale(4,'blackbg')
	
	setActorX(200,'blackfade')
	setActorY(500,'blackfade')
	setActorAlpha(0,'blackfade')
	setActorScale(4,'blackfade')
	
	setActorX(200,'whitefade')
	setActorY(500,'whitefade')
	setActorAlpha(0,'whitefade')
	setActorScale(4,'whitefade')

	setActorAlpha(1,'boyfriend')
	setActorAlpha(1,'dad')
	setActorAlpha(1,'girlfriend')
	for i = 0, 3 do 
        setActorX(1300, i)
    end
	for i = 4, 7 do 
        setActorX(1300, i)
    end
	for i = 4,7 do -- go to the center
        tweenPosYAngle(i, _G['defaultStrum'..i..'Y'] - 1300,getActorAngle(i) + 360, 0.7, 'setDefault')
    end
	showOnlyStrums = true
end




local spinCrazy = false


function update (elapsed)
	local currentBeat = (songPos / 1000)*(bpm/60)
	hudX = getHudX()
    hudY = getHudY()
	
	if zoom then
		setCamZoom(2)
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
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*1)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*1)) + 10, i)
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
end

function beatHit (beat)
    if camerabeat then
	    setCamZoom(1)
	end
end

function fadeInAndGo()
	move = false
    for i=0,3 do
		tweenFadeIn(i,1,0.6)
		showOnlyStrums = false
    end
	for i = 4, 7 do
		tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 275, getActorAngle(i) - 360, 0.6, 'setDefault')
	end
end

function fadeOutAndGo() 
	move = false
    for i=0,3 do
		tweenFadeIn(i,0,0.6)
    end
	for i = 4, 7 do
		print('tween x ang')
		tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 360, 0.6, 'setDefault')
	end
	tweenFadeIn('girlfriend', 0, 0.6)
end


function stepHit (step)
    if step == 57 then
	for i = 0,1 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0,getActorAngle(i) + 360, 0.7, 'setDefault')
    end
	showOnlyStrums = false
	end
	if step == 59 then
	for i = 2,3 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0,getActorAngle(i) + 360, 0.7, 'setDefault')
    end
	end
	if step == 117 then
	for i = 4,7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0,getActorAngle(i) + 360, 0.7, 'setDefault')
    end
	for i = 4, 7 do 
        tweenPosYAngle(i, _G['defaultStrum'..i..'Y'] - 0,getActorAngle(i) + 360, 0.7, 'setDefault')
    end
	end
	if step == 456 then 
	setCamZoom(2)
	end
	if step == 459 then 
	setCamZoom(2)
	end
	if step == 473 then 
	setCamZoom(2)
	end
	if step == 475 then 
	setCamZoom(2)
	end
	if step == 478 then 
	setCamZoom(2)
	end
	if step == 659 then
	for i = 6, 7 do 
        tweenPosYAngle(i, _G['defaultStrum'..i..'Y'] - -80,getActorAngle(i) + 720, 0.4, 'setDefault')
    end
	end
	if step == 662 then
	for i = 4, 5 do 
        tweenPosYAngle(i, _G['defaultStrum'..i..'Y'] - 0,getActorAngle(i) + 720, 0.4, 'setDefault')
    end
	end
	if step == 672 then
	for i = 6, 7 do 
        tweenPosYAngle(i, _G['defaultStrum'..i..'Y'] - 0,getActorAngle(i) + 720, 0.4, 'setDefault')
    end
	end
	if step == 1022 then
	spinnote = false
	swayingmove = false
	for i = 0,7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0,getActorAngle(i) + 360, 0.7, 'setDefault')
		tweenPosYAngle(i, _G['defaultStrum'..i..'Y'] - 0,getActorAngle(i) + 360, 0.7, 'setDefault')
    end
	end
	if step == 1157 then
	for i=0,7 do
		tweenFadeIn(i,0,0.4)
    end
	end
end