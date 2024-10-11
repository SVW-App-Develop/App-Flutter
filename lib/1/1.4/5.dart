void main() {
  List<String> strayKidsList = ['방찬', '리노', '창빈', '현진', '한', '필릭스', '승민', '아이엔'];

  final allMembers = strayKidsList.reduce((value, element)=>
  value + ', ' + element    // 리스트를 순회하면 값들을 더함
  );

  print(allMembers);
}