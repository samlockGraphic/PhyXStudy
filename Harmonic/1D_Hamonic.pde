
int nodeNum= 8;
float[] node = new float[nodeNum];
void setup() {
  size(300, 360);
  frameRate(5);
  colorMode(RGB, 255, 255, 255, 100);
  node[0] =300;
  node[nodeNum-1] = 0;
   for(int i = 1; i< nodeNum-1; i++){
   
      node[i]  =300;
  }
  
  
}

void draw() {
  background(0);
  update();
  fill(255);
  ellipse(30+0*30,20+node[0],10,10);
  ellipse(nodeNum*30,20+node[nodeNum-1],10,10);
  fill(100);
  for(int i = 1; i< nodeNum-1; i++){
    ellipse(30+i*30,20+node[i],10,10);
  }
  
}
void update(){
  float newPos[] = new float[nodeNum];
  
   for(int i = 1; i< nodeNum-1; i++){
   
      newPos[i] = (node[i-1]+node[i+1])*0.5;
  }
    for(int i = 1; i< nodeNum-1; i++){
   
      node[i] = newPos[i];
  }
  
}
