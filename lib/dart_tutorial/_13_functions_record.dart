void main(){
  var day = dayOfWeek(4);
  print("${day.$1} - ${day.$2}");
  var devide_1 = devide(10, 6);
  print("${devide_1.result} - ${devide_1.remainder} ");
}
void printElement(int x) => print(x);

double avg(int a, int b, int c) => (a + b + c)/3;

(String, String) dayOfWeek(int day){
  return switch(day){
    1 => ("Monday", "Thứ hai"),
    2 => ("Tuesday", "Thứ ba"),
    3 => ("Wednesday", "Thứ tư"),
    4 => ("Thurday", "Thứ năm"),
    5 => ("Friday", "Thứ sáu"),
    6 => ("Saturday", "Thứ bảy"),
    7 => ("Sunday", "Chủ nhật"),
    _ => ("invalid", "Không hợp lệ"),
  };
}

({int result, int remainder}) devide(int x, int y){
  return (result: x~/y , remainder: x%y);
}