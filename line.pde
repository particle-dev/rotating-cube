class Line extends Draw implements Geometry {

  Point p0, p1;

  // 0 --> 1
  Line(Point a, Point b) {
    this.p0 = a;
    this.p1 = b;
  }

  float length() {
    return sqrt(pow(p0.x-p1.x, 2) + pow(p0.y-p1.y, 2) + pow(p0.z-p1.z, 2));
  }
  
  Line normalize() {
    return new Line(p0, p0.add(p1.normalize()));
  }
  
  Line scale(float size) {
    return new Line(p0, p1.sub(p0).scale(size).add(p0));
  }

  // Extends Draw

  void draw() {
    line(p0.x, p0.y, p1.x, p1.y);
  }

  // Implements Geometry

  Point[] vertices() {
    return new Point[]{p0, p1};
  }

  Line[] edges() {
    return new Line[]{this};
  }

  Face[] faces() {
    return null;
  }
}
