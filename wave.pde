

void Wave(float x, float a,float y, float w){  //w: speed related scale degree
  stroke(255);
  strokeWeight(a*0.25);
  for(int i=0; i<1024; i++){
   float z1 = map(i, 0, 1024, 0, width);
   float z2 = map(i+1, 0, 1024, 0, width);
   float waveY = sin(a+i*0.01)*100;
   line((noise(i)-0.5)*x, waveY + noise(i,a+i*0.01,0)*w+y,z1-width-500,(noise(i)-0.5)*x, waveY + noise(i+0.1,a+i*0.01,0)*w+y,z2-width-500);
  }
  
}