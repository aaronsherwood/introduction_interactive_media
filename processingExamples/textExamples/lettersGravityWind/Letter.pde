class Letter extends Mover{
  char let;
  Letter(PVector pos, float _mass, char s){
    super(pos,_mass);
    let=s;
    drag = random(.98,.999);
  }
  
  void display(){
    text(let,position.x,position.y);
  }
  
  void bounce(){
    if (position.y > height) {
      velocity.y *= -0.9;  // A little dampening when hitting the bottom
      position.y = height;
    }
  }
}