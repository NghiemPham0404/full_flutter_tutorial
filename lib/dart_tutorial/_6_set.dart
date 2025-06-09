// TODO : assignment sets
var set_1 = <int>{};
var set_2 = <String>{};
Set<int> integerSet = {1, 3, 4};
Set<String> stringSet = {"nghiem", "han", "Lee"};
Set<dynamic> dynamicSet = {1, "nghiem", false, 3.1};

void main() {
  // TODO : add value into set
  // WARNING : set only has distinct values and only accept valid type
  integerSet.add(3);
  for (var number in integerSet) {
    print(number); // 1 3 4
  }

  print("--------");

  // TODO : get length
  print("length : ${integerSet.length}");
  for (var number in integerSet) {
    print(number);
  }

  print("--------");

  // TODO : add set to a set
  // WARNING : set only has distinct values and only accept valid type
  set_1.addAll(integerSet);
  for (var e in set_1) {
    print(e);
  }

  print("--------");
  //set_1.addAll(dynamicSet) // will not work
  dynamicSet.addAll(set_1); // will work
  for (var e in dynamicSet) {
    print(e);
  }

  print("--------");

  // TODO : remove value from a set
  dynamicSet.remove(3.1);
  for (var e in dynamicSet) {
    print(e);
  }

  // PS : set values can be access by using index position but shouldn't be used
}