void main() {
  // TODO : Declare a list
  // TODO : delare by an []
  var list = [];

  // TODO : delare by List<>
  List<int> numbers = [2, 3, 1]; // number = [2,3,1]

  // TODO : access to value by index
  print(numbers[2]); // 1

  // TODO : loop through element of a list
  for (var element in list) {
    print(element); // 2 3 1
  }

  // TODO : properties and method of list
  print("--------");
  print(numbers.length); // 3
  print(numbers.first); // 2
  print(numbers.last); // 1
  print(numbers.reversed); // 1 3 2

  // TODO : add()
  print("--------");
  list.add(1);
  list.add("String");
  for (var element in list) {
    print(element); // 1 String
  }

  // warning : only the valid value can be added to list
  print("--------");
  numbers.add(123);
  numbers.add(int.parse("213"));
  for (var element in numbers) {
    print(element); // 1 3 2 123 213
  }

  //TODO : add a list into another list
  numbers.addAll([4, 6]);
  for (var element in numbers) {
    print(element); //  1 3 2 123 213 4 6
  }

  //TODO : insert a value to list
  numbers.insert(5, 5); // 1 3 2 123 213 5 4 6

  // TODO : remove value
  numbers.remove(3); // remove the first occurrence value
  for (var element in numbers) {
    print(element); // 1 2 123 213 5 4 6
  }

  numbers.removeAt(3); // remove value by position - 213
  for (var element in numbers) {
    print(element);
  }

  // numbers.clear(); // TODO : remove all => numbers = []

  // TODO : sort list
  print("--------");
  numbers.sort(); // sort by value
  for (var element in numbers) {
    print(element); // 1 2 4 5 6 123
  }

  print("--------");
  numbers.sort((a, b) => b - a); // sort by value reversed
  for (var element in numbers) {
    // 123 6 5 4 2 1
    print(element);
  }

  // TODO : print list on a line
  print("--------");
  String s = numbers.join(" ");
  print(s);
}
