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
> lib/4.1/1.dart
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

> lib/4.1/2.dart
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

> lib/4.1/3.dart
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

> lib/4.1/4.dart
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

> lib/4.1/5.dart
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








































