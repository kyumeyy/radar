import numpy as np
import cv2 as cv

img=np.zeros((700,700,3),np.uint8)

white=(255,255,255)

cv.circle(img,(350,350),100,white,2)
cv.line(img,(0,350),(700,350),white,5)
cv.line(img,(350,0),(350,700),white,5)
cv.rectangle(img,(300,400),(400,300),white,2)

def scan(ang):
    img=np.zeros((700,700,3),np.uint8)
    cv.ellipse(img,(350,350),(100,300),1,ang,ang-10,white
               ,3)
    return img

ang=0
while(True):
    ang=ang+1
    scanimg=scan(ang)
    blend=cv.addWeighted(img,1,scanimg,0.6,0.0)
    cv.imshow('aaa',blend)
    if cv.waitKey(100)==27:
        break
cv.destroyWindow('aaa')