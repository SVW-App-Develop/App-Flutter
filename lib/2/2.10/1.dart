class Idol {
  final String name;
  final int membersCount;

  Idol(this.name, this.membersCount);

  void sayName(){
    print('그는 ${this.name} 입니다');
  }

  void sayMembersCount() {
    print('${this.name} 멤버는 ${this.membersCount}명입니다');
  }
}

void main() {
  // cascade operator (..) 사용하면
  // 선언한 변수의 메서드를 연속으로 실행 가능
  Idol strayKids = Idol('스트레이키즈', 8)
    ..sayName()
    ..sayMembersCount();
}