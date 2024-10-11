void main() {
  Map<String, String> dictionary = {
    'Harry Potter' : '해리 포터',  // 키 : 값
    'Ron Weasley' : '론 위즐리',
    'Hermione Granger' : '헤르미온느 그레인저'
  };

  print(dictionary.keys);
  // Iterable 이 반환되기 때문에 .toList() 실행하여 List 반환 받을 수도 있음
  print(dictionary.values);
}