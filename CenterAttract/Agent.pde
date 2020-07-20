class Agent{
  PVector pos;
  float r;
  float mass;
  color col;
  
  Agent(float r){
    //pos = new PVector(random(0, width), random(0, height));
    pos = PVector.random2D().mult(height/2);
    this.r = r;
    mass = PI*r*r*density;
    col = color(basehue, random(100), 100);
  }
  
  Agent(){
    this(random(1, 20));
  }
  
  void attract(ArrayList<Agent> others){
    PVector center = new PVector(0, 0);
    PVector dpc = PVector.sub(center, this.pos);
    float dstC = dpc.mag();
    this.pos.add(dpc.mult(sqrt(mass)/(1000+dstC)));
    for(Agent agent : others){
      if(agent != this){
        PVector dp = PVector.sub(agent.pos, this.pos);
        float dst = dp.mag();
        float goalDst = (this.r + agent.r)*1.2;
        if(dst < goalDst){
          PVector targetPos = PVector.add(this.pos, dp.setMag(goalDst));
          agent.pos = PVector.lerp(targetPos, agent.pos, 0.8);
        }
      }
    }
  }
  
  void show(){
    fill(col);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
