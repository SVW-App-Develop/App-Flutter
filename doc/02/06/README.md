# 6단계 : 기본 위젯
- 플러터는 화면에 그려지는 모든 요소가 위젯으로 구성됨

<br>

6.1 위젯
---
- Everythind is a Widget

  - 플러터 소개 문구 (모든 것은 위젯이다)
 
- 현재 주어진 상태(state, 데이터) 기반으로 어떤 UI 구현할지 정의

- 자식을 하나만 갖는 위젯

  - 대체로 child 매개변수 입력받음
 
  - Container 위젯

    - 자식을 담는 컨테이너 역할
   
    - 배경색, 너비, 높이, 테두리 등 디자인 지정 가능
   
  - GestureDetector 위젯
 
    - 플러터에서 제공하는 제스처 기능을 자식 위젯에서 인식하는 위젯
   
    - 탭, 드래그, 더블클릭 등 제스처 기능이 자식 위젯에 인식됐을 때 함수 실행
   
  - SizedBox 위젯
 
    - 높이와 너비를 지정하는 위젯
   
    - Container 위젯과 다르게 디자인적 요소는 적용 불가
   
    - const 생성자로 선언 가능 ⇒ 퍼포먼스 측면에서 더 효율적

- 자식을 여럿 갖는 위젯

  - children 매개변수를 입력받음
 
  - 리스트로 여러 위젯 입력 가능
 
    - Column 위젯
   
      - children 매개변수에 입력된 모든 위젯들을 세로로 배치
     
    - Row 위젯
   
      - children 매개변수에 입력된 모든 위젯들을 가로로 배치
     
    - ListView 위젯
   
      - 리스트 구현시 사용
     
      - children 매개변수에 다수의 위젯 입력 가능
     
      - 입력된 위젯이 화면을 벗어나게 되면 스크롤 가능
     
- child 와 children 매개변수에 지속적으로 하위 위젯 입력시 트리 위젯 계층

  - UI 를 위젯 트리로 그릴 수 있어야 플러터 앱 프로그래밍 가능

- [플러터에서 기본으로 제공하는 위젯들](https://flutter.dev/docs/development/ui/widgets)

<br>

|-|
|-|
|![이미지](./img/01.png)|

<br>

### 01. Children, Child 차이점
- 플러터는 위젯 아래에 계속 위젯이 입력되는 형태

  - 위젯 트리를 구성하여 UI 제작
 
- Child 매개변수, Children 매개변수는 위젯에 하위 위젯 추가시 사용

  - 둘 중 하나만 제공(동시에 입력받는 위젯은 존재 X)


> lib/06/01.dart
```dart
  import 'package:flutter/material.dart';
  
  void main() {
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            // 하나의 위젯만 가운데 정렬 가능
            child: Text('우리의 새벽은 낮보다 뜨겁다'),
          ),
        ),
      ),
    );
  }
```

> 실행 결과

|-|
|-|
|![이미지](./img/02.png)|

<br>

> lib/06/02.dart
```dart
  import 'package:flutter/material.dart';
  
  void main() {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
  
              // 여러 위젯을 Column 위젯에 입력 가능
              children: [
                Text('우리의'),
                Text('새벽은'),
                Text('낮보다'),
                Text('뜨겁다'),
              ],
            ),
          ),
        ),
      ),
    );
  }
```
- children 매개변수는 리스트를 입력받고 리스트 안에는 원하는 만큼 위젯 입력 가능

> 실행 결과

|-|
|-|
|![이미지](./img/03.png)|

<br>

---

<br>

6.2 위젯 실습용 템플릿 작성
---
- 위젯들을 화면에 구현하기 위한 기본 코드 템플릿

  - child 매개변수에 예제 작성

> lib/06/03.dart
```dart
  import 'package:flutter/material.dart';
  
  void main(){
    runApp(
      MyApp()
    );
  }
  
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('토리'),  // 여기에 예제 코드 작성하기
          ),
        ),
      );
    }
  }
```

<br>

---

<br>

6.3 텍스트 관련 위젯
---
- 화면에 글자를 보여주려면 글자를 렌더링할 수 있는 위젯 사용

  - Text 위젯
 
    - 글자를 적고 스타일링하는 위젯
   
    - 첫 번째 포지셔널 파라미터에 원하는 문자열 작성
   
    - style 이라는 네임드 파라미터를 사용해 스타일 지정

> lib/06/04.dart
```dart
  import 'package:flutter/material.dart';
  
  void main(){
    runApp(
        MyApp()
    );
  }
  
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              // 작성하고 싶은 글
              '우리의 새벽은 낮보다 뜨겁다',
              // 글자에 스타일 적용
              style: TextStyle(
                // 글자 크기
                fontSize: 16.0,
                // 글자 굵기
                fontWeight: FontWeight.w700,
                // 글자 색상
                color: Colors.blue,
              ),
            ),
          ),
        ),
      );
    }
  }
```

> 실행 결과

|-|
|-|
|![이미지](./img/04.png)|

<br>

#### 💡 플러터는 RichText 위젯과 Paragraph 같은 클래스도 제공
- [참고](https://docs.flutter.dev/development/ui/widgets/text)

<br>

#### 💡 예제 실행시 발생하는 워닝
- use key in widget constructors(위젯 생성자에 키 값을 포함하라)

- prefer const with constant constructors(const 생성자를 사용할 수 있으면 const 생성자를 사용하라)

- 워닝은 프로그램을 실행하는 데 문제는 없지만 변경해주면 성능 향상 or 코드 관리 유리


<br>

---

<br>

6.4 제스처 관련 위젯
---












