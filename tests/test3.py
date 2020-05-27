import numpy as np
import matplotlib.pyplot as plt
data=np.array([1,2,3,4,5,6,7,8])
angles=np.linspace(0,2*np.pi,8)     #0,-2*pi
data=np.concatenate((data,[data[0]]))    #连接两个数组
angles=np.concatenate((angles,[angles[0]]))
print(angles)
fig=plt.figure()
ax=fig.add_subplot(111,polar=True)    #极坐标
ax.plot(angles,data,'r',linewidth=2)
ax.grid(True)    #绘制网格
ax.set_title('扫描图',va='bottom',fontproperties='SimHei')
plt.savefig('radar.png')


plt.show()