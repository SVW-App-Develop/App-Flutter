# 4단계 : 다트 3.0 신규 문법
> 다트 언어의 메이저 버전이 3으로 업데이트되면서 신규 문법 추가

<br>

4.1 레코드(record)
---
- 다트 3.0 이상부터 사용할 수 있는 새로운 타입

- 포지셔널 파라미터(positional parameter)나 네임드 파라미터(named parameter) 중 한 가지 방식 적용하여 사용

  - 괄호 안에 쉼표로 구분하여 작성
 
<br>

### 01. 포지셔널 파라미터를 이용한 레코드
- 포지셔널 파라미터로 표시한 타입 순서를 반드시 지켜야 함
> lib/4/4.1/1.dart
```dart
  void main() {
    // 정확한 위치에 어떤 타입의 값이 입력될지 지정 가능
    // (String, int) : 첫 번째 값은 String 타입, 두 번째 값은 int 타입
    (String, int) jeonghan = ('정한', 30);
    // ('정한', 20) 출력
    print(jeonghan);
  }
```

> 실행 결과
```
  (정한, 30)
```

<br>

> lib/4/4.1/2.dart
```dart
  void main() {
    // Invalid Assignment 에러
    // 레코드에 정의한 순서대로 타입을 입력하지 않으면 에러 발생
    (String, int) jeonghan = (30, '정한');
    print(jeonghan);
  }
```

> 실행 결과
```
  lib/4.1/2.dart:4:28: Error: A value of type '(int, String)' can't be assigned to a variable of type '(String, int)'.
    (String, int) jeonghan = (30, '정한');
                             ^
```

<br>

> lib/4/4.1/3.dart
```dart
  void main() {
    // 두 개 이상 값 조합하여 레코드 생성 가능
    // 레코드에 정의할 수 있는 값의 개수 제한 X
    (String, int, bool) jeonghan = ('정한', 30, true);
    print(jeonghan);
  }
```

> 실행 결과
```
  (정한, 30, true)
```

<br>

> lib/4/4.1/4.dart
```dart
  void main() {
    // 레코드의 모든 값을 사용하지 않고 특정 순서의 레코드 값을 가져오고 싶다면 $ 사용
    (String, int, bool) jeonghan = ('정한', 30, true);
    print(jeonghan.$1);
    print(jeonghan.$2);
    print(jeonghan.$3);
  }
```

> 실행 결과
```
  정한
  30
  true
```

<br>

### 02. 네임드 파라미터를 이용한 레코드
- 포지셔널 파라미터와는 다르게 입력 순서를 지킬 필요 X

- 소괄호에 중괄호를 중첩하여 타입과 변수 이름을 쉼표로 구분하고 명시해줘야 함

> lib/4/4.1/5.dart
```dart
  void main() {
    // 네임드 파라미터 형태로 Record 선언하는 방법
    // 다른 네임드 파라미터와 마찬가지로 순서는 상관 X
    ({String name, int age}) jeonghan = (name : '정한', age : 30);
    print(jeonghan);
  }
```

> 실행 결과
```
  (age: 30, name: 정한)
```

<br>

---

<br>

4.2 구조 분해(destructuring)
---
- 값을 반환받을 때 단순히 하나의 변수로 받아오지 않음

  - 반환된 타입을 그대로 복제해 타입 내부에 각각의 값을 직접 추출해오는 문법

<br>

### 01. 리스트에서의 구조 분해 사용 예제
> lib/4/4.2/1.dart
```dart
  void main(){
    // 아래 코드와 같지만 구조 분해를 사용하면 한 줄에 해결 가능
    // final strayKids = ['한', '용복'];
    // final han = strayKids[0];
    // final yongbok = strayKids[1];
    final [han, yongbok] = ['한', '용복'];
  
    // 한 출력
    print(han);
    // 용복 출력
    print(yongbok);
  }
```

> 실행 결과
```
  한
  용복
```

<br>

### 02. 리스트에서의 스프레드 연산자를 이용한 구조 분해 사용 예제
> lib/4/4.2/2.dart
```dart
  void main(){
    final numbers = [1, 2, 3, 4, 5, 6, 7, 8];
  
    // 스프레드 연산자를 사용하게 되면 종간의 값들을 버릴 수 있음
    final [x, y, ..., z] = numbers;
  
    print(x);
    print(y);
    print(z);
  }
```

> 실행 결과
```
  1
  2
  8
```

<br>

