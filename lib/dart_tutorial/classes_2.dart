// TODO : User class
class User{
  // TODO : Properties
  int _id = 0;          //TODO : user "_" to declare the private properties
  String _name = "";

  // TODO : Constructor
  User(this._id, this._name);

  @override
  String toString(){
    return "$_id - $_name";
  }

  int get id => _id;    // getter of the id

  String get name => _name;

  set name(String value) {    // setter of name
    _name = value;
  }
}
void main(){
  User user = User(2, "Hoa");
  print(user);
}