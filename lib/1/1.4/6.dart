void main() {
  List<String> strayKidsList = ['방찬', '리노', '창빈', '현진', '한', '필릭스', '승민', '아이엔'];

  // reduce() 함수와 마찬가지로 각 요소를 순회하며 실행됨
  final allMembers = strayKidsList.fold<int>(
      0, (value, element) => value + element.length
  );

  print(allMembers);
}