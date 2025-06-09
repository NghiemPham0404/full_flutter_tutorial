var map = {};
var map1 = {"id": 1, "name": "Nghiem"};

void main() {
  // TODO : access to a map value by key
  print(map1['name']); // = Nghiem

  //TODO : check lenght of a map
  print(map1.length); // = 2

  print("--------");

  //TODO : loop through key and values of a map
  map1.forEach((key, value) => print("$key : $value"));

  print("--------");

  // TODO : add or change the value of a map
  map1['dob'] = '12-2-2022';
  map1['name'] =
      "Jacky"; // TODO : change the value by assigning the current key

  print(map1['dob']);
  print(map1['name']);

  print("--------");
  map1.addAll({
    "gender": 1,
    "Nickname": "JK",
  }); // TODO : add many keys and values
  map1.forEach((key, value) => print("$key : $value"));

  print("--------");
  map1["parents"] = {
    "mom": "Mary",
    "dad": "Henry",
  }; // TODO : add a map as value into a map
  map1.forEach((key, value) => print("$key : $value"));

  // TODO : delete key and value of a map
  print("--------");
  map1.remove("name");
  map1.forEach((key, value) => print("$key : $value"));

  // map1.clear(); // Delete all keys and values of a map

  print("--------");
  // TODO : check if key exist in a map
  print(map1.containsKey("name"));
}
