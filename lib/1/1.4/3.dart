void main() {
  List<String> strayKidsList = ['방찬', '리노', '창빈', '현진', '한', '필릭스', '승민', '아이엔'];

  final newList = strayKidsList.where(
        (name) => name == '현진' || name == '필릭스',  // '현진' 또는 '필릭스' 만 유지
  );

  print(newList);
  print(newList.toList());  // Iterable 을 List 로 다시 변환할 때 .toList() 사용
}