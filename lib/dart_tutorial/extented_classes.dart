import './classes_2.dart';

// TODO : extend the parent class (a class can only extend 1 parent class only)
class Student extends User{
  late int stu_id;

  // TODO : constructors call parents constuctor by 'super'
  Student(super._id, super._name, this.stu_id,);

  Student.d(this.stu_id) : super(0, "Default name");

  @override
  String toString(){
    return "${super.id} - ${super.name} - $stu_id";
  }
}

// TODO : abstract class
// TODO : abstract class have its own properties and method like regular classes but it cannot be used to create object
abstract class People{
  void function1();

  void function2(){
    print("function 2");
  }
}

// TODO : class extend abstract class
class Civilian extends People{
  int id = 0;

  @override
  void function1(){
    print("override function 1 : $id");
  }
}

void main(){
  Student student = Student(1, "Tai", 1);

  print(student);
  print("-------------");

  Student student2 = Student.d(2);
  print(student2);
  print("-------------");

  var peo = Civilian();
  peo.function1();
  peo.function2();
}