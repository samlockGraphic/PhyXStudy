
float[] heights;
float[] temp;
int half_size = 5;
int grid_scale = 20;
int sphere_scale = 5;
int grid_size = 2*half_size;
void setup(){
  size(400, 300, P3D); 
  background(0);
  lights();
  
  heights =new float[grid_size* grid_size];
  temp =new float[grid_size* grid_size];
  
  for(int i =0; i< heights.length; i++){
     heights[i] = 0;
  }
  
  for(int i =1; i< grid_size-1; i++){
     for(int j =1; j< grid_size-1; j++){
        heights[i] = random(-40,40);
     }
   }
   for(int i =0; i< grid_size; i++){
     heights[i] = i*15;
  }
  frameRate(10);
}

void update(){
   
   for(int i =1; i< grid_size-1; i++){
     for(int j =1; j< grid_size-1; j++){
        temp[i*grid_size+j] = heights[i*grid_size+j+1];
        temp[i*grid_size+j] += heights[i*grid_size+j-1];
        temp[i*grid_size+j] +=heights[(i+1)*grid_size+j];
        temp[i*grid_size+j] +=heights[(i-1)*grid_size+j];
        temp[i*grid_size+j]*=0.25;
     }
   }
   for(int i =1; i< grid_size-1; i++){
     for(int j =1; j< grid_size-1; j++){
 
        heights[i*grid_size+j]=temp[i*grid_size+j];
     }
   }
}
void draw(){
  background(0);
  update();
  noStroke();
  pushMatrix();
  translate(width/2, height/3, 0);
  rotateX(-PI/10);
  rotateY(PI/4);
  
  for(int  i =-half_size; i<half_size; i++){
     for(int  j =-half_size; j<half_size; j++){
        float h =heights[(i+half_size)*grid_size+j+half_size];
      translate(i*grid_scale,h, j*grid_scale);
        sphere(sphere_scale);
      translate(-i*grid_scale, -h,-j*grid_scale);
   }
  }
  popMatrix();
  
  saveFrame();
}
