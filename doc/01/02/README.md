# 2단계 : 다트 객체지향 프로그래밍
> 다트 언어는 높은 완성도로 객체지향 프로그래밍 지원<br>
> 플러터는 객체지향 프로그래밍(object-oriented programming, OOP) 중심으로 설계된 프레임워크

<br>

2.1 객체지향 프로그래밍의 필요성
---
- 변수와 메서드를 특정 클래스에 종속되게 코딩 가능

  - 클래스를 사용해서 서로 밀접한 관계가 있는 함수와 변수를 묶어두면 코드 관리 용이
 
  - 클래스 사용시 필요한 값들만 입력하도록 제한 + 클래스에 특화된 함수들 선언 가능
 
- 클래스 : 설계도, 데이터가 보유할 속성과 기능을 정의하는 자료구조

  - 인스턴스화되어야 실제 사용할 수 있는 데이터 생성됨
 
    - 인스턴스(instance) : 클래스를 이용해 객체 선언시 해당 객체를 클래스의 인스턴스라 칭함
   
    - 인스턴스화(instantiation) : 클래스에서 인스턴스(객체)를 생성하는 과정

<br>

2.2 객체지향 프로그래밍의 시작, 클래스
---
- 객체지향 프로그래밍의 기본은 클래스(class)로부터 시작됨

> 형식
```dart
  // class 키워드를 입력 후 클래스명을 지정해 클래스 선언
  class Idol {
    // 클래스에 종속되는 변수(멤버변수) 지정 가능
    String name = '스트레이키즈';
  
    // 클래스에 종속되는 함수(메서드) 지정 가능
        /* 참고
          * 함수는 메서드를 포함하는 더 큰 개념
          * 클래스에 정의된 함수인 메서드는 클래스의 기능을 정의한 함수
        * */
    void sayName(){
      // this 키워드 : 현재 클래스 의미
      // 클래스 내부의 속성(클래스에 종속되어 있는 값) 지칭하려면 this 키워드 사용
      // 결과적으로 this.name 은 Idol 클래스의 name 변수 지칭
      print('그는 ${this.name}입니다');
  
      // 스코프 안에 같은 속성 이름이 하나만 존재(함수 내부에 같은 이름의 변수가 없으면)한다면 this 생략 가능
      print('그는 $name입니다');
    }
  }
  
  void main() {
    // 변수 타입을 Idol 로 지정하고
    // Idol 인스턴스 생성 가능
    // 인스턴스 생성시 함수를 실행하는 것처럼
    // 인스턴스화하고 싶은 클래스명 뒤에 괄호 추가
    Idol strayKids = Idol();    // Idol 인스턴스 생성
  
    // 메서드 실행
    strayKids.sayName();
  }
```

> 실행 결과
```
  그는 스트레이키즈입니다    // this 를 사용한 출력
  그는 스트레이키즈입니다    // this 를 사용 안 한 출력
```

<br>

### 01. 생성자(constructor)
- 클래스의 인스턴스르 생성하는 메서드

- 클래스 하나로 여러 인스턴스를 생성해 중복 코딩 없이 활용 가능

> 형식
```dart
  class Idol {
    // 생성자에서 입력받는 변수들은 일반적으로 final 키워드 사용
    // 인스턴스화한 다음에 변수의 값을 변경하는 실수를 막기 위함
    final String name;
  
    // 생성자 선언
    // 클래스와 같은 이름이어야 함
    // 함수의 매개변수를 선언하는 것처럼 매개변수 지정
    // 네임드 파라미터 및 옵셔널 파라미터 사용 가능
    // : 기호 뒤에 입력받은 매개변수가 저장될 클래스 변수를 지정해줌
    Idol(String name) : this.name = name;
  
    void sayName() {
      print('그는 ${this.name}입니다');
    }
  }
  
  void main() {
    // name 에 '스트레이키즈' 저장
    Idol strayKids = Idol('스트레이키즈');
    strayKids.sayName();
  
    // name 에 'SEVENTEEN' 저장
    Idol seventeen = Idol('SEVENTEEN');
    seventeen.sayName();
  }
```

> 실행 결과
```
  그는 스트레이키즈입니다
  그는 SEVENTEEN입니다
```

<br>

- 생성자의 매개변수를 변수에 저장하는 과정을 생략하는 방법

> 형식
```dart
  class Idol {
    final String name;
  
    // this 를 사용할 경우
    // 해당되는 변수에 자동으로 매개변수가 저장됨
    Idol(this.name);
    
    void sayName() {
      print('그는 ${this.name}입니다');
    }
  }
```

<br>

