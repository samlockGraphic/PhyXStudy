PVector[] v;
int nodeNum;

int maxLoop =1;
int loopIndex = 0;

float w = 0.125;
void setup(){
  size(500,500);
  v = new PVector[10000];
  v[0] = new PVector(100,100);
  v[1] = new PVector(100,400);
  v[2] = new PVector(400,300);
  v[3] = new PVector(140,200);
  v[4] = new PVector(300,100);
 
  nodeNum = 5;

  frameRate(1);

}

void draw(){
  // Split
  if(loopIndex < maxLoop){
    loopIndex++;
    float w1 =0.5+w ;
    PVector[] tempV = new PVector[nodeNum*2];
    for(int i =0; i< nodeNum; i++){
        PVector o = v[i];
        PVector prev = i == 0? v[nodeNum-1]: v[i-1];
        PVector next = i == nodeNum-1? v[0]: v[i+1];
        PVector next_2 = i > nodeNum-3? v[i-nodeNum+2]: v[i+2];
        
        tempV[2*i] = o;
        PVector near_nb = new PVector( w1* (o.x + next.x), 
                                       w1* (o.y + next.y));
        PVector far_nb = new PVector(w * (prev.x + next_2.x), 
                                     w * (prev.y + next_2.y));
        
        tempV[2*i+1] = new PVector(near_nb.x - far_nb.x, 
                                   near_nb.y - far_nb.y );                  
    }  
    nodeNum*=2;
    for(int i =0; i< nodeNum; i++){
      v[i] = tempV[i];
    }
  }
  
  background(0);
  stroke(255);
  for(int i =0; i< nodeNum-1; i++){
    line(v[i].x, v[i].y, v[i+1].x, v[i+1].y);
  }  
  line(v[nodeNum-1].x, v[nodeNum-1].y, v[0].x, v[0].y);
  saveFrame();
}
