//For creating stars in the background
class Star{
  
  float x;
  float y;
  float z;
  
  public Star(){
    //Why width/2? so you really see all the stars, that are created
    // if we only use -width, width you're only seeing 1/4 of all stars, 
    //the rest of the stars will be beyond the screen
    
    x = random(-width/2,width/2);
    y = random(-height/2,height/2);
    z = random(width);
  }
  
  public void change(){
    z = z-5;
    //if z becomes 0 or less than 1 then i want it to go back to width value
    //in short setiing it back to width.
    if (z<1){
      z = width;
      x = random(-width/2,width/2);
      y = random(-height/2,height/2);
    }
  }
  
  public void animate(){
    fill(255);
    noStroke();
    
    //i wanna take the value of x/z and then map it from 0-1 and 0-width. and same for y
    //scaling one variable from input range to output range
    float sx = map(x/z,0,1,0,width);
    //println(x/y);
    float sy = map(y/z,0,1,0,height);
    
    //mapping the z value which goes betwen 0-width and 6-0. so whn they are close to screen
    //the size should be 6 and when they are far size is 0
    float r= map(z,0,width,6,0);
    
    ellipse(sx,sy,r,r);
    
  }


}
