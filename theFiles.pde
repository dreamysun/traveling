PImage pic,pic1;
PImage filt;
float fAg;
ArrayList<fPoint> fc;
ArrayList<fPoint> fc1;

long glitchFrame;

ArrayList<Track> t;

float[] ea;
int cycNum = 24;
float Clr;

void initial() {
  pic = loadImage("2.png");
  pic1 = loadImage("1.png");
  pic.loadPixels();
  pic1.loadPixels();

  //speed = 1;
  t = new ArrayList<Track>();
  t.add(new Track(1, 3, 0));

  w2=width/2;
  h2= height/2;
  d2 = dist(0, 0, w2, h2);
  neuerStern= new star();

  ea = new float[cycNum];
  for (int i=0; i<cycNum; i++) {
    ea[i] = random(1);
  }

  Clr=0;

  fc = new ArrayList<fPoint>();
  for (int x=0; x<pic.width; x+=7) {
    for (int y=0; y<pic.height; y+=7) {
      color c = pic.get(x, y);
      float b = brightness(c);
      float z = map(b, 0, 255, 0, 100);
      if (alpha(c)>0)fc.add(new fPoint(x, y, z, c));
    }
  }
  
  fc1 = new ArrayList<fPoint>();
  for (int x=0; x<pic1.width; x+=7) {
    for (int y=0; y<pic1.height; y+=7) {
      color c = pic1.get(x, y);
      float b = brightness(c);
      float z = map(b, 0, 255, 0, 100);
      if (alpha(c)>0)fc1.add(new fPoint(x, y, z, c));
    }
  }

  filt=copy();
}

void LightOn() {
  //lights();
  pointLight(165, 120, 150, width/2, height*1.25, 200);  //under blue
  directionalLight(0, 0, 50, 0, 1, -1);
  directionalLight(50, 50, 50, 0, 0, -1);
  if (midiData[4][2]>80 || midiData[5][2]>80 || midiData[6][2]>80 || midiData[7][2]>80) {
    lightSpecular(0, 0, 255);
  }
  spotLight(255, 0, 255, width*0.5, -500, 200, 0, 1, 1, PI, 1);  
  spotLight(255, 0, 255, width*0.5, -500, -300, 0, 1, 0, PI/2, 2);  
  spotLight(255, 0, 255, width*0.5, -150, 300, 0, 1, 0, PI, 1);
}