abstract class City{
  String showCity();
}

abstract class District{
  String showDistrict();
}

class User implements City, District{
  // TODO : Properties
  int id = 0;
  String name = "";

  // TODO : Constructor
  User(this.id, this.name);

  @override
  String showCity(){
    return "City";
  }

  @override
  String showDistrict(){
    return "District";
  }
}

void main(){
  User u = User(3, "Hoa");
  print("${u.showCity()} ${u.showDistrict()}");
}

