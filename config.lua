

Config = {}

--EFFECTS

-- I personally prefer DeathFailOut or Rampage buy you can use any screen effect.
Config.ScreenEffect = 'Rampage'

-- I have no idea about the limit this number can be, i use 0.5 as a basemark and you can go up or down from there.
Config.ScreenShakeStrenght = 0.5

--BLEEDING

--At what amount of hp should bleeding start
Config.WhenToStart = 80 -- 100 = full hp, 50 = half hp etc.

--Seconds how often hp is reduced
Config.HowOftenRemove = 10

--How much hp to remove per above amount of time
Config.HPToRemove = 3

-- NOTIFICATION SETTINGS

Config.NotifyType = 'esx' -- 'esx', 'okok' or 'ox_lib'

--Notification when initially player gets hurt
Config.GotHurtMessage = "Go to the hospital to get treated."

--Notification when player keeps bleeding
Config.StillHurtMessage = "You are still bleeding!"



--DEVELOPING (ONLY USE IF YOU KNOW WHAT YOU ARE DOING)

--At what amount of hp should bleeding stop (DONT TOUCH IF YOU DONT KNOW WHAT YOU ARE DOING!)
Config.WhenToStop = 101 + Config.WhenToStart




