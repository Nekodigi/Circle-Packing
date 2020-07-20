int n = 100;
float aSize;
float basehue = 0;
float density = 0.005;
ArrayList<Agent> agents = new ArrayList<Agent>();

void setup(){
  size(500, 500);
  //fullScreen();
  aSize = float(height)/20;
  colorMode(HSB, 360, 100, 100, 100);
  for(int i = 0; i < n; i++){
    agents.add(new Agent(float(n-i)/n*aSize));
  }
}

void draw(){
  background(360);
  translate(width/2, height/2);
  noStroke();
  for(Agent agent : agents){
    agent.attract(agents);
    agent.show();
  }
}
