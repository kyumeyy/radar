ServerReceData = ""
ServerReceCnt = 0
ServerReceStat = false

function distance()
    gpio.write(Trig,1)    
    tmr.delay(10)
    gpio.write(Trig,0)
    local start_time=tmr.now()
    local stop_time=tmr.now()
    while gpio.read(Echo)==0
    do
        start_time=tmr.now()
    end
    while gpio.read(Echo)==1
    do
        start_time=tmr.now()
    end
    local distance=(start_time-stop_time)*34300/2000000
    return distance
end

for i=1,10000,1 do
    dis=distance()
    tmr.delay(1000000)
    print(dis)
end


local ClientSocket = nil   
Server = net.createServer(net.TCP,28800)    --创建服务，参数类型、超时
Server:listen(8888,function(socket)    --监听   
        ClientSocket=socket
        ClientSocket:on("receive",function(sck,data)    ---接收
            ServerReceData = ServerReceData..data
            ServerReceCnt = 0
            ServerReceStat = true
        end)
        ClientSocket:on("disconnection",function() ClientSocket=nil    --未连接
            print("\r\nDisconnec\r \n")
        end)

        ClientSocket:on("connection",function()   
            ClientSocket:send("connection ok") 
            ClientSocket:send("\n")            
       end)   
     
    end
)
tmr.create():alarm(10,1,function()
    if ServerReceStat==true then
        ServerReceCnt = ServerReceCnt+1
        
        if ServerReceCnt >= 10 then
            if ServerReceData=="open" then 
                ClientSocket:send("open ok")
                ClientSocket:send("\n")
            end
            if ServerReceData=="close" then 
                ClientSocket:send("close ok")
                ClientSocket:send("\n")
            end
            uart.write(0,ServerReceData)
            ServerReceData = ""
            ServerReceCnt = 0
            ServerReceStat = false
        end
    end
end)
