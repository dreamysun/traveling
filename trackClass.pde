class Track{
  PVector pos;
  float sp;
  float ag;
  int type;
  Box[] bx;  //a group of balls of type 3
  Tri[] tg;
  float sY;
  float speed;
  float pth;
  int faceNum;
  float rx;
  
  Track(int _t, float _speed, float _pth){
    ag = random(3);
    type = _t;
    speed = _speed;
    pth = _pth;
    if(type == 3){
      bx = new Box[int(pth)/10];  //a group of balls of type 3\
    }else{
      bx = new Box[0]; 
    }
    if(type==2){
      tg = new Tri[int(pth)/10];
    }else{
      tg = new Tri[0];
    }
    ini();
  }
  
  void ini(){
    rx = random(10,100);
    pos = new PVector(random(0.02,0.4)*width,random(0.4,0.6)*height,-500*width/1920);
    if(random(1)<0.5){
      pos.x = width/2+pos.x;
    }else{
      pos.x = width/2-pos.x;
    }
    faceNum = int(random(2));
    sp = random(2,6);
    for(int i=0; i<bx.length; i++){
      bx[i] = new Box(pth);
    }
    for(int i=0; i<tg.length; i++){
    tg[i] = new Tri(width*random(0.2,0.5)*0.15,TWO_PI*i/6,color(random(120,210),155,255,200),pth);
    }
    sY = random(-0.35,0.35)*height;
  }
  
  void update(){
    if(type == 1){
      speed = midiData[0][2]/10;
    }
    
    ag += speed/50;
    if(ag>TWO_PI)ag=0;
    
    pos.z += speed*sp;
    
    //if(pos.z>width*1.5)ini();
    
  }
  
  boolean dispear(){
    if(pos.z>width*1.5){
      return true;
    }else{
      return false;
    }
  }
  
  void display(){
    update();
    
    pushMatrix();
  
    translate(pos.x,pos.y,pos.z);
    
    if(type==0){
      Wave(rx,ag,sY,speed);
    }else if(type==1){
      drawFace(faceNum);
    }else if(type==2){
      for(int i=0; i<tg.length; i++){
        tg[i].display();
      }
    }else{
      //beat.detect(life.mix);
      for(int i=0; i<bx.length; i++){
        bx[i].display();
      }
    }
    popMatrix();
  }
}