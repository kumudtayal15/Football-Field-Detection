import cv2
import numpy as np
from matplotlib import pyplot as plt
import os
from os import listdir

folder_dir = './Input';
for images in os.listdir(folder_dir):
    path_in=folder_dir+"/"+images;
    image = cv2.imread(path_in);
    hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
    sensitivity = 120;
    lower_white = np.array([0,0,255-sensitivity])
    upper_white = np.array([255,sensitivity,255])
    mask = cv2.inRange(hsv, lower_white, upper_white)
    imask = mask>0
    green = np.zeros_like(image, np.uint8)
    green[imask] = image[imask]
    output="White_mask/L_"+images;
    cv2.imwrite(output,green);