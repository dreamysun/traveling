void backCycle(){
  //fft.forward(life.mix);
  
  noFill();
  pushMatrix();
  translate(width/2,height*0.35,width*0.4);
  rotateX(-PI*0.5);
  for(int i=0; i<9; i++){
    stroke((Clr+i*5)%100+120,155,255);
    strokeWeight(3-(i+1)*0.18);
    float sz = (i+1)*width*constrain(map(pitch,36,78,0.01,0.035),0.01,0.035);
    ellipse(0,0,sz,sz);
  }
  popMatrix();
  
  pushMatrix();
  translate(width/2,height*0.65,width*0.4);
  rotateX(PI*0.5);
  for(int i=0; i<9; i++){
    stroke((Clr+i*5)%100+120,155,255);
    strokeWeight(3-(i+1)*0.18);
    float sz = (i+1)*width*constrain(map(pitch,36,78,0.01,0.035),0.01,0.035);
    ellipse(0,0,sz,sz);
  }
  popMatrix();
  
}