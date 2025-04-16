
enum Person{
  Jack,
  Ly,
  SonTung,
  Peter
}

void main(){
  // TODO : print enum value
  print(Person.Jack);

  // TODO : print enum value name
  print(Person.Jack.name);

  // TODO : print enum lenght
  print(Person.values.length);

  // TODO : get enum value by index
  print(Person.values[1]);

  // TODO : get enum value by first, last
  print(Person.values.first);
  print(Person.values.last);

  // TODO : check if an enum is empty or not
  print(Person.values.isEmpty);
  print(Person.values.isNotEmpty);

  print("--------");

  // TODO : loop through an enum
  for (int i = 0; i<Person.values.length; i++){
    print(Person.values[i]);
  }
  print("--------");

  // TODO : loop through an enum by forEach and Arrow function
  for (var e in Person.values) {
    print(e);
  }

  print("--------");
  // TODO : switch case
  var name = Person.Peter;
  switch(name){
    case Person.Jack:
      print("Jack is a bad father");
      break;
    case Person.Ly:
      print("Ly is a good girl");
      break;
    case Person.SonTung:
      print("Son Tung is a good singer");
      break;
    default:
      print("I don't know this guy");
      break;
  }

  // TODO : generate elements with Iterable
  // TODO : method 1 : generate a sequence of numbers from 0 to n
  var numbers = Iterable.generate(10);
  for (var number in numbers) {
    print(number);
  }

  print("--------");
  //TODO : method 2 : generate a sequence of numbers with a function
  var numbers_2 = Iterable.generate(10, (number) => (number*2) + 2);
  for (var number in numbers_2) {
    print(number);
  }
  print("--------");

  // TODO : Access to the iterable by index (convert to list)
  List<int> numbers_3 = numbers_2.cast<int>().toList();
  for(int i = 0; i<numbers_2.length; i++){
    // print(numbers_2[i]); //can't access like this

    print(numbers_2.elementAt(i));
    print(numbers_3[i]);
  }

  print("--------");
  // TODO : Iterable properties and methods
  print(numbers.length);
  print(numbers.first);
  print(numbers.last);
  print(numbers.isEmpty);
  print(numbers.isNotEmpty);

  print(numbers.elementAt(5));
  print(numbers.contains(5));
  print(numbers.elementAtOrNull(11));
  print(numbers.map((e) => { e + 2})); // return a new Iterable by apply the formula (function) to each element


}