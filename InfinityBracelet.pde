import peasy.*;
import controlP5.*;
import processing.dxf.*;

PMatrix3D currCameraMatrix;
PGraphics3D g3;
ControlP5 MyController;

PeasyCam cam; //PeasyCam is a library that allows me to rotate, zoom and drag object in 3 dimensional environment

PVector[][] globe;

boolean saveDXF = false;
boolean reset =false;
int total = 1000; //total will determine ammount of points, more points makes the line more fine.

float nmeridian  = 3;
float nlongitude = 4;

float radius = 70; //overall radius or size of the model
float sw=10;  //sw stands for Stroke Width
float ir=1;  //ir stands for Inner Radius

//Colour Array
color[] colours = new color[6]; 
int colour_index = 0;

void setup(){
    size(1080,720, P3D);
    cam = new PeasyCam(this, 100);
    g3 = (PGraphics3D)g;
    
    //setting up
    globe = new PVector[total+1][1];
    
    //Display Controller such as buttons and sliders. (from ControlP5 library).
    MyController = new ControlP5(this);
    setupColours(); //colours array set up
    setupControllers();
    MyController.setAutoDraw(false);  
}

void draw(){
  
  background(0);
  lights();
   
   //Start record the curve and export it as DXF
   if(saveDXF == true){
    beginRaw(DXF, "data/myDesign.dxf");
   }
   
   stroke(255);
   
   //"i" value, keep adding until it reach total, which is 1000
   //"i" will be used to create all the points of the knot curve
   for(int i = 0; i <= total; i++){
     
     ///////////////////////////////// Code Limitations bug fix.
     if(nlongitude%nmeridian==0){
       nlongitude--;
     }
     if(nmeridian%nlongitude==0){ 
       nmeridian--;}
     
     //This code needed to update if there is any changes of value of the controller
     //which means required to run the reset button
     MyController.getController("nlongitude").setValue(nlongitude);
     MyController.getController("nmeridian").setValue(nmeridian);
     MyController.getController("radius").setValue(radius);
     MyController.getController("sw").setValue(sw);
     MyController.getController("ir").setValue(ir);
     ////////////////////////////////////////////////
     
     //MAIN FORMULA
     //Formula for knot taken from http://paulbourke.net/geometry/knots/
     float mu = map(i, 0, total, 0, TWO_PI*nmeridian);
     
     
     float x = cos(mu)*(ir + cos(nlongitude*mu/nmeridian)/2);
     float y = sin(mu)*(ir + cos(nlongitude*mu/nmeridian)/2);
     float z = -sin(nlongitude*mu/nmeridian)/2;
     
     globe[i][0] = new PVector(x,y,z); //store all the value into PVector with in x,y,z coordinate
      
     //Trying random every point.
     //PVector v = PVector.random3D();
     //    v.mult(0.0050);
     //    globe[i][0].add(v);
   }

   beginShape();
   strokeWeight(sw); //Stroke Witdh Controlled with the slider
   strokeCap(ROUND);
   for(int i = 0; i <= total; i++)
   {
      stroke(colours[colour_index]); //Stroke Colour Controlled with the colour button
      PVector v = globe[i][0];
      
      //making a copy of points stored in "globe[i][0]", because "Line" function belows need  two of x,y,z coordinate.
      PVector v_next; 
      if (i == total){
        v_next = globe[0][0];
      }
      else {
        v_next = globe[i+1][0];
      }
      
      //Show points only (Hide line code below, and saveDXF to activete)
      //point(radius*v.x,radius*v.y,radius*v.z);
      //point(radius*v_next.x, radius*v_next.y, radius*v_next.z);
      
      //connect between the points from two of x,y,z coordinate
      line(radius*v.x,radius*v.y,radius*v.z, 
          radius*v_next.x, radius*v_next.y, radius*v_next.z);
  }
  endShape();
 
  if(saveDXF == true){
    endRaw();
    saveDXF = false;
  }  
  gui();
}