### 03. 맵에서의 구조 분해 사용 예제
> lib/4/4.2/3.dart
```dart
  void main(){
    final jeonghanMap = {'name':'정한', 'age':30};
    // 위의 맵 구조와 똑같은 구조로 구조 분해
    final {'name':name, 'age':age} = jeonghanMap;
  
    print('name : $name');
    print('age : $age');
  }
```

> 실행 결과
```
  name : 정한
  age : 30
```

<br>

### 04. 클래스에서의 구조 분해 사용 예제
> lib/4/4.2/4.dart
```dart
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
```

> 실행 결과
```
  정한
  30
```

<br>

---

<br>

4.3 switch 문
---
- 다트 언어가 3.0 버전으로 업데이트되면서 네 가지 추가

  - 스위치 표현식(switch expression)
 
  - 패턴 매칭(pattern matching)
 
  - 완전 확인(exhaustiveness checking)
 
  - 가드 절(guard clause)

<br>

### 01. 표현식 기능
- 코드 = 표현식(expression) + 문(statement)

  - 표현식 : 어떠한 값을 만들어내는 코드
 
    - ex) 1 + 1 은 값 2 를 만드는 표현식
   
    - 표현식이 평가되면 새로운 값을 생성하거나 기존 값 참조
   
  - 문 : 기본 단위이자 가장 작은 코드 실행 단위
 
    - 컴퓨터에 내리는 명령
   
  - 표현식 여러 개가 모여 문이 되고, 문에는 선언문, 할당문, 반복문 등이 있음
 
- 다트 3.0 부터 switch 문을 함수처럼 사용하여 직접 값을 반환받을 수 있는 절 기능 추가

> lib/4/4.3/1.dart
```dart
  void main(){
    String dayKor = '월요일';
  
    // switch 문이 함수처럼 값을 반환
    String dayEnglish = switch (dayKor) {
      // '=>' 를 사용하면 switch 문 조건에 맞을 때 값 반환 가능
      '월요일' => 'Monday',
      '화요일' => 'Tuesday',
      '수요일' => 'Wednesday',
      '목요일' => 'Thursday',
      '금요일' => 'Friday',
      '토요일' => 'Saturday',
      '일요일' => 'Sunday',
      // _ 는 default 와 같은 의미로 사용됨
      _ => 'Not Found',
    };
  
    print(dayEnglish);
  }
```

> 실행 결과
```
  Monday
```

<br>

### 02. 패턴 매칭(pattern matching)
- 더욱 복잡한 조건을 형성할 수 있음
> lib/4/4.3/2.dart
```dart
  void switcher(dynamic anything){
    switch (anything) {
      // 정확히 'aaa' 문자열만 매치
      case 'aaa' :
        print('match : aaa');
        break;
      // 정확히 [1, 2] 리스트만 매치
      case [1, 2] :
        print('match : [1, 2]');
        break;
      // 3개의 값이 들어 있는 리스트를 모두 매치
      case [_, _, _] :
        print('match : [_, _, _]');
        break;
      // 첫 번째와 두 번째 값에 int 가 입력된 리스트를 매치
      case [int a, int b] :
        print('match : [int $a, int $b]');
        break;
      // 첫 번째 값에 String, 두 번째 값에 int 가 입력된 Record 타입을 매치
      case (String a, int b) :
        print('match : (String : $a, int : $b)');
        break;
      // 아무것도 매치되지 않을 경우 실행
      default :
        print('no match');
    }
  }
  
  void main(){
    switcher('aaa');
    switcher([1, 2]);
    switcher([3, 4, 5]);
    switcher([6, 7]);
    switcher(('정한', 30));
    switcher(8);
  }
```

> 실행 결과
```
  match : aaa
  match : [1, 2]
  match : [_, _, _]
  match : [int 6, int 7]
  match : (String : 정한, int : 30)
  no match
```

<br>

### 03. 엄격한 검사(exhausitiveness checking)
- 코드가 입력받을 수 있는 모든 조건을 전부 확인하고 있는지 체크하는 기술

> lib/4/4.3/3.dart
```dart
  void main(){
    // val 에 입력될 수 있는 값은 true, false, null
    bool? val;
  
    // null 조건을 입력하지 않아 non exhaustive switch statement 에러 발생
    // null case 추가하거나 default case 추가시 에러 사라짐
    switch(val){
      case true:
        print('true');
      case false:
        print('false');
    };
  }
```

> 실행 결과
```
  lib/4/4.3/3.dart:7:10: Error: The type 'bool?' is not exhaustively matched by the switch cases since it doesn't match 'null'.
  Try adding a default case or cases that match 'null'.
    switch(val){
           ^
```

<br>

