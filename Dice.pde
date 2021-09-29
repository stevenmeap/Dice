public ArrayList<Die> dice;

void setup() {
  size(600, 600);
  noLoop();
  dice = new ArrayList();
}
int amount;
void draw() {
  background(233);
  amount = rollAmount();
  int size = Math.max(amount, width) / Math.min(amount, width);
  int increase =  Math.max(amount, width) / Math.min(amount, width);
  for (int i = 0; i < amount*increase; i+= increase) {
    for (int k = 0; k < amount*increase; k+= increase) {
      System.out.println("amount: " + amount + "X: " + i + "Y: " + k + "increase: " + increase);
      Die die = new Die(i, k, size);
    }
  }
}
void mousePressed() {
  redraw();
}

private int rollAmount() {
  int amount = ((int) (Math.random() *60+ 1));


  return 600%amount== 0 ? amount : rollAmount();
}


public class Die {
  private int x, y;
  private int sides = 2;
  private int size;
  public Die(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    //roll();
    show();
  }


  public void roll() {
    sides = (int) (Math.random()*6+1);
  }
  public void show() {
    pushMatrix();
    fill(255);
    rect(x, y, size, size);
    fill(0);
    switch(sides) {
    case 1:
      ellipse(x+size / 2, y+size/2, size/4, size/4);
      break;
    case 2:
      ellipse (x+size/4, y+ size /4, size/4,size/4);
      ellipse (x+size, (y + size/4)  , size/4,size/4);
      break;
    }
    popMatrix();
  }
}
