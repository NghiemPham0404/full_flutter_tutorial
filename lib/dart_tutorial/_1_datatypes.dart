// ignore_for_file: avoid_print, unused_local_variable

void main() {
  int a = 6;
  double b = 4.5;
  String c = "hello world \n";
  String c2 = 'Hello world';
  String c3 = 'Hello world ${a.toString()}';
  bool d = false;

  //  todo : print the variable
  print(a);
  print(b);
  print(c);
  print(c2);
  print(c3);
  print(d);

  //todo : print the data types
  print(a.runtimeType);
  print(b.runtimeType);
  print(c.runtimeType);
  print(d.runtimeType);

  //todo : disable nullable validation
  // ignore: duplicate_ignore
  // ignore: unused_local_variable
  int? e;

  // todo : data type convert
  int num = int.parse("1");
  double num2 = double.parse("1.4");
  String s = num.toString();
  bool boolean = bool.parse("true");
  print(boolean);
}
