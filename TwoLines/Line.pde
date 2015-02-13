class Line{
  float m;  // slope of line
  float c;  // y-intercept of the line (x-intercept for vertical line)
  int p1;  // index of one point defining the line
  int p2;  // index of the second point defining the line.
  String eqn;  // equation of the line (as a string)
  boolean vertical;  // true if vertical line
  color colour;
  int index;
  
  Line(int sequence, int point1, int point2, color lineColor){
    index=sequence;
    p1=point1;
    p2=point2;
    colour=lineColor;
  }
  
  void display(){
    stroke(colour);
    strokeWeight(3);
    fill(colour);
    textSize(20);
    textAlign(LEFT);
    if ((points[p1].xLoc==points[p2].xLoc)&&(points[p1].yLoc==points[p2].yLoc)){
      eqn="no defined equation";
    }
    else{
      if (points[p1].xLoc==points[p2].xLoc){
        c=points[p1].xLoc;
        line(map(c,xMin,xMax,0,width),0,map(c,xMin,xMax,0,width),height);
        text("x="+String.format("%.2f",c),10,(30+index*30));
      }else{
        m=float(points[p1].yLoc-points[p2].yLoc)/float(points[p1].xLoc-points[p2].xLoc);
        c=float(points[p1].yLoc)-(m*float(points[p1].xLoc));
        line(0, map(m*xMin+c,yMin,yMax,height,0), width, map(m*xMax+c,yMin,yMax,height,0));
        if (c<0) text("y="+String.format("%.2f",m)+"x-"+String.format("%.2f",-c),10,(30+index*30));
        else text("y="+String.format("%.2f",m)+"x+"+String.format("%.2f",c),10,(30+index*30));
      }
      // display equation
      
    }
  }
}
