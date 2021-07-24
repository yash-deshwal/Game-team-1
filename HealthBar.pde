class HealthBar{
  
  
  PVector location;
  
  float w;
  float h;
  
  public HealthBar(PVector location, float w, float h){
    background(255);
    
    this.location  = location;
    
    this.w = w;
    
    this.h = h;
  }
  
  public void drawHealthBar(){
    fill(0,255,0);
    rect(this.location.x, this.location.y, w, h );
    
    noFill();
    stroke(2);
    rect(this.location.x, this.location.y,200,h);
  
  }
  


}
