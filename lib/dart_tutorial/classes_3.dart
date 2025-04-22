class Vector{
  int x;
  int y;

  Vector(this.x, this.y);

  Vector operator + (Vector other) => Vector(this.x + other.x, this.y + other.y);

  @override
  String toString() {
    return "($x , $y)";    
  }
}
void main(){
  Vector v1 = Vector(3,4);
  Vector v2 = Vector(5,6);
  print(v1+v2);
}