### 04. 보호 구문(guard clause)
- when 키워드

  - boolean 으로 반환할 조건을 각 case 문에 추가 가능
 
  - when 키워드 뒤에 오는 조건이 true 를 반환하지 않으면 case 매치 안됨

> lib/4/4.3/4.dart
```dart
  void main(){
    (int a, int b) val = (1, -1);   // (int, int) 타입의 val 선언하고 (1, -1)로 초기화
  
    switch(val){          // `val`을 평가하는 switch 문 시작
      case (1, _) when val.$2 > 0 : // `val`의 첫 번째 요소가 1이고 두 번째 요소가 0보다 큰지 검사
        print('1, _');    // 조건이 만족되면 '1, _' 출력
        break;            // switch 문 종료
      default :           // 어떤 경우도 일치하지 않을 때 실행되는 블록
        print('default'); // 다른 케이스가 만족되지 않으면 'default' 출력
    }
  }
```

> 실행 결과
```
  default
```

<br>

---

<br>

4.4 클래스 제한자(class modifiers)
---
- base, final, interface, sealed, mixin 등이 추가됨

- 모든 클래스 제한자는 class 키워드 앞에 명시

  - 클래스 제한자를 명시한 클래스는 해당 클래스를 사용하는 파일이 아닌 다른 파일에 선언해야 정상으로 기능 작동

<br>

### 01. base 제한자
- base 클래스의 기능을 강제하는 제한자

- 해당 클래스는 오직 상속만 할 수 있음

- base 클래스가 아닌 자식 클래스는 꼭 base, final, sealed 제한자를 함께 사용해야 함

> lib/4/4.4/1_a.dart
```dart
  base class Parent{}
```

> lib/4/4.4/1_b.dart
```dart
  import '1_a.dart';
  
  // 인스턴스화 가능
  Parent parent = Parent();
  
  // 기능
  base class Child extends Parent{}
  
  // subtype of base or final is not base final or sealed 에러 발생
  // base / sealed / final 제한자 중 하나가 필요
  class Child2 extends Parent{}
  
  // subtype of base or final is not base final or sealed 에러 발생
  // base 클래스는 implement 불가능
  class Child3 implements Parent{}
```

<br>

### 02. final 제한지
- 같은 파일에서 상속(extend)과 재정의(implement) 가능

  - 외부 파일에서는 불가
 
- final 제한자는 base 제한자의 기능을 모두 포함

> lib/4/4.4/2_a.dart
```dart
  final class Parent{}
```

> lib/4/4.4/2_b.dart
```dart
  import '2_a.dart';
  
  // 인스턴스화 가능
  Parent parent = Parent();
  
  // extend 불가능
  class Child1 extends Parent{}
  
  // implement 불가능
  class Child2 implements Parent{}
```

<br>

### 03. interface 제한지
- 클래스를 외부 파일에서 상속받지 못하고 재정의만 할 수 있도록 제한하는 역할

> lib/4/4.4/3_a.dart
```dart  
  interface class Parent{}
```

> lib/4/4.4/3_b.dart
```dart
  import '3_a.dart';
  
  // 인스턴스화 가능
  Parent parent = Parent();
  
  // extend 불가능
  class Child1 extends Parent{}
  
  // implement 가능
  class Child2 implements Parent{}
```

<br>

### 04. sealed 제한자
- sealed 클래스를 파일 외부에서 상속, 재정의, 인스턴스화할 수 없도록 제한

> lib/4/4.4/4_a.dart
```dart
  sealed class Parent{}
```

> lib/4/4.4/4_b.dart
```dart
  import '4_a.dart';
  
  // 인스턴스화 불가능
  Parent parent = Parent();
  
  // extend 불가능
  class Child1 extends Parent{}
  
  // implement 가능
  class Child2 implements Parent{}
```

<br>

### 05. mixin 제한자
- 일반 mixin 과 같은 역할을 하면서도 상속 가능

> lib/4/4.4/5.dart
```dart
  mixin class MixinExample{}
  
  // extend 가능
  class Child1 extends MixinExample{}
  
  // mixin 으로 사용 가능
  class Child2 with MixinExample{}
```

<br>

🚨 핵심 요약
---
- **레코드**는 새로운 타입으로 네임드 파라미터와 포지셔널 파라미터가 있음

- **구조 분해**는 타입 내부의 각각의 값을 직접 추출해오는 문법

- **switch 문**에 표현식, 패턴 매칭, 완전 확인, 가드 절 추가

  - 다양한 방법으로 조건 확인 가능
 
- 객체지향 프로그래밍 언어의 특징 중 하나인 클래스의 고유성을 위한 **클래스 제한자** 추가

<br>








