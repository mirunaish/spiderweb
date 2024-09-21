class LineSystem {

  PointSystem pointsys;
  
  LineSystem(PointSystem psys) {
    pointsys=psys;
  }
  
  void display() {
    for (int i=0; i<pointsys.points.size(); i++) {
      PVector ps = pointsys.points.get(i).position;
      for (int j=i+1; j<pointsys.points.size(); j++) {
        PVector pe = pointsys.points.get(j).position;
        float d = dist(ps.x, ps.y, pe.x, pe.y);
        if (d<150) {
          strokeWeight(2);
          stroke(15, -1.3*d+255, 0.486*d+167, 255*(1-d/150));
          line(ps.x, ps.y, pe.x, pe.y);
        }
      }
    }
  }
}
