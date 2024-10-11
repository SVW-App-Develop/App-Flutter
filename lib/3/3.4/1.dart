import 'dart:async';

void main() {
  final controller = StreamController();  // StreamController 선언
  final stream = controller.stream;       // Stream 가져오기

  // Stream 에 listen() 함수 실행하면 값이 주입될 때마다 콜백 함수 실행 가능
  final streamListener1 = stream.listen((val){
    print(val);
  });

  // Stream 에 값 주입하기
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
}