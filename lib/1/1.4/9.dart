void main() {
  Set<String> day6 = {'성진', '영케이', '원필', '도운', '도운'} ;  // 도운 중복

  print(day6);
  print(day6.contains('원필')); // 값이 있는지 확인
  print(day6.toList());        // 리스트로 변환

  List<String> day6_2 = ['성진', '원필', '원필'];
  print(Set.from(day6_2));    // List 타입을 Set 타입으로 변환
}