void main() {
  int number1 = 1;

  print(number1 is int);
  print(number1 is String);
  print(number1 is! int);   // ! : 반대 (int 타입이 아닌 경우 true)
  print(number1 is! String);
}