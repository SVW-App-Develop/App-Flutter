class Idol {
  final String name;        // Idol 클래스의 멤버변수
  final int membersCount;   // Idol 클래스의 멤버변수

  Idol(this.name, this.membersCount);

  void sayName() {          // Idol 클래스의 메서드
    print('그는 ${this.name} 입니다');
  }

  void sayMembersCount() {  // Idol 클래스의 메서드
    print('${this.name} 멤버는 ${this.membersCount}명 입니다');
  }
}

// Idol 클래스를 상속하는 BoyGroup 클래스 생성
// extends 키워드르 사용해 상속받음
// 'class 자식 크래스 extends 부모 클래스' 형식
class BoyGroup extends Idol {
  // 상속받은 생성자
  BoyGroup(
      String name,
      int membersCount,
      ) : super(      // super 는 부모 클래스를 지칭함
      name,
      membersCount
  );

  // 상속받지 않은 기능
  void sayMale() {
    print('그는 남자 아이돌입니다');
  }
}

class GirlGroup extends Idol {
  GirlGroup(
      String name,
      int membersCount
      ) : super(
      name,
      membersCount
  );
}

void main() {
  BoyGroup strayKids = BoyGroup('스트레이키즈', 8);   // 생성자로 객체 생성

  strayKids.sayName();          // 부모한테 물려받은 메서드
  strayKids.sayMembersCount();  // 부모한테 물려받은 메서드
  strayKids.sayMale();          // 자식이 새로 추가한 메서드

  print('---------------------------------------------');

  GirlGroup ive = GirlGroup('아이브', 6);

  ive.sayName();
  ive.sayMembersCount();
  // ive.sayMale();             // Error: The method 'sayMale' isn't defined for the class 'GirlGroup'
}