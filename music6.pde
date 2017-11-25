
void setup(){
  size(960,540,P3D);
  colorMode(HSB);
  imageMode(CENTER);
  
  frameRate(60);
  noStroke();
  initial();
  //musicIni();
  midiIni();
}

void draw(){
  background(0);
  
  LightOn();
  
  backCycle();
  
  backStar();
  
  Clr+=1;
  if(Clr>200)Clr=100;
  
  for(int i=0; i<t.size(); i++){
    Track tt = t.get(i);
    if(tt.dispear()){
      if(tt.type==1){
        tt.ini();
      }else{
        t.remove(i);
      }
    }else{
      tt.display();
    }
  }
  
  //if(frameCount%150==0){
  //  filt=copy();
  //}
  
    if((midiData[0][2]<60 || midiData[1][2]<60 || midiData[3][2]<60) & frameCount-glitchFrame>50){
      glitchFrame=frameCount;
      filt=copy();
    }
  
  if(frameCount-glitchFrame<10){
    blend(filt,int(random(-30,30)),0,width,height,0,0,width,height,EXCLUSION);
  }else if(frameCount-glitchFrame<20){
    blend(filt,int(random(-30,30)),0,width,height,0,0,width,height,DIFFERENCE);
  }
}