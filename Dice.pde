public ArrayList<Die> dice;

void setup(){
  noLoop();
  dice = new ArrayList();
}
void draw(){
  int amount = (int) (Math.random() * 10 + 1);
  int size = Math.max(amount, width) / Math.min(amount, width
  for(int i = 0; i < amount; i+= Math.max(amount, width) / Math.min(amount, width)){
    for(int k = 0; k < amount; k+= Math.max(amount, height) / Math.min(amount, height)){
      Die die = new Die(i,k,size);
    }
  }
}
void mousePressed(){
  redraw();
}


public class Die{
  private int x,y;
  private int sides = 1;
  private int size;
  public Die(int x, int y, int size){
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  
  public void roll(){
    
  }
  public void show(){
  }
}
