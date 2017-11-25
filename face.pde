void drawFace(int n) {
  pushMatrix();
  translate(0, -height/2, -width);
  fAg+=0.05;
  if (fAg>TWO_PI)fAg=0;
  rotateY(fAg);
  noStroke();
  if ( n==0) {
    for (int i=0; i<fc.size(); i++) {
      fc.get(i).display();
    }
  } else {
    for (int i=0; i<fc1.size(); i++) {
      fc1.get(i).display();
    }
  }
  popMatrix();
}

class fPoint {
  PVector pos;
  color cr;

  fPoint(float _x, float _y, float _z, color _cr) {
    pos = new PVector(_x, _y, _z);
    cr = _cr;
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);

    fill(cr);
    ellipse(0, 0, 2.5, 2.5);
    popMatrix();
  }
}