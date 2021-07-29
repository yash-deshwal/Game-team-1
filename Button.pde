class Button {
  //for text
  String label;

  //for location of the button.
  PVector location;
  //for width of the button
  float w;
  //for height of the button
  float h;

  Button(String text, PVector pos, float x, float y) {
    label = text;
    location = pos;
    w = x;
    h = y;
  }
  // for drawing buttonns as well as inserting the text
  void drawButton() {
    fill(218);
    //stroke(100);
    rect(location.x, location.y, w, h);
    textSize(30);
    textAlign(CENTER);
    fill(0);
    text(label, location.x+75, location.y+45);
  }
}
