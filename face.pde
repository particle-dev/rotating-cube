class Face extends Draw implements Geometry {

  Line l01, l12, l23, l30;

  // 0 - - - 1  
  // |       | 
  // |       |
  // |       |
  // 3 - - - 2
  Face(Point p0, Point p1, Point p2, Point p3) {
    this.l01 = new Line(p0, p1);
    this.l12 = new Line(p1, p2);
    this.l23 = new Line(p2, p3);
    this.l30 = new Line(p3, p0);
  }

  // Extends Draw

  void draw() {
    l01.draw();
    l12.draw();
    l23.draw();
    l30.draw();
  }

  // Implements Geometry

  Point[] vertices() {
    return new Point[]{
      l01.p0, 
      l01.p1, 
      l23.p0, 
      l23.p1, 
    };
  }

  Line[] edges() {
    return new Line[]{
      l01, l12, l23, l30, 
    };
  }

  Face[] faces() {
    return new Face[]{this};
  }
}
