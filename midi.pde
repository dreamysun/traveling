import rwmidi.*;  

MidiInput mymididevice; 

int[][] midiData;
int pitch = 60;

void midiIni(){
  MidiInputDevice devices[] = RWMidi.getInputDevices();
  
    for (int i = 0; i < devices.length; i++) { 
      println(i + ": " + devices[i].getName()); 
    } 

  mymididevice = RWMidi.getInputDevices()[4].createInput(this); 
  
  midiData = new int[8][3];
}

//Note ON recieved 
void noteOnReceived(Note myreceivednote) {
    println("note on " + myreceivednote.getChannel() + "  " + myreceivednote.getPitch()+ "  " + myreceivednote.getVelocity());
    int cnum = myreceivednote.getChannel();
    
    midiData[cnum][0] = 1;
    midiData[cnum][1] = myreceivednote.getPitch();
    midiData[cnum][2] = myreceivednote.getVelocity();
    pitch = myreceivednote.getPitch();
    pitch = constrain(pitch,36,78);
    
    if(t.size()<20){     //mass number control
      float spp = constrain(map(midiData[cnum][2],10,100,1,15),1,15);
      if(cnum == 0 || cnum == 1){
        t.add(new Track(0,spp,pitch));   //wave
      }else if(cnum == 3 || cnum == 4 || cnum == 2){
        t.add(new Track(2,spp,pitch));   //triangle
      }else{
        t.add(new Track(3,spp,pitch));  //box
      }
    }
}

// Note Off recieved 
void noteOffReceived(Note myreceivednote) {
    println("note off " + myreceivednote.getChannel() + "  " + myreceivednote.getPitch()+ "  " + myreceivednote.getVelocity());
    midiData[myreceivednote.getChannel()][0] = 0;
    midiData[myreceivednote.getChannel()][1] = myreceivednote.getPitch();
    midiData[myreceivednote.getChannel()][2] = myreceivednote.getVelocity();
}

// Program Change recieved  
void programChangeReceived(ProgramChange pc) {
    println("note off " + pc.getChannel() + "  " + pc.getNumber());
  }

// Control Change recieved 
void controllerChangeReceived(Controller cc) {
  println("cc channell is: " + cc.getChannel() + "  " + "cc number is: " + cc.getCC() + "  " + "cc value is:  " + cc.getValue() );
}

// System Exclusive recieved 
void sysexReceived(SysexMessage msg) {
  println("sysex " + msg);
}