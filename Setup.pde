public void colorA() {
  colour_index = 0;
}

public void colorB() {
  colour_index = 1;
}

public void colorC() {
  colour_index = 2;
}

public void colorD() {
  colour_index = 3;
}

public void colorE() {
  colour_index = 4;
}

public void colorF() {
  colour_index = 5;
}

public void save(){
  saveDXF = true;
}

//Reset -> Adjust 5 controllers to their initial value.
public void reset(){
  nlongitude=4;
  nmeridian=3;
  radius=20;
  sw=10;
  ir=1;
}


void gui() {
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera(); //setting up the camera view
  MyController.draw();
  g3.camera = currCameraMatrix;
}

//Colour Array Store in
void setupColours(){
  colours[0] = color(255, 0, 0);
  colours[1] = color(255, 219, 0);
  colours[2] = color(255, 153, 204);
  colours[3] = color(0, 255, 120);
  colours[4] = color(71, 163, 255);
  colours[5] = color(255,255,255);
}

//Buttons and Slider Setup.
void setupControllers(){
  
    MyController.addSlider("nlongitude")
    .setPosition(50,80)
    .setSize(10,20)
    .setRange(2,15)
    .setValue(nlongitude)
    .setWidth(200)
    .setNumberOfTickMarks(14)
    .setLabel("   Top");
     
     MyController.addSlider("nmeridian")
    .setPosition(50,130)
    .setSize(10,20)
    .setRange(3,10)
    .setValue(nmeridian)
    .setWidth(200)
    .setNumberOfTickMarks(8)
    .setLabel("   Side");
     
     MyController.addSlider("radius")
    .setPosition(50,180)
    .setSize(10,20)
    .setRange(5,20)
    .setValue(20)
    .setWidth(200)
    .setLabel("   Size");
    
     MyController.addSlider("sw")
    .setPosition(50,220)
    .setSize(10,20)
    .setRange(1,30)
    .setValue(sw)
    .setWidth(200)
    .setLabel("   Stroke Width");
    
    MyController.addSlider("ir")
    .setPosition(50,260)
    .setSize(10,20)
    .setRange(1,4)
    .setValue(1)
    .setWidth(200)
    .setLabel("   Inner Radius");
     
    MyController.addButton("save")
    .setPosition(50,450)
    .setSize(150,60)
    .setValue(0)
    .setWidth(200)
    .setLabel("Save DFX File");
    
    MyController.addButton("colorA")
     .setValue(0)
     .setPosition(50,300)
     .setSize(60,60)
     .setColorBackground(colours[0])
     .setLabel("RED");
     
     MyController.addButton("colorB")
     .setValue(0)
     .setPosition(120,300)
     .setSize(60,60)
     .setColorBackground(colours[1])
     .setColorLabel(color(0,0,0))
     .setLabel("YELLOW");
     
     MyController.addButton("colorC")
     .setValue(0)
     .setPosition(50,370)
     .setSize(60,60)
     .setColorBackground(colours[2])
     .setLabel("PINK");
     
     MyController.addButton("colorD")
     .setValue(0)
     .setPosition(120,370)
     .setSize(60,60)
     .setColorBackground(colours[3])
     .setColorLabel(color(0,0,0))
     .setLabel("GREEN");
     
      MyController.addButton("colorE")
     .setValue(0)
     .setPosition(190,300)
     .setSize(60,60)
     .setColorBackground(colours[4])
     .setLabel("BLUE");
     
      MyController.addButton("colorF")
     .setValue(0)
     .setPosition(190,370)
     .setSize(60,60)
     .setColorBackground(colours[5])
     .setColorLabel(color(0,0,0))
     .setLabel("WHITE");
     
     MyController.addButton("reset")
    .setPosition(190,520)
    .setSize(60,30)
    .setValue(0)
    .setWidth(60)
    .setLabel("reset");
}
