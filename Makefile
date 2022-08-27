
t_input:
	py directories.py
	matlab -nosplash -r "Take_Input"
	echo("Taking Input")

run :
	py Player_detection.py
	echo("Detecting Players")
	
	py Mask_Circle.py
	echo("Masking Circle");
	
	py Mask_Line.py
	echo("Masking Line");


matl:
	matlab -nosplash -r "TeamSelection"
	echo("Detecting Teams")

	matlab -nosplash -r "Line_detecttion"
	echo("Detecting Line");

	matlab -nosplash -r "circle_detection"
	echo("Detecting Circle")

transform:
	matlab -nosplash -r "Projection"
	echo("Projecting")
