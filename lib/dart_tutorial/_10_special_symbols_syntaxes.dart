var check;
var name;
void main(){
  // if(check == null){
  //   name = 'Default';
  // }else{
  //   name = check;
  // }
  // TODO : short way to implement the code above
  name = check ?? 'Default'; //check have to write twice times

  // TODO : shorter way to do that
  name = check ?? "Default";

  print(name);

  print("----------");

  // TODO : use (..) Cascades as stream in java
  List<int> numbers = [];
  numbers..add(1)..addAll([2,4,3])..sort()..forEach((num) => print(num));
}

