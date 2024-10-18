# 10단계 : D-Day
- 상태 관리, CupertinoDatePicker, Dialog, DateTime

  - StatefulWidget 이용한 상태 관리
 
    - setState() 함수를 사용한 상태 관리
   
  - 쿠퍼티노(cupertino) 위젯
 
    - 다이얼로그(dialog) 및 데이터픽커(datepicker) 를 Cupertino 위젯을 사용해 구현
 
- 플러터의 두 가지 디자인 시스템

  - Marterial 위젯 : 구글의 머티리얼 디자인 기반
 
  - Cuperino 위젯 : iOS 스타일의 디자인

- [실습 프로젝트 바로가기](https://github.com/SVW-App-Develop/U_And_I.git)

<br>

|개요|설명|
|-|-|
|**프로젝트명**|u_and_i|
|**개발환경**|플러터 SDK : 3.24.3|
|**미션**|날짜를 지정하고 해당 날짜로부터 며칠이 지났는지 알려주는 앱 만들기|
|**기능**|- 사용자가 직접 원하는 날짜 선택<br><br>- 날짜 선택 시 실시간으로 화면의 D-Day 및 만난 날 업데이트|
|**조작법**|1. 가운데 하트 클릭해서 날짜 선택 기능 실행<br><br>2. 연도, 월, 일을 스크롤해서 원하는 날짜 선택<br><br>3. 배경을 눌러서 날짜 저장하기 및 되돌아오기|
|**핵심 구성요소**|- Cupertino Widget<br><br>- CupertinoDatePicker<br><br>- Dialog<br><br>- StatefulWidget 상태 관리|
|**플러그인**|-|

<br>

---

<br>

10.1 사전 지식
---
### 01. setState() 함수
- State 를 상속하는 모든 클래스는 setState() 함수 사용 가능

- setState() 함수 실행 과정

  - StatefulWidget 렌더링 끝나고 클린(clean) 상태
 
    - 그 어떤 상태 변경 툴을 사용하든 클린 상태에서 상태를 변경해야 함
   
  - setState() 실행해 원하는 속성들 변경
 
  - 속성이 변경되고 위젯의 상태가 더티(dirty)로 설정
 
  - build() 함수 재실행
 
  - State 가 클린 상태로 되돌아옴

- setState() 실행 방법

  - 첫 번째 매개변수 : 상태(변수) 값을 변경하는 로직(콜백 함수) 작성
 
    - 콜백 함수에 변경하고 싶은 속성들 입력
   
      - 콜백 함수 비동기 작성 불가
     
```dart
  setState((){    // 실행
    number++;
  });
```

<br>

### 02. showCupertinoDialog() 함수
- 다이얼로그를 실행하는 함수

  - iOS 스타일로 다이얼로그 실행
 
  - 실행 시 모든 애니메이션과 작동이 iOS 스타일로 적용
 
- 배리어(barrier) : 플러터에서 다이얼로그 위젯 외에 흐림 처리가 된 부분

  - barrierDismissible: true
 
    - 배리어를 눌렀을 때 다이얼로그가 닫힘
   
  - barrierDismissible: false
 
    - 배리어를 눌렀을 때 다이얼로그가 닫히지 않음

```dart
  import 'package:flutter/cupertino.dart';    // Cupertino 패키지 임포트 필수
  
  showCupertinoDialog(    // Cupertino 다이얼로그 실행
    context: context,     // BuildContext 입력 (모든 showDialog() 형태 함수들은 BuildContext 입력 필수)
    barrierDismissible: true,   // 외부 탭해서 다이얼로그 닫을 수 있게 하기
    builder: (BuildContext context) {   // 다이얼로그에 들어갈 위젯
      return Text('Dialog');
    },
  );
```

<br>

---

<br>

10.2 사전 준비
---
### 01. 이미지, 폰트 추가
- [asset] 폴더 아래 [font], [img] 폴더 생성

  - 적용할 이미지와 폰트를 각 폴더에 복사

<br>

### 02. pubspec.yaml 설정
- 에셋 파일 : flutter 키의 assets 키에 입력

- 폰트 파일 : flutter 키의 fonts 키에 입력

> pubspec.yaml
```dart
  flutter:
  
    # The following line ensures that the Material Icons font is
    # included with your application, so that you can use the icons in
    # the material Icons class.
    uses-material-design: true
    assets:
      - asset/img/    # 이미지를 프로젝트에 포함시키기
        
    fonts:
      - family: parisienne    # family 키에 폰트 이름 지정 가능
        fonts:
          - asset: asset/font/Parisienne-Reguilar.ttf   # 등록할 폰트 파일 위치
            
      - family: sunflower
        fonts:
          - asset: asset/font/Sunflower-Bold.ttf
          - asset: asset/font/Sunflower-Light.ttf
            weight: 500   
          - asset: asset/font/Sunflower-Medium.ttf
            weight: 700
            # weight : 폰트 두께. 같은 폰트라도 다른 두께를 표현하는 파일은 weight 값을 따로 표현해야 함
            #          100 ~ 900 사이 100 단위로 사용 가능, 숫자가 높을수록 두꺼운 값
            #          FontWeight 클래스 값과 같음(weight: 500 = FontWeight.w500)
```

|-|
|-|
|![이미지](./img/01.png)|

<br>

### 03. 프로젝트 초기화
- [lib] 폴더에 [screen] 폴더 생성 후 home_screen.dart 생성

  - 앱의 기본 홈 화면으로 사용할 HomeScreen 위젯(StatelessWidget) 생성

> lib/screen/home_screen.dart
```dart
  import 'package:flutter/material.dart';
  
  class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) : super(key: key);
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Text('Home Screen'),
      );
    }
  }
```

<br>

- lib/main.dart 파일에도 마찬가지로 HomeScreen 을 홈 위젯으로 등록

> lib/main.dart
```
  import 'package:flutter/material.dart';
  import 'package:u_and_i/screen/home_screen.dart';
  
  void main() {
    runApp(
      MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
```

<br>

---

<br>

### 10.3 레이아웃 구상
- Scaffold 위젯의 body 매개변수에 _DDay 위젯과 _CoupleIamge 위젯 두 가지를 위아래로 나눠 구현

- 홈스크린 말고도 CupertinoDialog 추가 구현

  - 중앙 하트 아이콘 클릭시 CupertinoDialog 실행되는 구조


<br>

---

<br>

### 10.4 구현
- UI 구현, 상태 관리 구현, 날짜 선택 기능 구현 순서로 진행

  - UI 먼저 작업해서 앱 전체의 틀을 잡고 상태 관리를 설정해서 날짜 데이터를 관리할 기반 잡기
 
  - 날짜 선택 기능을 추가해서 선택한 날짜에 따라 D-Day 계산 기능 구현

<br>

### 01. 홈 스크린 UI 구현
#### (1) 위젯을 두 위젯으로 나눠서 화면 구성

- HomeScreen 위쪽 반 : _DDay 위젯

- HomeScreen 아래쪽 반 : _CoupleImage 위젯

  - 이름 첫 글자가 언더스코어면 다른 파일에서 접근 불가
 
    - 파일 불러오기 했을 때 불필요한 값들이 한 번에 불러와지는 것 방지

> lib/screen/home_screen.dart
```dart
  import 'package:flutter/material.dart';
  
  // HomeScreen 위젯
  class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Text('Home Screen'),
      );
    }
  }
  
  // HomeScreen 위쪽을 구현할 _DDay 위젯 생성
  class _DDay extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Text('DDay Widget');
    }
  }
  
  // HomeScreen 아래쪽을 구현할 _CoupleImage 위젯 생성
  class _CoupleImage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Text('Couple Image Widget');
    }
  }
```

<br>

#### (2) 두 위젯을 위아래로 서로 반씩 차지하게 배치

- HomeScreen 위젯에 Column 위젯을 사용해 두 위젯이 위아래에 놓이게 배치

> lib/screen/home_screen.dart
```dart
  import 'package:flutter/material.dart';
  
  class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(     // 시스템 UI 피해서 UI 그리기
          top: true,
          bottom: false,
          child: Column(
            // 위아래 끝에 위젯 배치
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            // 반대축 최대 크기로 늘릭
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DDay(),
              _CoupleImage(),
            ],
          ),
        ),
      );
    }
  }
  
  class _DDay extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Text('DDay Widget');
    }
  }
  
  class _CoupleImage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Text('Couple Image Widget');
    }
  }
```
- 아이폰의 노치에 대비해 위에는 SafeArea 적용, 자연스러운 이미지 구현을 위해 아래는 미적용

- MainAxisAlignment.spaceBetween 사용해 위아래 각각 끝에 두 위젯 위치

> 실행 결과

|-|
|-|
|![이미지](./img/02.png)|

<br>

#### (3) 배경색 및 이미지 적용
- MediaQuery.of(context) 사용하면 화면 크기와 관련된 각종 기능 사용 가능

  - size 게터를 불러오면 화면 전체의 너비(width)와 높이(height) 쉽게 가져올 수 있음
 
    - 화면의 전체 높이를 2로 나누면 화면 높이의 반만큼 차지하게 설정 가능

> lib/screen/home_screen.dart
```dart
  import 'package:flutter/material.dart';
  
  class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.pink[100],  // 핑크 배경색 적용
        body: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DDay(),
              _CoupleImage(),
            ],
          ),
        ),
      );
    }
  }
  
  class _DDay extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Text('DDay Widget');
    }
  }
  
  class _CoupleImage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Center(    // 이미지 중앙 정렬
        child: Image.asset('asset/img/middle_image.png',
          // 화면의 반만큼 높이 구현
          height: MediaQuery.of(context).size.height /2,
        ),
      );
    }
  }
```

> 실행 결과

|-|
|-|
|![이미지](./img/03.png)|

<br>

<details>
  <summary>💡 .of 생성자</summary>

<br>

- **.of(context)** 로 정의된 모든 생성자

  - 일반적으로 BuildContext 를 매개변수로 받음
  
  - 위젯 트리(widget tree)에서 가장 가까이에 있는 객체의 값 찾아냄

- MediaQuery.of(context) : 현재 위젯 트리에서 가장 가까이에 있는 MedianQuery 값 찾아냄

|-|
|-|
|![이미지](./img/04.png)|
|- 앱이 실행되면 MaterialApp 이 빌드됨과 동시에 MediaQuery 생성됨<br><br>- 위젯 트리 아래에서 MediaQuery.of(context) 실행시 위젯 트리를 올라가며 가장 가까운 곳에 위치한 MediaQuery 값 가져옴<br><br>- 비슷한 예로 Theme.of(context) / Navigator.of(context) 등|

</details>

<br>

#### (4) _DDay 위젯 구현
- _DDay 위젯은 여러 Text 위젯과 하트 아이콘(IconButton)으로 구성

> lib/screen/home_screen.dart
```dart
  import 'package:flutter/material.dart';
  
  class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.pink[100],  // 핑크 배경색 적용
        body: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DDay(),
              _CoupleImage(),
            ],
          ),
        ),
      );
    }
  }
  
  class _DDay extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          const SizedBox(height: 16.0),
          Text(   // 최상단 U&I 글자
            'U&I',
          ),
          const SizedBox(height: 16.0),
          Text(   // 두 번째 글자
            '우리 처음 만난 날',
          ),
          Text(   // 임시로 지정한 만날 날짜
            '2024.03.24',
          ),
          const SizedBox(height: 16.0),
          IconButton(   // 하트 아이콘 버튼
            iconSize: 60.0,
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(   // 만난 후 DDay
            'D+208'
          ),
        ],
      );
    }
  }
  
  class _CoupleImage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Center(    // 이미지 중앙 정렬
        child: Image.asset('asset/img/middle_image.png',
          // 화면의 반만큼 높이 구현
          height: MediaQuery.of(context).size.height /2,
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

#### (5) Text 위젯 스타일링
- Text 위젯 스타일링시 style 매개변수 사용

- 각 Text 위젯의 스타일이 아닌 Text 위젯의 기본 스타일 변경시 테마(theme) 사용

  - 13가지 Text 스타일을 따로 저장하여 프로젝트로 불러와서 사용 가능

- 각 문장들을 스타일별로 나누기

  - 스타일명은 임의적으로 지정 가능

> Flutter 2.5 이후 버전에서 TextTheme의 스타일 이름이 변경

|이전 스타일 이름|변경된 스타일 이름|
|:-:|:-:|
|headline1|displayLarge|
|headline2|displayMedium|
|headline3|displaySmall|
|headline4|headlineLarge|
|headline5|headlineMedium|
|headline6|headlineSmall|
|subtitle1|titleLarge|
|subtitle2|titleMedium|
|bodyText1|bodyLarge|
|bodyText2|bodyMedium|
|caption|bodySmall|
|button|labelLarge|
|overline|labelSmall|

|-|
|-|
|![이미지](./img/06.png)|

<br>
- main.dart 파일에 텍스트와 IconButton 테마 정의

> lib/main.dart
```dart
  import 'package:flutter/material.dart';
  import 'package:u_and_i/screen/home_screen.dart';
  
  void main() {
    runApp(
      MaterialApp(
        theme: ThemeData(   // 테마를 지정할 수 있는 클래스
          fontFamily: 'sunflower',    // 기본 글씨체
          textTheme: TextTheme(       // 글자 테마를 적용할 수 있는 클래스
            displayLarge: TextStyle(     // headline1 스타일 정의
              color: Colors.white,    // 글 색상
              fontSize: 80.0,         // 크기
              fontWeight: FontWeight.w700,  // 글 두께
              fontFamily: 'parisienne',     // 글씨체
            ),
            displayMedium: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
            ),
            bodyLarge: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
            bodyMedium: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
```

<br>

- Text 위젯에 스타일 적용

> lib/screen/home_screen.dart
```dart
  import 'package:flutter/material.dart';
  
  class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.pink[100],
        body: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DDay(),
              _CoupleImage(),
            ],
          ),
        ),
      );
    }
  }
  
  class _DDay extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      // 테마 불러오기
      final textTheme = Theme.of(context).textTheme;
  
      return Column(
        children: [
          const SizedBox(height: 16.0),
          Text(
            'U&I',
            style: textTheme.displayLarge,   // headline1 스타일 적용
          ),
          const SizedBox(height: 16.0),
          Text(
            '우리 처음 만난 날',
            style: textTheme.bodyLarge,   // bodyText1 스타일 적용
          ),
          Text(
            '2024.03.24',
            style: textTheme.bodyMedium,   // bodyText2 스타일 적용
          ),
          const SizedBox(height: 16.0),
          IconButton(
            iconSize: 60.0,
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Colors.red,    // 색상 빨강으로 변경
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'D+208',
            style: textTheme.displayMedium,   // headline2 스타일 적용
          ),
        ],
      );
    }
  }
  
  class _CoupleImage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Center(
        child: Image.asset('asset/img/middle_image.png',
          height: MediaQuery.of(context).size.height /2,
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









