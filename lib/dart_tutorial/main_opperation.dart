
void main(){
  // TODO : 1. Math operation
  print(3 + 4);
  print(3 - 4);
  print(3 * 4);
  print(3 / 4);
  print(3 % 4);
  print(3^4);

  print("--------");

  print((-3).abs());
  print(0.75.floor());
  print(0.75.ceil());

  print("--------");

  int a = 4;
  print(++a);

  a = 4;
  print(a++);

  print("--------");

  // TODO : 2. Comparison operation
  print(3 == 4);
  print(3 > 4);
  print(3 < 4);

  print("--------");

  print(3 != 4);
  print(3 <= 4);
  print(3 >= 4);

  print("--------");


  // TODO : 3. Type check operation : as, is,
  // employee as User
  print(a is! int);
  print(a.runtimeType is int);

  print("--------");

  // TODO : 4. Assignment operation
  int b = 100;
  b += 100; // a = 200
  b -= 50; // a = 150
  b *= 2; // a = 300
  print(b);

  print("--------");
  //TODO : 5. Logic operation
  var check1 = true;
  var check2 = false;
  print(check1 && check2);
  print(check1 || check2);
  print(check1 && !check2);
  print(!check1 || check2);

  // TODO : 6. Bitwise Operation
  print(2 & 3); // 10 & 11 = 10 => 2
  print(2 & 4); // 010 & 100 = 000 => 0
}