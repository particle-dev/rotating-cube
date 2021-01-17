class C extends Draw implements Geometry {
  //          - Coordinate System -
  //
  //        0 - - - 1
  //      / |     / |
  //    4 - + - 5   |
  //    |   |   |   |
  //    |   3 - + - 2
  //    | /     | /
  //    7 - - - 6
  // 
  //        4 - 5
  //        |   |
  //    4 - 0 - 1 - 5 - 4
  //    |   |   |   |   |
  //    7 - 3 - 2 - 6 - 7
  //        |   |
  //        7 - 6
  Face f0123, f4510, f1562, f3267, f4037, f5476;

  C(Point p0, Point p1, Point p2, Point p3, 
    Point p4, Point p5, Point p6, Point p7) {
    this.f0123 = new Face(p0, p1, p2, p3);
    this.f4510 = new Face(p4, p5, p1, p0);
    this.f1562 = new Face(p1, p5, p6, p2);
    this.f3267 = new Face(p3, p2, p6, p7);
    this.f4037 = new Face(p4, p0, p3, p7);
    this.f5476 = new Face(p5, p4, p7, p6);
  }

  // Extends Draw

  void draw() {
    f0123.draw();
    f4510.draw();
    f1562.draw();
    f3267.draw();
    f4037.draw();
    f5476.draw();
  }

  // Implements Geometry

  Point[] vertices() {
    return new Point[]{
      f0123.l01.p0, 
      f0123.l01.p1, 
      f0123.l23.p0, 
      f0123.l23.p1,
      
      f5476.l01.p1, 
      f5476.l01.p0, 
      f5476.l23.p1, 
      f5476.l23.p0,
    };
  }

  Line[] edges() {
    return new Line[]{
      f0123.l01,
      f0123.l12, 
      f0123.l23, 
      f0123.l30,
      
      f5476.l01,
      f5476.l12,
      f5476.l23,
      f5476.l30,
      
      f4510.l30,
      f4510.l12,
      
      f3267.l30,
      f3267.l12,
    };
  }

  Face[] faces() {
    return new Face[]{
      f0123, f4510, f1562, f3267, f4037, f5476, 
    };
  }
}
