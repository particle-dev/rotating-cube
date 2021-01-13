Cube c;

void setup() {
  size(640, 640);
  c = new Cube(new PVector(0, 0, 0), 32);
}

void draw() {
  background(255);
  translate(width/2, height/2);

  float[][][] points = c.p;
  for (int i = 0; i < points.length; i++) {
    // points[i] = rotateY(points[i], PI/4);
    // points[i] = rotateX(points[i], PI/4);

    points[i] = rotateZ(points[i], 0.01);
    points[i] = rotateY(points[i], 0.01);
    points[i] = rotateX(points[i], 0.01);
  }

  scale(10);
  display(points);

  // frameRate(0);
  // println("size:", c.size);
  // for (float[][] p : points) {
  //   PVector coord = project(p).add(new PVector(width/20, height/20));
  //   println(int(coord.x), int(coord.y));
  // }
}

//          - Coordinate System -
//
//        o - - - x         0 - - - 1
//      / |     / |       / |     / |
//    z - + - C   |     4 - + - 5   |
//    |   |   |   |     |   |   |   |
//    |   y - + - C     |   3 - + - 2
//    | /     | /       | /     | /
//    C - - - C         7 - - - 6
// 
class Cube {
  int size;
  float[][][] p;

  Cube(PVector m, int s) {
    this.size = s;

    int h = s / 2;
    this.p = new float[][][]{
      {
        {m.x - h}, 
        {m.y - h}, 
        {m.z - h}, 
      }, 
      {{m.x + h}, {m.y - h}, {m.z - h}}, 
      {{m.x + h}, {m.y + h}, {m.z - h}}, 
      {{m.x - h}, {m.y + h}, {m.z - h}}, 
      {{m.x - h}, {m.y - h}, {m.z + h}}, 
      {{m.x + h}, {m.y - h}, {m.z + h}}, 
      {{m.x + h}, {m.y + h}, {m.z + h}}, 
      {{m.x - h}, {m.y + h}, {m.z + h}}, 
    };
  }
}

void display(float[][][] p) {
  for (int i = 0; i < 4; i++) {
    int next = (i + 1) % 4;
    line(p[i][0][0], p[i][1][0], p[next][0][0], p[next][1][0]); 
    line(p[i][0][0], p[i][1][0], p[i+4][0][0], p[i+4][1][0]);    
    line(p[i+4][0][0], p[i+4][1][0], p[next+4][0][0], p[next+4][1][0]);
  }
}

PVector project(float[][] p) {
  float[][] project2d = {
    { 1, 0, 0}, 
    { 0, 1, 0}, 
  };
  float[][] p2d = matrixMultiplication(project2d, p);
  return new PVector(p2d[0][0], p2d[1][0]);
}

float[][] rotateX(float[][] p, float angle) {
  float[][] rotation = {
    { 1, 0, 0}, 
    { 0, cos(angle), -sin(angle)}, 
    { 0, sin(angle), cos(angle)}
  };
  return matrixMultiplication(rotation, p);
}

float[][] rotateY(float[][] p, float angle) {
  float[][] rotation = {
    { cos(angle), 0, sin(angle)}, 
    { 0, 1, 0}, 
    { -sin(angle), 0, cos(angle)}
  };
  return matrixMultiplication(rotation, p);
}

float[][] rotateZ(float[][] p, float angle) {
  float[][] rotation = {
    { cos(angle), -sin(angle), 0}, 
    { sin(angle), cos(angle), 0}, 
    { 0, 0, 1}
  };
  return matrixMultiplication(rotation, p);
}

float[][] matrixMultiplication(float[][] a, float[][] b) {
  int rowsA = a.length;
  int colsB = b[0].length;
  float result[][] = new float[rowsA][colsB];
  for (int i = 0; i < rowsA; i++) {
    for (int j = 0; j < colsB; j++) {
      float sum = 0;
      for (int k = 0; k < a[i].length; k++) {
        sum += a[i][k] * b[k][j];
      }
      result[i][j] = sum;
    }
  }
  return result;
}
