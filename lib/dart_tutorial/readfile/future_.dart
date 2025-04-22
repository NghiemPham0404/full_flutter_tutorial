import "dart:io";

const fileName = "lib/dart_tutorial/readfile/input.txt";
Future<void> main() async {
  String content = await _readFileSync();
  print(content);
}
Future<String> _readFileSync() async{
  var file = File(fileName);
  var content = file.readAsString();
  return content;
}