void main(){
  final numbers = [1, 2, 3, 4, 5, 6, 7, 8];

  // 스프레드 연산자를 사용하게 되면 종간의 값들을 버릴 수 있음
  final [x, y, ..., z] = numbers;

  print(x);
  print(y);
  print(z);
}