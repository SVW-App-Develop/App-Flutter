void main() {
  // 리스트에 넣을 타입을 <> 사이에 명시 가능
  List<String> strayKidsList = ['방찬', '리노', '창빈', '현진', '한', '필릭스', '승민', '아이엔'];

  print(strayKidsList);
  print(strayKidsList[0]);  // 첫 원소 지정
  print(strayKidsList[7]);  // 마지막 원소 지정

  print(strayKidsList.length);  // 길이 반환

  strayKidsList[5] = '이용복';   // 5번 인덱스값 변경
  print(strayKidsList);
}