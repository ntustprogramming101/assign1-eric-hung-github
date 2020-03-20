int canvas_width=640,canvas_height=480;

int chunk_size=80;

int soldier_sp=2,soldier_posx=0;

int lifes_point=3,lifes_space=20,lifes_size=50;

int sun_innersize=120,sun_outersize=10;

int grass_height=15;

float  robot_posx,robot_posy;
float laser_height=10,laserL_max=40,laser_range=2*chunk_size,laser_speed=2;
float laser_length,laser_pos;

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

	//intialize Robot's position by randon
	robot_posx=ceil(random(6)+2);
	robot_posy=ceil(random(4)+2);

	laser_length=10;
	laser_pos=0;
}

void draw() {
	//set backGround
	background(backg_img);
	//set Soil
	image(soil_img,0,chunk_size*2);
	
	//set Life
	for (int i = 0; i < lifes_point; i++) {
		image(life_img,10+i*(lifes_space+lifes_size),10);
	}
	
	//set walkingSoilder
	soldier_posx+=soldier_sp;
	if(soldier_posx>=canvas_width){
		soldier_posx=-chunk_size;
	}
	image(solider_img, soldier_posx, canvas_height/3);

	//set Sun
	fill(255,255,0);
	circle(canvas_width-50,50,sun_innersize+sun_outersize);
	fill(253,184,19);
	circle(canvas_width-50,50,sun_innersize);

	//set Grass
	fill(124,204,25);
	rect(0, 2*chunk_size-grass_height, canvas_width, grass_height);

	//set Groundhog
	image(groundhog_img,canvas_width/2-chunk_size/2,chunk_size);

	//set Robot
	image(robot_img,robot_posx*chunk_size,robot_posy*chunk_size);

	//Robot's shoot
	fill(255,0,0);
	ellipse(robot_posx*chunk_size-laser_pos+25,robot_posy*chunk_size+37,laser_length,laser_height);
	laser_pos+=2;
	laser_length=laser_pos/(2*chunk_size+25)*40;
	if(laser_pos>2*chunk_size+25){
		laser_pos=0;
		laser_length=10;
	}
}
