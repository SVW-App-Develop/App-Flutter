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
- 제스처 : 사용자가 키보드로 글자를 입력하는 행위 외의 모든 입력

  - ex) 화면을 한 번 탭, 두 번 탭, 길게 누르는 행동 등
 
- GestureDetector 위젯은 모든 제스처를 매개변수로 제공

- 제스처 관련 위젯은 하위 위젯에 탭이나 드래그처럼 특정 제스처가 입력됐을 때 인지하고 콜백 함수 실행

- Button, IconButton, GestureDetector, FloatingActionButton 등

<br>

### 01. Button 위젯
- 플러터 머티리얼 패키지에서 기본 제공하는 버튼

- TextButton, OutlinedButton, ElevatedButton

  - 버튼을 누르면 색이 변경되는 리플 효과 지원
 
<br>

|TextButton|OutlinedButton|ElevatedBotton|
|:-:|:-:|:-:|
|텍스트만 있는 버튼|테두리가 있는 버튼|입체적으로 튀어나온 배경이 들어간 버튼|
|![이미지](./img/05.png)|![이미지](./img/06.png)|![이미지](./img/07.png)|

<br>

> lib/06/05.dart
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
            child: TextButton(
              // 클릭 시 실행
              onPressed: () {},
              // 스타일 지정
              style: TextButton.styleFrom(
                // 주색상 지정
                foregroundColor: Colors.pink,
              ),
              // 버튼에 넣을 위젯
              child: Text('텍스트 버튼'),
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
|![이미지](./img/05.png)|

<br>

> lib/06/06.dart
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
            child: OutlinedButton(
              // 클릭 시 실행할 함수
              onPressed: () {},
              // 버튼 스타일
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.pink,
              ),
              // 버튼에 들어갈 위젯
              child: Text('아웃라인드 버튼'),
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
|![이미지](./img/06.png)|

<br>

> lib/06/07.dart
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
            child: ElevatedButton(
              // 클릭 시 실행할 함수
              onPressed: () {},
              // 버튼 스타일링
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              // 버튼에 들어갈 위젯
              child: Text('엘리베이티드 버튼'),
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
|![이미지](./img/07.png)|

<br>

### 02. IconButton 위젯
- 아이콘을 버튼으로 생성하는 위젯

- icon 매개변수에 보여주고 싶은 아이콘을 넣을 수 있음

- onPressed 매개변수에 IconButton 을 누르면 실행할 콜백 함수 제공 가능

- 아이콘은 글리프(glyph) 기반의 아이콘 사용 가능

- Icons 클래스를 통해 플러터에서 제공하는 기본 아이콘들 사용 가능

> lib/06/08.dart
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
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                // 플러터에서 기본으로 제공하는 아이콘
                Icons.home,
              ),
            ),
          ),
        ),
      );
    }
  }
```
- [제공되는 아이콘 목록](https://fonts.google.com/icons)

> 실행 결과

|-|
|-|
|![이미지](./img/08.png)|

<br>

### 03. GestureDetector 위젯
- 손가락으로 하는 여러 가지 입력을 인지하는 위젯

  - 앱은 모든 입력은 손가락으로 함

> lib/06/09.dart
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
            child: GestureDetector(
              // 한 번 탭했을 때 실행 함수
              onTap: () {
                // 출력 결과는 안드로이드 스튜디오의 [Run] 탭에서 확인 가능
                print('on tap');
              },
              // 두 번 탭했을 때 실행할 함수
              onDoubleTap: () {
                print('on double tap');
              },
              // 길게 눌렀을 때 실행할 함수
              onLongPress: () {
                print('on long press');
              },
              // 제스처를 적용할 위젯
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                ),
                width: 100.0,
                height: 100.0,
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
|:-:|
|![이미지](./img/09.png)|
|![이미지](./img/10.png)|

<br>

#### 💡 GestureDetector 위젯에서 제공하는 중요한 제스처 매개변수

|매개변수|설명|
|-|-|
|onTap|한 번 탭했을 때 실행되는 함수 입력|
|onDoubleTap|두 번 연속으로 탭했을 때 실행되는 함수 입력|
|onLongPress|길게 누르기가 인식됐을 때 실행되는 함수 입력|
|onPanStart|수평 또는 수직으로 드래그가 시작됐을 때 실행되는 함수 입력|
|onPanUpdate|수평 또는 수직으로 드래그 하는 동안 드래그 위치가 업데이트될 때마다 실행되는 함수 입력|
|onPanEnd|수평 또는 수직으로 드래그가 끝났을 때 실행되는 함수 입력|
|onHorizontalDragStart|수평으로 드래그를 시작했을 때 실행되는 함수 입력|
|onHorizontalDragUpdate|수평으로 드래그 하는 동안 드래그 위치가 업데이트될 때마다 실행되는 함수 입력|
|onHorizontalDragEnd|수평으로 드래그가 끝났을 때 실행되는 함수 입력|
|onVerticalDragStart|수직으로 드래그를 시작했을 때 실행되는 함수 입력|
|onVerticalDragUpdate|수직으로 드래그 하는 동안 드래그 위치가 업데이트될 때마다 실행되는 함수 입력|
|onVerticalDragEnd|수직으로 드래그가 끝났을 때 실행되는 함수 입력|
|onScaleUpdate|확대가 시작됐을 때 실행되는 함수 입력|
|onScaleUpdate|확대가 진행되는 동안 확대가 업데이트될 때마다 실행되는 함수 입력|
|onScaleEnd|확대가 끝났을 때 실행되는 함수 입력|

<br>

### 04. FloatingActionButton 위젯
- Material Design 에서 추구하는 버튼 형태

- 안드로이드 앱 화면의 오른쪽 아래 동그란 플로팅 작업 버튼 구현 가능

  - FloatingActionButton, Scaffold 같이 사용

> lib/06/10.dart
```dart
  import 'package:flutter/material.dart';
  
  void main() {
    runApp(
      FloatingActionButtonExample()
    );
  }
  
  class FloatingActionButtonExample extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            // 클릭했을 때 실행할 함수
            onPressed: () {},
            child: Text('클릭'),
          ),
          body: Container(),
        ),
      );
    }
  }
```

> 실행 결과

|-|
|-|
|![이미지](./img/11.png)|

<br>

---

<br>

6.5 디자인 관련 위젯
---








