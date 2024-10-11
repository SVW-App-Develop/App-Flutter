int addTwoNumbers(int a, int b){  // int a 가 int b 보다 먼저 선언
  return a + b;
}

void main() {
  print(addTwoNumbers(1, 2));  // 함수 실행시 1, 2 순서대로 a, b 에 입력됨
}