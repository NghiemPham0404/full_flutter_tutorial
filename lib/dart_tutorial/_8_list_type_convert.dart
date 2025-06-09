import 'dart:collection';

var numbers= [1,2,3];
List<int> list1 = [4,5,6];
List<String> list2 = ['Nghiem', 'Vu', "Hwang"];


void main(){
  // Method 1 TODO : Manual adding
  Set<String> set1 = {};
  for (var number in list1) {
    set1.add(number.toString());
  }
  for (var str in set1) {
    print(str);
  }

  print("--------");

  // method 2 TODO : Add all method
  Set<String> set2 = {};
  set2.addAll(list2);
  for (var str in set2) {
    print(str);
  }

  print("--------");

  // method 3 TODO : from() method
  Set<String> set3 = Set.from(list2);
  for (var str in set3) {
    print(str);
  }

  print("--------");

  Queue<String> queue = Queue.from(list2);
  for (var str in queue) {
    print(str);
  }

  print("--------");

  // method4 TODO : map() method
  List<String> list3 = list1.map((num) => num.toString()).toList();
  for (var str in list3) {
    print(str);
  }
}