class Point extends Draw implements Geometry {

  float x, y, z;

  Point(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  Point add(Point p) {
    return add(p.x, p.y, p.z);
  }

  Point add(float x, float y, float z) {
    return new Point(this.x + x, this.y + y, this.z + z);
  }
  
  Point sub(Point p) {
    return add(-p.x, -p.y, -p.z);
  }

  float length() {
    return sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));
  }

  Point normalize() {
    float l = length();
    return new Point(x / l, y / l, z / l);
  }

  Point scale(float size) {
    return new Point(x * size, y * size, z * size);
  }

  // Extends Draw

  void draw() {
    point(x, y);
  }

  // Implements Geometry

  Point[] vertices() {
    return new Point[]{this};
  }

  Line[] edges() {
    return null;
  }

  Face[] faces() {
    return null;
  }
}
