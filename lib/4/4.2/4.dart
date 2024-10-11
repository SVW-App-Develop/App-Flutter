void main(){
  final jeonghan = Idol(name:'정한', age:30);

  // 클래스의 생성자 구조와 똑같이 구조 분해
  final Idol(name: name, age: age) = jeonghan;

  print(name);
  print(age);
}

class Idol {
  final String name;
  final int age;

  Idol({
    required this.name,
    required this.age
});
}