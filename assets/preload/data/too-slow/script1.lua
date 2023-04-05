--easy configs--
missLimit = 5 --este es el límite de fallos, si pones el valor 0 morirás instantáneamente, así que no pongas 0
cantDie = false --si el valor es true, solo puedes morir por el límite de fallos
showHealthBar = true --si el valor es false no se mostrará la barra de salud
textSize = 30 --el tamaño de texto


--da code--
function onCreate()
	makeLuaText('mundoDeElSida', 'Miss limit:', 300, 20, 670)
	setTextAlignment('mundoDeElSida', 'left')
	setObjectCamera('mundoDeElSida', 'hud')
	setTextSize('mundoDeElSida', textSize)
	setProperty('mundoDeElSida.alpha', 0)
	addLuaText('mundoDeElSida')

	makeLuaText('SidaTotal', missLimit, 300, 230, 670)
	setTextAlignment('SidaTotal', 'left')
	setObjectCamera('SidaTotal', 'hud')
	setTextSize('SidaTotal', textSize)
	setProperty('SidaTotal.alpha', 0)
	addLuaText('SidaTotal')
end

function onUpdate()
	if misses >= missLimit then
		setProperty('health', 0)
	end
	if cantDie == true then
    	if getProperty('health') <= 0.1 then
      	  setProperty('health', 0.025)
    	end
	end
	if showHealthBar == false then
		setProperty('healthBarBG.visible', false)
		setProperty('healthBar.visible', false)
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
	end
end

function onSongStart()
	doTweenAlpha('mundoDeElSidaTween', 'mundoDeElSida', 1, 0.5, linear)
	doTweenAlpha('SidaTotalTween', 'SidaTotal', 1, 0.3, linear)
end
