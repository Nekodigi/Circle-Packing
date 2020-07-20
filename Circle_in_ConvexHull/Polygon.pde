class Polygon{
  ArrayList<PVector> vertices = new ArrayList<PVector>();
  PVector centroid;
  
  void calcCentroid(){
    PVector sum = new PVector();
    for(PVector v : vertices){
      sum.add(v);
    }
    centroid = sum.div(vertices.size());
  }
  
  boolean isInside(PVector pos, float r){//assume clockwise convex hull
    for(int i=0; i<vertices.size(); i++){
      PVector p1 = vertices.get(i);
      PVector p2 = vertices.get((i+1)%vertices.size());
      PVector n = new PVector(-(p2.y - p1.y), p2.x - p1.x).normalize();
      float d = n.dot(p1)-n.dot(pos)+r;
      if(d>0)return false;
    }
    return true;
  }
  
  void show(){
    beginShape();
    for(PVector p : vertices){
      vertex(p.x, p.y);
    }
    endShape();
  }
}
