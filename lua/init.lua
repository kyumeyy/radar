Ctrl=1
Trig=2
Echo=3
gpio.mode(Ctrl, gpio.OUTPUT)
pwm.setup(Ctrl,1000/19,1.5/20*1023)    --管脚，频率，占空比

gpio.mode(Trig, gpio.OUTPUT) 
gpio.mode(Echo, gpio.INPUT) 

wifi.setmode(wifi.STATION)     --wife设置为站模式 
APConfig={
    ssid="TP-LINK_770A",
    pwd="!?(561197638)qwer#"    --指定wife账号和密码
}
ipinfo={
    ip="192.168.1.111",
    netmask="255.255.255.0",
    gateway="192.168.1.1"    --配置ip、子网掩码和网关
}
wifi.sta.setip(ipinfo)
wifi.sta.config(APConfig)
wifi.sta.autoconnect(0)    --连接路由器

duty=1.5/20*1023

tmr.create():alarm(5000, 0, function()
    print(duty)
    --dofile("tcpserver.lua")    --调用服务器程序
end)
pwm.start(Ctrl)
