void main() {
  addNumbers(1, 1);
}

void addNumbers(int number1, int number2) {
  print('$number1 + $number2 계산 시작');           // (2)

  // Future.delayed() 사용시 일정 시간 후에 콜백 함수 실행 가능
  Future.delayed(Duration(seconds: 3), () {       // 3초간 대기
    print('$number1 + $number2 = ${number1 + number2}');    // (4)
  });
  // => Future.delated() 는 비동기 연산이기 때문에 CPU 가 3초간 대기해야 한다는 메시지를 받으면
  //    리소스를 허비하지 않고고 다음 코드를 바로 실행

  print('$number1 + $number2 코드 실행 끝');         // (3)
}

// => (2), (4), (3) 순서가 아닌 (2), (3), (4) 순서로 값 출력