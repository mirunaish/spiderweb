class PointSystem {
  ArrayList<Point> points;

  PShape pointShape;


  PointSystem(int n) {
    points = new ArrayList<Point>();
    pointShape=createShape(GROUP);

    for (int i=0; i<n; i++) {
      Point p = new Point();
      points.add(p);
      pointShape.addChild(p.getShape());
    }
  }
  
  void update() {
    for (Point p: points) {
      p.update();
    }
  }
  
  void display() {
    shape(pointShape);
  }
}
