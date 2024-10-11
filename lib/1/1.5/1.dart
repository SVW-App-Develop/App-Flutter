void main() {
  double number = 2;

  print(number + 2);
  print(number - 2);
  print(number * 2);
  print(number / 2);  // 나눈 몫
  print(number % 3);  // 나눈 나머지

  print("------------------------");

  // 단항 연산 가능
  print(number++);
  print(number--);
  print(number += 2);
  print(number -= 2);
  print(number *= 2);
  print(number /= 2);
}