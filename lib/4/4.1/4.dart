void main() {
  // 레코드의 모든 값을 사용하지 않고 특정 순서의 레코드 값을 가져오고 싶다면 $ 사용
  (String, int, bool) jeonghan = ('정한', 30, true);
  print(jeonghan.$1);
  print(jeonghan.$2);
  print(jeonghan.$3);
}