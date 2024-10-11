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

mixin IdolSingMixin on Idol {
  void sing() {
    print('${this.name} 이/가 노래를 부릅니다');
  }
}

// 믹스인을 적용할 때는 with 키워드 사용
class BoyGroup extends Idol with IdolSingMixin  {
  BoyGroup(
      super.name,
      super.membersCount,
      );

  void sayMale() {
    print('그는 남자 아이돌입니다');
  }
}

void main() {
  BoyGroup strayKids = BoyGroup('스트레이키즈', 8);

  // 믹스인에 정의된 sing() 함수 사용 가능
  strayKids.sing();
}