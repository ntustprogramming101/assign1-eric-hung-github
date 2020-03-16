int canvas_width=640,canvas_height=480;
int soldier_sp=2,soldier_posx=0;
int lifes_point=3;

PImage backg_img;
PImage groundhog_img;
PImage life_img ;
PImage robot_img ;
PImage soil_img ;
PImage solider_img ;

void setup() {
	size(640, 480, P2D);

	backg_img =loadImage("img\\bg.jpg");
	groundhog_img =loadImage("img\\groundhog.png");
	life_img =loadImage("img\\life.png");
	robot_img =loadImage("img\\robot.png");
	soil_img =loadImage("img\\soil.png");
	solider_img =loadImage("img\\soldier.png");

	
	
}

void draw() {
	background(backg_img);
	image(soil_img,0,canvas_height/2);
	for (int i = 0; i < lifes_point; i++) {
		image(life_img,(0.9-0.1*i)*canvas_width,0.03*canvas_height);
	}
	
	soldier_posx+=soldier_sp;
	if(soldier_posx>=canvas_width){
		soldier_posx=0;
	}
	image(solider_img, soldier_posx, canvas_height/3);
	
}