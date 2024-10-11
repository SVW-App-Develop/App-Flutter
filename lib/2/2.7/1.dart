// abstract 키워드를 사용해 추상 클래스 지정
abstract class Idol {
  final String name;
  final int membersCount;

  Idol(this.name, this.membersCount);   // 생성자 선언

  void sayName();           // 추상 메서드 선언
  void sayMembersCount();   // 추상 메서드 선언
}

// implements 키워드를 사용해 추상 클래스를 구현하는 클래스
class BoyGroup implements Idol {
  final String name;
  final int membersCount;

  BoyGroup(this.name, this.membersCount);

  void sayName(){
    print('그는 남자 아이돌 ${this.name} 입니다');
  }

  void sayMembersCount(){
    print('${this.name} 멤버는 ${this.membersCount}명입니다');
  }
}

void main(){
  BoyGroup strayKids = BoyGroup('스트레이키즈', 8);

  strayKids.sayName();
  strayKids.sayMembersCount();
}