PVector[] v;
int nodeNum;

int maxLoop = 10;
int loopIndex = 0;

float cutOffset =0.7;
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
    float o_w = cutOffset;
    float nb_w = 1-cutOffset;
    PVector[] tempV = new PVector[nodeNum*2];
    for(int i =0; i< nodeNum; i++){
        PVector o = v[i];
        PVector prev = i==0? v[nodeNum-1]: v[i-1];
        PVector next = i== nodeNum-1? v[0]: v[i+1];
        tempV[2*i] = new PVector(o.x*o_w+ prev.x* nb_w, 
                            o.y * o_w + prev.y * nb_w);
        tempV[2*i+1] = new PVector(o.x*o_w+ next.x* nb_w, 
                            o.y * o_w + next.y * nb_w);                  
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
