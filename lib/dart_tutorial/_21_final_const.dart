class User{
  // const id = 5; // TODO : fields cant not be const
  final id;

  const User(this.id);
}

dynamic getB(){
  return DateTime.timestamp().millisecondsSinceEpoch;
}


void main(){
  // ignore: unused_local_variable
  const a = 5; // TODO : const used to declare a constant like PI = 3.14, e, ...
  final b;
  b = getB(); // TODO : final also is immutable after initialize, but it doesn't have to be initialized at the start
  print(b);

  User u1 = const User(1);
  User u2 = const User(1);
  print(u1 == u2);
}

