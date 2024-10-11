class Idol {
  final String name;
  final int membersCount;

  Idol(this.name, this.membersCount);

  void sayName() {
    print('그는 ${this.name} 입니다');
  }

  void sayMembersCount() {
    print('${this.name} 멤버는 ${this.membersCount}명 입니다');
  }
}

class BoyGroup extends Idol {
  // 상속에서처럼 super 키워드 사용해도 되고,
  // 아래처럼 생성자의 매개변수로 직접 super 키워드 사용해도 OK
  BoyGroup(
      super.name,
      super.membersCount,
      );

  // override 키워드를 사용해 오버라이드 진행
  @override
  void sayName() {
    print('그는 남자 아이돌 ${this.name} 입니다');
  }
}

void main() {
  BoyGroup strayKids = BoyGroup('스트레이키즈', 8);

  strayKids.sayName();          // 자식 클래스의 오버라이드된 메서드 사용

  // sayMembersCount 는 오버라이드하지 않았기 때문에
  // 그대로 Idol 클래스의 메서드가 실행됨
  // 부모 클래스의 메서드 사용
  strayKids.sayMembersCount();
}