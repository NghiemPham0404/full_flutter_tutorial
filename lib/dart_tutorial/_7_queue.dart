import 'dart:collection';

Queue<int> queue = Queue();

void main(){

  // print(queue[3]); // TODO : warning : queue value can not be access by index

  // TODO : add values to queue
  queue.add(2);
  queue.addAll([3,4,1]); // TODO : add a iterable
  for (var num in queue) {
    print(num);
  }

  print("--------");

  queue.addFirst(0); //TODO : add number to first
  queue.addLast(5); // TODO : add number to last

  for (var num in queue) {
    print(num);
  }


  // TODO : remove values from queue
  print("--------");
  queue.remove(2); // TODO : remove value
  queue.removeFirst();  // TODO : remove first value
  queue.removeLast();   // TODO : remove last value
  for (var num in queue) {
    print(num);
  }
  


}