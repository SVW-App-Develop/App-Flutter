void main() {
  List<String> strayKidsList = ['방찬', '리노', '창빈', '현진', '한', '필릭스', '승민', '아이엔'];

  final newstrayKidsList = strayKidsList.map(
          (name) => 'strayKids $name'  // 리스트의 모든 값 앞에 'staryKids' 추가
  );
  print(newstrayKidsList);

  // Iterable 을 List 로 다시 변환할 때 .toList() 사용
  print(newstrayKidsList.toList());
}