void main() {
  // 네임드 파라미터 형태로 Record 선언하는 방법
  // 다른 네임드 파라미터와 마찬가지로 순서는 상관 X
  ({String name, int age}) jeonghan = (name : '정한', age : 30);
  print(jeonghan);
}