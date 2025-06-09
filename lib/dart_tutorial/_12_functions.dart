void main() {
  logInFor();
  print("----------------");
  logInFor2();
  print("----------------");
  logInFor3("Yasuo");
  print("----------------");

  check(0, 6);

  print("----------------");
  check2(c: 6, b: 3, a: 3);
}

// TODO : regular functions (looklike JAVA function)
void logInFor() {
  print("name : nghiem");
}

String loadInfo() {
  return "Nghiem";
}

int sum(int a, int b) {
  return a + b;
}

bool check_equal(int a, int b) {
  return a == b;
}

// TODO : Arrow functions
var logInFor2 = () => {print("name : Katy"), print("gender: female")};

// TODO : Lambda functions
void logInFor3(a) => print("Hello $a");

// TODO : Allow null and default values
void check([int a = 0, int? b = 0, int? c = 8]) {
  print(a);
  print(b);
  print(c);
}

// TODO : Allow arrange position of arguments and default values
void check2({int a = 0, int? b = 0, int? c = 8}) {
  print(a);
  print(b);
  print(c);
}
