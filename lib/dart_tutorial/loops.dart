// for
// for in
// for each
// while
// do while
void main(){
  List<int> a = [1,3,4,5,23,41];
  // TODO : for loop
  for(int i = 0; i<a.length; i++){
    if(i == 3) continue; // TODO : using continue to skip a specific value
    print(a[i]);
  }

  print("------------");

  // TODO : for in
  for(int num in a){
    print(num);
  }

  print("------------");

  // TODO : for each
  for (var num in a) {
    print(num);
  }

  print("------------");

  // TODO : while loop
  int i = 0;
  while(i < a.length){
    if(i == 4) break; // TODO : Using break to exit loop
    print(a[i]);
    i++;
  }

  print("------------");

  // TODO : do while loop
  int y = 0;
  do{
    print(a[y]);
    y++;
  }while(y < a.length);
}