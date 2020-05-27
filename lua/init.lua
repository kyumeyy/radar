Ctrl=1
Trig=2
Echo=3
gpio.mode(Ctrl, gpio.OUTPUT)
--pwm.setup(Ctrl,1000/19,1.5/20*1023)    --管脚，频率，占空比

pwm.setup(Ctrl,50,65)

gpio.mode(Trig, gpio.OUTPUT) 
gpio.mode(Echo, gpio.INPUT) 

for k=1,10,1 do
    for i=1,10,1 do
        pwm.setduty(Ctrl,1.35/20*1023)    --65
        pwm.start(Ctrl)
        tmr.delay(200000)
        pwm.stop(Ctrl)
        print(i)
    end
    for j=1,10,1 do
        pwm.setduty(Ctrl,1.65/20*1023)    --86
        pwm.start(Ctrl)
        tmr.delay(200000)
        pwm.stop(Ctrl)
        print(j)
    end
end
