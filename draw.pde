abstract class Draw {

  color blank = color(0, 0, 0, 0);
  color black = color(0, 0, 0);

  void display(color fill, color stroke) {
    pushStyle();
    fill(fill);
    stroke(stroke);
    draw();
    popStyle();
  }

  abstract protected void draw();
}
