void main(){
  // 아래 코드와 같지만 구조 분해를 사용하면 한 줄에 해결 가능
  // final strayKids = ['한', '용복'];
  // final han = strayKids[0];
  // final yongbok = strayKids[1];
  final [han, yongbok] = ['한', '용복'];

  // 한 출력
  print(han);
  // 용복 출력
  print(yongbok);
}