class User{
  // TODO : Properties
  int id = 0;
  String name = "";

  // TODO : Constructor
  User(this.id, this.name);
}

extension UserExtension on User{
  void logUser(){
    print("$id - $name");
  }
}

void main(){
  User u = User(4, "User");
  u.logUser();
}
