import matlab.engine
import subprocess
import cv2
import matplotlib.pyplot as plt


eng = matlab.engine.start_matlab();

print("Cleaning Directories")
subprocess.call("py directories.py",shell = True);
print("Directories Cleaned");

print("=========================================================================================")

print("Taking Input");
tf = eng.Take_Input(nargout=0);
print("=========================================================================================")

print("Detecting Players");
subprocess.call("py PLayer_detection.py",shell = True);
print("Players Detected");
print("=========================================================================================")

print("Masking For Circle")
subprocess.call("py Mask_Circle.py",shell = True);
print("Circle Masked");
print("=========================================================================================")

print("Masking For Line")
subprocess.call("py Mask_Line.py",shell = True);
print("Line Masked");
print("=========================================================================================")

print("Detecting For Teams");
tf = eng.TeamSelection(nargout=0);
print("Teams Detetcted");
print("=========================================================================================")


print("Detecting Circle");
tf = eng.circle_detection(nargout=0);
print("Circles Detetcted");
print("=========================================================================================")

print("Detecting Line");
tf = eng.Line_detecttion(nargout=0);
print("Line Detetcted");
print("=========================================================================================")

print("Projecting");
tf = eng.Projection(nargout=0);
print("Projected");
print("=========================================================================================")


img1 = cv2.imread("Input/input.png");
img2 = cv2.imread("Output/Topview.png");

plt.subplot(121)
plt.imshow(img1)
plt.title("Input")
 
plt.subplot(122)
plt.imshow(img2)
plt.title("Output")

plt.show()