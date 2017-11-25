class Box{
  float ag = random(0.03,0.15);
  float sag = 0;
  float clr = random(120,210);
  PVector ps = new PVector(0,0,0);
  PVector rn;
  float szz; // = random(28,64)*width/1920;
  int id = int(random(2,50));
  float alp = 100;
  Box(float pth){
    rn = new PVector(random(5,15),random(0.5,2.5),random(0.5,2));
    szz = (100-random(pth-10,pth+10))*width/1920;
    if(random(1)<0.5)rn.x*=-1;
    if(random(1)<0.5)rn.y*=-1;
    if(random(1)<0.5)ag*=-1;
  }
  
  void update(){
    sag += ag;
    if(sag>TWO_PI)sag=0;
    
    ps.add(rn.mult(1.005));
  }
  
  void display(){
    update();
    shininess(random(3,6));
    noStroke();
    pushMatrix();
    translate(ps.x,ps.y,ps.z);
    if(midiData[2][2]>86)alp=255;
    alp*=0.98;
    alp=constrain(alp,150,255);
    fill(clr,155,alp);
    rotateX(sag);
    rotateY(sag);
    rotateZ(sag);
    box(szz);
    popMatrix();
  }
}