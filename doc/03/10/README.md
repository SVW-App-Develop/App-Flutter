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




