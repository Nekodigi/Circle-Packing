class Agent{
  PVector pos, vel = new PVector();
  float r;
  color col;
  boolean exploded;
  
  Agent(float r){
    //pos = new PVector(random(0, width), random(0, height));
    //pos = PVector.random2D().mult(height/2);
    pos = PVector.random2D();
    this.r = r;
    col = color(basehue, random(100), 100);
  }
  
  Agent(){
    this(random(1, 20));
  }
  
  void explode(){
    PVector diff = PVector.sub(pos, new PVector(0, 0));
    float power = map(diff.mag(), 0, height/3, explPow, 0);
    vel.add(diff.setMag(power));   //set radius
    exploded = true;
  }
  
  void update(ArrayList<Agent> others, Polygon polygon_){
    PVector toCenter = PVector.sub(polygon_.centroid, this.pos);
    if(!polygon.isInside(pos, r))this.pos.add(toCenter.mult(0.01));
    for(Agent agent : others){
      if(agent != this){
        PVector dp = PVector.sub(agent.pos, this.pos);
        float dst = dp.mag();
        float goalDst = (this.r + agent.r);
        if(dst < goalDst){
          PVector targetPos = PVector.add(this.pos, dp.setMag(goalDst));
          agent.pos = PVector.lerp(targetPos, agent.pos, 0.9);
        }
      }
    }
    pos.add(vel);
    vel.mult(drag);
  }
  
  void show(){
    fill(col);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
