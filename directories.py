import os 
import shutil 
cur = os.getcwd();


try:
   shutil.rmtree("CSV")
except:
   print('Error while deleting directory')

try:
   shutil.rmtree("Input")
except:
   print('Error while deleting directory')
try:
   shutil.rmtree("White_mask")
except:
   print('Error while deleting directory')
try:
   shutil.rmtree("YOLO")
except:
   print('Error while deleting directory')
try:
   shutil.rmtree("YOLO_Players")
except:
   print('Error while deleting directory')



try:
    os.mkdir("CSV")
except OSError:
    print()
else:
    print("CSV Directory created")

try:
    os.mkdir("Input")
except OSError:
	print()
else:
	print("Input Directory created")


try:
    os.mkdir("White_mask")
except OSError:
	print()
else:
	print("White_mask Directory created")
	

try:
    os.mkdir("YOLO")
except OSError:
	print()
else:
	print("YOLO Directory created")
    
try:
    os.mkdir("YOLO_Players")
except OSError:
	print()
else:
	print("YOLO_Players Directory created")

    