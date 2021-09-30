public ArrayList<Die> dice;
public IntList savedRolls;
public int totalCount = 0;

void setup() {
  size(600, 700);
  noLoop();
  dice = new ArrayList();
  savedRolls = new IntList();
}
int amount;
void draw() {
  totalCount = 0;
  background(233);
  amount = rollAmount();
  int size = Math.max(amount, width) / Math.min(amount, width);
  int increase =  Math.max(amount, width) / Math.min(amount, width);
  for (int i = 0; i < amount*increase; i+= increase) {
    for (int k = 0; k < amount*increase; k+= increase) {
      Die die = new Die(i, k, size);
      totalCount += die.getValue();
    }
  }
  pushMatrix();
  savedRolls.append(totalCount);
  
  text("Dice: " + amount*amount + " Total dots: " + totalCount + " Average dots: " + getAverage(),200, 650);
  popMatrix();
}
void mousePressed() {
  redraw();
}

private int getAverage(){
  int total = 0;
  for(int i : savedRolls){
    total += i;
  }
  return total / savedRolls.size();
}

private int rollAmount() {
  int amount = ((int) (Math.random() *100+ 1));


  return 600%amount== 0 ? amount : rollAmount();
}


public class Die {
  private int x, y;
  private int sides = 6;
  private int size;
  public Die(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    roll();
    show();
  }


  public void roll() {
    sides = (int) (Math.random()*6) + 1;
  }
  
  public int getValue(){
    return sides;
  }
  public void show() {
    pushMatrix();
    fill(255);
    rect(x, y, size, size);
    fill(0);
    switch(sides) {
    case 1:
      ellipse(x+size / 2, y+size/2, size/4, size/4); //center
      break;
    case 2:
      ellipse(x+size/4, y+ size /4, size/4, size/4); //top left
      ellipse(x+3*(size/4), y + 3*(size/4), size/4, size/4); //bottom right
      break;
    case 3:
      ellipse(x+size / 2, y+size/2, size/4, size/4); //center
      ellipse(x+size/4, y+ size /4, size/4, size/4); //top left
      ellipse(x+3*(size/4), y + 3*(size/4), size/4, size/4); //bottom right
      break;
    case 4:
      ellipse(x+size/4, y+ size /4, size/4, size/4); //top left
      ellipse(x+3*(size/4), y + 3*(size/4), size/4, size/4); //bottom right
      ellipse(x+3*(size/4), y+ size /4, size/4, size/4); //top right
      ellipse(x+(size/4), y + 3*(size/4), size/4, size/4); //bottom left
      break;
    case 5:
      ellipse(x+size/4, y+ size /4, size/4, size/4); //top left
      ellipse(x+3*(size/4), y + 3*(size/4), size/4, size/4); //bottom right
      ellipse(x+3*(size/4), y+ size /4, size/4, size/4); //top right
      ellipse(x+(size/4), y + 3*(size/4), size/4, size/4); //bottom left
      ellipse(x+size / 2, y+size/2, size/4, size/4); //center
      break;
    case 6:
      ellipse(x+size/4, y+ size /4, size/4, size/4); //top left
      ellipse(x+3*(size/4), y + 3*(size/4), size/4, size/4); //bottom right
      ellipse(x+3*(size/4), y+ size /4, size/4, size/4); //top right
      ellipse(x+(size/4), y + 3*(size/4), size/4, size/4); //bottom left
      ellipse(x+3*(size/4), y+size/2, size/4, size/4); //center right
      ellipse(x+(size/4), y+size/2, size/4, size/4); //center left
      break;
    }


    popMatrix();
  }
}
