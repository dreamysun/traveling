class Tri{
  float ds;
  float stAng;
  PVector ptx,pty;
  color cc;
  float sz;
  float ang;
  float rot;
  
  
  Tri(float _ds, float _stAng, color _cc, float pth){
     ds = _ds;
     ang = 0;
     stAng = _stAng;
     rot = constrain(map(pth,36,78,0.02,0.5),0.02,0.5)*random(0.75,1.25);
     if(random(1)<0.5)rot*=-1;
     //sz = ds*random(0.5,1.25);
     sz = ds*random(0.5,1.25)*(100-random(pth-10,pth+10))/100;
     ptx = new PVector(random(sz*0.2,sz),random(-sz*0.75,sz*0.75),random(-sz,-sz*0.2));
     pty = new PVector(random(-sz,sz/2),random(sz*0.75),random(-sz,sz/2));
     cc = _cc;
  }
  
  void display(){
     noStroke();
     pushMatrix();
     translate(cos(stAng)*ds*0.8,sin(stAng)*ds*0.8);
     rotate(ang);
     if(millis()%int(50*(stAng+1))<int(50*(stAng+1))/2){
       fill(cc);
     }else{
       fill(255);
     }
     triangle(ptx.x,pty.x,ptx.y,pty.y,ptx.z,pty.z);
     popMatrix();
         
     ang+=rot;  //which is the main channel
    
  }
}