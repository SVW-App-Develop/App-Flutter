void main(){
  final jeonghanMap = {'name':'정한', 'age':30};
  // 위의 맵 구조와 똑같은 구조로 구조 분해
  final {'name':name, 'age':age} = jeonghanMap;

  print('name : $name');
  print('age : $age');
}