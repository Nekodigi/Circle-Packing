int n = 120;
float aSize;
float drag = 0.97;//0.97
float explPow = 20;//100
float basehue = 0;
ArrayList<Agent> agents = new ArrayList<Agent>();
Polygon polygon;

void setup(){
  size(500, 500);
  //fullScreen();
  aSize = float(height)/20;
  colorMode(HSB, 360, 100, 100, 100);
  polygon = new Polygon();
  for(int i = 0; i < 50; i++){
    polygon.vertices.add(PVector.fromAngle(map(i, 0, 50, 0, TWO_PI)).mult(height/3));
  }
  polygon.calcCentroid();
  for(int i = 0; i < n; i++){
    agents.add(new Agent(float(n-i)/n*aSize));
  }
}

void draw(){
  background(360);
  translate(width/2, height/2);
  noFill();
  stroke(0);
  polygon.show();
  noStroke();
  for(Agent agent : agents){
    agent.update(agents, polygon);
    agent.show();
  }
}

void keyPressed(){
  if(key == 'r'){
    basehue = (random(180)+200)%360;
    agents = new ArrayList<Agent>();
    for(int i = 0; i < n; i++){
      agents.add(new Agent(float(n-i)/n*aSize));
    }
  }
}

void mousePressed(){
  for(Agent agent : agents){
    agent.explode();
  }
}
