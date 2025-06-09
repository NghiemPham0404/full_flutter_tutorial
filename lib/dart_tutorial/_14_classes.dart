// TODO : User class
class User{
  // TODO : Properties
  late int id; // declare property of a class with late to ignore compile error
  String? name; // declare property of a class with ? to ignore compile error, set default value of name is null
  bool isEmployee = false; //  declare property with default value

  // TODO : Constructor
  User(this.id, this.name);

  User.m(int id, String name){ // TODO : another constructor with name 'm' (stand for manual)
    this.id = id;
    this.name = name;
  }

  User.n({this.id = -1, this.name, this.isEmployee = false}); // TODO : another constructor with default values (stand for manual)

  User.f(this.id, this.name, this.isEmployee); // TODO : another constructor with name 'f' (stand for full)

  @override
  String toString(){
    return "$id - $name - $isEmployee";
  }
}

// TODO : User list class to manage users
class UserList{
  var users = <User>[];

  // TODO : Add User
  void addUser(User user){
    users.add(user);
  }

  // TODO : Update User
  void updateUser(int id, User user){
    for (var u in users) {
      if(u.id == id){
        u.name = user.name;
        u.isEmployee = user.isEmployee;
        continue;
      }
    }
  }

  // TODO : Delete User
  void deleteUser(int id){
    users.removeWhere((u) => u.id == id);
  }

  // TODO : Print Users
  void printUsers(){
    for (var user in users) {
      print(user);
    }
  }

}

void main(){
  // TODO : Declare Users
  var user1 = User(1, "Linh");
  var user2 = User.m(2, "Tien");
  var user3 = User.f(3, "Hang", true);

  print(user1.toString());

  print("---------------");

  // TODO : initialize user list
  var users = <User>[];

  // TODO : add users to user list and print them
  users..add(user1)..add(user2)..add(user3)..forEach((user)=>print(user));

  print("---------------");

  // TODO : create a list object to manage users
  UserList data = UserList();
  data..addUser(user1)..addUser(user2)..addUser(user3)..printUsers();

  print("---------------");

  // TODO : update a user in user list
  var updateUser = User.f(2, "Tien Ngoc", true);
  data..updateUser(2, updateUser)..printUsers();

  print("---------------");

  // TODO : delete a user from user list
  data..deleteUser(1)..printUsers();
}