### 02. 네임드 생성자(named constructor)
- 네임드 파라미터와 비슷한 개념

- 일반적으로 클래스를 생성하는 여러 방법을 명시하고 싶을 때 사용

  - 클래스를 여러 방식으로 인스턴스화할 때 유용하게 사용

> 형식
```dart
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
```

> 결과
```
  그는 스트레이키즈 입니다.스트레이키즈 멤버는 8명입니다.
  그는 SEVENTEEN 입니다.SEVENTEEN 멤버는 13명입니다.
```

<br>

### 03. 프라이빗 변수(private variable)
- 다른 언어와 정의가 약간 다름

  - 일반적 : 클래스 내부에서만 사용하는 변수
 
  - 다트 언어 : 같은 파일에서만 접근 가능한 변수

> 형식
```dart
  class Idol {
    // '_'로 변수명을 시작하면 프라이빗 변수 선언 가능
    String _name;
  
    Idol(this._name);
  }
  
  void main() {
    Idol strayKids = Idol('스트레이키즈');
  
    // 같은 파일에서는 _name 변수에 접근 가능
    // 다른 파일에서는 _name 변수에 접근 불가
    print(strayKids._name);
  }
```

> 실행 결과
```
  스트레이키즈
```

<br>

### 04. 게터(getter) / 세터(setter)
- 게터 : 값을 가져올 때 사용

- 세터 : 값을 지정할 때 사용

- 가변(mutalbe) 변수를 선언해도 직접 값을 가져오거나 지정할 수 있는데 게터/세터 사용 이유?

  - 게터 / 세터 사용시 어떤 값이 노출되고 어떤 형태로 노출될지, 어떤 변수를 변경 가능하게 할지 유연하게 정할 수 있음

- 최근 변수의 값에 불변성(Immutable : 인스턴스화 후 변경할 수 없는)을 특성으로 사용

  - 세터는 거의 사용 X
 
- 게터와 세터는 모두 변수처럼 사용하면 됨

  - 사용할 때 메서드명 뒤에 () X
 
> 형식
```dart
  class Idol {
    String _name = '스트레이키즈';
  
    // get 키워드를 사용해서 게터임을 명시
    // 게터는 메서드와 다르게 매개변수를 전혀 받지 않음
    String get name {
      return this._name;
    }
  
    // 세터는 set 이라는 키워드를 사용해서 선언
    // 세터는 매개변수로 딱 하나의 변수를 받을 수 있음
    set name(String name) {
      this._name = name;
    }
  }
  
  void main() {
    Idol strayKids = Idol();
    strayKids.name = '세븐틴';   // 세터
    print(strayKids.name);      // 게터
    // _name 초기값은 '스트레이키즈'
    // 세터로 '세븐틴' 대입하고 게터로 확인해보니 '세븐틴'으로 저장되어 있음
  }
```

> 실행 결과
```
  세븐틴
```

<br>

---

<br>

2.3 상속(inheritance)
---
- extends 키워드를 사용해 상속 가능

  - {class 자식 클래스 extends 부모 클래스}

- 어떤 클래스의 기능을 다른 클래스가 사용할 수 있게 하는 기법

  - 부모 클래스 : 기능을 물려주는 클래스
 
  - 자식 클래스 : 물려받는 클래스
 
    - 자식 클래스는 부모 클래스의 모든 기능을 상속받음
   
- super : 상속한 부모 클래스 지칭

- 부모 클래스에 기본 생성자가 있으면 자식 클래스에서는 부모 클래스의 생성자르 실행해줘야 함

  - 그렇지 않으면 부모 클래스의 모든 기능을 상속받아도 변수값들을 설정하지 않아 기능 사용 불가
 
- 상속받지 않은 메서드나 변수 새로 추가 가능

- 부모 클래스에 공통으로 사용하는 변수와 메서드를 정의해 상속받으면 자식 코드들은 해당 값을 사용 가능

  - 중복 코딩 방지
 
- 부모가 같더라도 다른 자식 클래스에서 새로 추가한 메서드는 호출 불가

> 형식
```dart
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
```

> 실행 결과
```
  그는 스트레이키즈 입니다
  스트레이키즈 멤버는 8명 입니다
  그는 남자 아이돌입니다
  ---------------------------------------------
  그는 아이브 입니다
  아이브 멤버는 6명 입니다
```

<br>

---

<br>

2.4 오버라이드(override)
---
- 부모 클래스 또는 인터페이스에 정의된 메서드를 재정의할 때 사용

- 다트에서는 override 키워드 생략 가능

  - 키워드 사용하지 않고도 메서드 재정의 가능

> 형식
```dart

```

> 실행 결과
```

```

<br>

















