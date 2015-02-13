color xColour = color(0,50,255);
color yColour = color(205,50,0);

int xMin=-10;
int xMax=10;
int yMin=-7;
int yMax=7;

int xSteps=20;  //number of tick marks between xMmin and xMax
int ySteps=14;  //number of tick marks between yMmin and yMax

Point[] points;  //array of points

Line[] lines;

void setup(){
  size(800,600);
  
  if (frame != null) {
    frame.setResizable(true);
  }
  points = new Point[4];
  points[0]=new Point(-3,2);
  points[1]=new Point(3,3);
  points[2]=new Point(-3,-2);
  points[3]=new Point(3,2);
    
  lines = new Line[2];
  lines[0]= new Line(0,0,1,color(255,0,0));
  lines[1]= new Line(1,2,3,color(0,0,255));
  // lines[0].p2=1
  // lines[1].p1=2
  // lines[1].p2=3
}

void draw(){
  background(255);
  drawAxes();
  for (int x=0;x<4;x++){
    points[x].drag(mouseX,mouseY);
    points[x].display();
  }
  
  lines[0].display();
  lines[1].display();
  
  fill(0);
  strokeWeight(30);
  textSize(20);
}

void mousePressed(){
  boolean found=false;
  for (int x=0;x<4;x++){
    if(!found){
      found=points[x].click(mouseX, mouseY);
    }
  }
}

void mouseReleased(){
  for (int x=0;x<4;x++){
    points[x].dragging=false;
  }
}

void drawAxes(){
  strokeWeight(3);
  stroke(yColour);
  if ((xMin<=0)&&(xMax>=0)){  //check that x=0 is within the drawn range
    line(map(0,xMin,xMax,0,width),0,map(0,xMin,xMax,0,width),height);  // draw y-axis
  }
  for(int i=0; i<ySteps; i++){  //draw tick marks for y axis
    line(map(0,xMin,xMax,0,width),map(i,0,ySteps,0,height),map(0,xMin,xMax,0,width)+(height+width)/300, map(i,0,ySteps,0,height));
  }
    stroke(xColour);
  if ((yMin<=0)&&(yMax>=0)){  //check that y=0 is within the drawn range
    line(0, map(0,yMin,yMax,height,0),width,map(0,yMin,yMax,height,0));
  }
  for(int i=0; i<xSteps; i++){  //draw tick marks for y axis
    line(map(i,0,xSteps,0,width),map(0,yMin,yMax,height,0), map(i,0,xSteps,0,width), map(0,yMin,yMax,height,0)+(height+width)/300);
  }
  fill(255,255,255,150);
  noStroke();
  rect(0,0,width,height);
}
