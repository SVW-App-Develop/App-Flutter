class Idol {
  final String name;
  final int membersCount;

  // 생성자
  Idol(String name, membersCount)
  // 1개 이상의 변수를 저장하고 싶을 때는 , 기호로 연결해주면 됨
      : this.name = name,
        this.membersCount = membersCount;

  // 네임드 생성자
  // {클래스명.네임드 생성자명} 형식
  // 나머지 과정은 기본 생성자와 같음
  Idol.fromMap(Map<String, dynamic> map)
      : this.name = map['name'],
        this.membersCount = map['membersCount'];

  void sayName() {
    print('그는 ${this.name} 입니다.${this.name} 멤버는 ${this.membersCount}명입니다.');
  }
}

void main() {
  // 기본 생성자 사용
  Idol strayKids = Idol('스트레이키즈', 8);
  strayKids.sayName();

  // fromMap 이라는 네임드 생성자 사용
  Idol seventeen = Idol.fromMap({
    'name': 'SEVENTEEN',
    'membersCount': 13
  });
  seventeen.sayName();
}