// ignore_for_file: unused_local_variable

void main() {
  // TODO: both dynamic and var allow you to assign any data type to a variable
  // at first, but 'var' infers the type from the first value assigned,
  // and it cannot be changed later.
  // 'dynamic' allows you to change the type of the variable at runtime.

  var b = 123;
  // b = "fdasf"; // ❌ This will cause a compile-time error because 'b' is inferred as int

  dynamic a = 5;
  a = "sdf"; // ✅ This works, 'a' can change type at runtime
}
