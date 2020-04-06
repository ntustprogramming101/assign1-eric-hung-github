int canvas_width=640,canvas_height=480;

int chunk_size=80;

int soldier_sp=2,soldier_posx=0,solider_posy;

int lifes_point=3,lifes_space=20,lifes_size=50;

int sun_innersize=120,sun_outersize=10;

int grass_height=15;

float  robot_posx,robot_posy;
float laser_height=10,laser_width=40,laserL_max=40,laser_range=2*chunk_size,laser_speed=1;
float laser_length=0,laser_pos=0;

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
	robot_posx=round(random(5)+1)*chunk_size;
	robot_posy=round(random(4)+1)*chunk_size;

	laser_length=10;
	laser_pos=robot_posx+25;

  	solider_posy=((int)random(2,6))*chunk_size;
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
    solider_posy=((int)random(2,6))*chunk_size;
		soldier_posx=-chunk_size;
	}
	image(solider_img, soldier_posx, solider_posy);

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
	image(robot_img,robot_posx,robot_posy);

	//Robot's shoot
	fill(255,0,0);
	if(laser_pos<=robot_posx-laser_range){
		laser_length=0;
		laser_pos=robot_posx+25;
	}else if(laser_length<laser_width){
		laser_length+=laser_speed;
		laser_pos-=laser_speed;
	}else{
		laser_pos-=laser_speed;
	}
	rect(laser_pos,robot_posy+37,laser_length,laser_height,laser_height/2);

}
