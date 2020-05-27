import numpy as np
import cv2 as cv
'''
array1=np.ones((3,4))
print(array1)
array2=np.linspace(3,4,5)
print(array2)
array3=np.zeros((3,4))
print(array3)
'''
#opencv显示图像
img=cv.imread('C:\\Users\mwy\\PycharmProjects\\radar\\tests\\test.jpg')
gray=cv.cvtColor(img,cv.COLOR_BGR2GRAY)
print(gray.shape)
for i in range(417):
    for j in range(500):
        gray[i][j]=gray[i][j]**0.9
print(gray)
cv.imshow('',gray)
cv.waitKey(0)
cv.destroyWindow()
'''
#摄像头捕捉
cap=cv.VideoCapture(0)
while(True):
    ret,frame=cap.read()
    gray=cv.cvtColor(frame,cv.COLOR_BGR2GRAY)
    print(gray)
    cv.imshow('frame',gray)
    if cv.waitKey(1) & 0xFF ==ord('q'):
        break
cap.release()
cv.destroyWindow()
'''