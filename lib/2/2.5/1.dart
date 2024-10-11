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

// implements 키워드를 사용하면 원하는 클래스를 인터페이스로 사용 가능
class BoyGroup implements Idol {
  // 상속받을 때는 부모 클래스의 모든 기능이 상속되므로 재정의 할 필요 X
  // 인터페이스는 반드시 모든 기능을 다시 정의해줘야 함
  // (반드시 재정의할 필요가 있는 기능을 정의하는 용도)
  final String name;
  final int membersCount;
  // => BoyGroup 클래스는 Idol 클래스가 정의한 모든 기능을 다시 정의

  BoyGroup(
      this.name,
      this.membersCount,
      );

  void sayName() {
    print('그는 남자 아이돌 ${this.name} 입니다');
  }

  void sayMembersCount() {
    print('${this.name} 멤버는 ${this.membersCount} 명입니다');
  }
}

void main() {
  BoyGroup strayKids = BoyGroup('스트레이키즈', 8);

  strayKids.sayName();
  strayKids.sayMembersCount();
}