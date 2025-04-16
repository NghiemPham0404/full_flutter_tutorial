// TODO : mixin created to be reused its method, mixin and class using it method dont have any relationship
// TODO : you dont have to override mixin function
mixin Model{

  void printInformation(){
   print('sdkfl');
  }
}
mixin Model2{

  void printInformation(){
    print('asdfsd');
  }
}

// TODO Person class extend Model mixin with the 'with'
class Person with Model, Model2{
  int id = 0;
  String name = "";

  Person(this.id, this.name, );

  void printPersonInfo(){
    printInformation();
    print("$id - $name");
  }
}

void main(){
  Person p = Person(5 , "Jerry");
  p.printPersonInfo();
}