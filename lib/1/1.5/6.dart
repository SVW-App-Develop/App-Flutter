void main() {
  bool result = 12 > 10 && 1 > 0;   // 12가 10보다 크고 1이 0보다 클 때
  print(result);

  bool result2 = 12 > 10 && 0 > 1;  // 12가 10보다 크고 0이 1보다 클 때
  print(result2);

  bool result3 = 12 > 10 || 1 > 0;  // 12가 10보다 크거나 1이 0보다 클 때
  print(result3);

  bool result4 = 12 > 10 || 0 > 1;  // 12가 10보다 크거나 0이 1보다 클 때
  print(result4);

  bool result5 = 12 < 10 || 0 > 1;  // 12가 10보다 작거나 0이 1보다 클 때
  print(result5);
}