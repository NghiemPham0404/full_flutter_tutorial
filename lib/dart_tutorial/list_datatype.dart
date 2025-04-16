void main(){
  // TODO : Declare a list
  // TODO : delare by an []
  var list = [];

  // TODO : delare by List<>
  List<int> numbers = [2,3,1];

  // TODO : access to value by index
  print(numbers[2]);

  // TODO : loop through element of a list
  for (var element in list) {
    print(element);
  }

  // TODO : properties and method of list
  print("--------");
  print(numbers.length);
  print(numbers.first);
  print(numbers.last);
  print(numbers.reversed);

  // TODO : add()
  print("--------");
  list.add(1);
  list.add("String");
  for (var element in list) {
    print(element);
  }

  // warning : only the valid value can be added to list
  print("--------");
  numbers.add(123);
  numbers.add(int.parse("213"));
  for (var element in numbers) {
    print(element);
  }

  //TODO : add a list into another list
  numbers.addAll([4,6]);
  for (var element in numbers) {
    print(element);
  }

  //TODO : insert a value to list
  numbers.insert(5, 5);

  // TODO : remove value
  numbers.remove(3); // remove the first occurrence value
  for (var element in numbers) {
    print(element);
  }

  numbers.removeAt(3); // remove value by position
  for (var element in numbers) {
    print(element);
  }

  // numbers.clear(); // TODO : remove all

  // TODO : sort list
  print("--------");
  numbers.sort(); // sort by value
  for (var element in numbers) {
    print(element);
  }

  print("--------");
  numbers.sort((a, b) => b - a); // sort by value reversed
  for (var element in numbers) {
    print(element);
  }

  // TODO : print list on a line
  print("--------");
  String s = numbers.join(" ");
  print(s);
}