# 12단계 : 동영상 플레이어
- 화면 회전, 시간 변환, String 패딩

- [실습 프로젝트 바로가기](https://github.com/SVW-App-Develop/Vid_Player.git)

<br>

|개요|설명|
|-|-|
|**프로젝트명**|vid_player &nbsp;&nbsp;&nbsp; *\*주의: video_player 플러그인 이름과 겹치지 않게 작명에 유의* |
|**개발환경**|플러터 SDK : 3.24.3|
|**미션**|핸드폰 갤러리에서 동영상을 골라서 실행할 수 있는 동영상 플레이어 앱 구현|
|**기능**|- 로고나 갤러리 버튼을 눌러서 동영상 고르기<br><br>- 동영상 재생, 중지, 3초 뒤로, 3초 앞으로 기능<br><br>- Slider 위젯 이용해 원하는 동영상 위치로 이동<br><br>- 동영상 화면을 탭하면 동영상을 제어하는 버튼들을 화면에 보여줌|
|**조작법**|- 홈 스크린에서 로고를 눌러 동영상 선택<br><br>- Slider 위젯 조작해 원하는 영상의 위치로 이동<br><br>- 화면을 한 번 탭해서 컨트롤 버튼을 띄운 후 동영상을 30초 앞뒤로 이동<br><br>- 갤러리 아이콘 버튼을 눌러서 새로운 동영상 실행|
|**핵심 구성요소**|- Stack<br><br>- Positioned<br><br>- VideoPlayer<br><br>- ImagePicker<br><br>- LinearGradient|
|**플러그인**|- video_player: 2.8.1<br><br>- image_picker: 1.0.4|

<br>

---

<br>

12.1 사전 지식
---
### 01. iOS 시뮬레이터 화면 회전
- 시뮬레이터 맨 위에 있는 3가지 옵션 중 가장 오른쪽에 있는 회전하기 버튼 클릭

  - 시뮬레이터를 오른쪽 90도씩 회전
 
<br>

### 02. 안드로이드 애뮬레이터 화면 회전
- 상단 회전하기 버튼 클릭

  - 시계방향 또는 반시계방향으로 90도 회전 가능

|-|
|-|
|![이미지](./img/01.png)|
 
<br>

### 03. 시간 변환 및 String 패딩
- Duration 클래스 : 기간을 표현할 수 있는 클래스

  - DateTime : 특정 날짜
 
- video_player 플러그인 사용

  - 현재 실행되고 있는 영상의 위치, 영상의 총 길이 등을 Duration 클래스로 반환
 
  - 보기 좋은 String 값으로 Duration 클래스 전환
 
    - 개발자가 선호하는 자료 형태와 실사용쟈가 선호하는 자료 형태 다르기 때문

> lib/main.dart
```dart
  import 'package:flutter/material.dart';
  
  void main() {
    Duration duration = Duration(seconds: 192);
    print(duration);    // 기간 출력
    
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              'home',
            ),
          ),
        ),
      ),
    );
  }
```
- Duration 클래스를 화면에 그대로 출력

  - 개발자들은 쉽게 이해 가능, 일반 사람은 이해 어려움

> 실행 결과
```
  I/flutter (29938): 0:03:12.000000
```

<br>

- 위 결과에서 '.' 뒷부분을 제외한 앞부분만 출력
> lib/main.dart
```dart
  ...생략...
    Duration duration = Duration(seconds: 192);
    print(duration.toString().split('.')[0]);
  ...생략
```
- split() 함수 : 첫 번째 매개변수에 들어오는 값을 기준으로 String 값을 나누고 각각 나뉜 값을 List 에 넣어 반환

> 실행 결과
```
  I/flutter (29938): 0:03:12
```

<br>

- '시' 단위 생략, '분분:초초' 현태로 Duration 표현
> lib/main.dart
```dart
  ...생략...
    Duration duration = Duration(seconds: 192);
    print(duration);
    print(duration.toString().split('.')[0].split(':').sublist(1, 3).join(':'));
  ...생략...
```
- '.' 기준으로 String 을 split() 해서 밀리초 단위 삭제

- 한번 더 ':' 기준으로 split() 해서 시, 분, 초 단위로 나뉜 List 값 반환

  - 리스트의 맨 앞의 값으로 반환되는 '시' qjfudi gka
 
    - sublist() 함수 이용해 1번 인덱스부터 2번 인덱스의 값들만 모아 join() 함수로 합침

> 실행 결과
```
  I/flutter (29938): 0:03:12.000000
  I/flutter (29938): 03:12
```

<br>

- Duration 클래스의 toString() 함수로 직접 코드 작성
> lib/main.dart
```dart
  ...생략...
    Duration duration = Duration(seconds: 192);
    print(duration);
    print('${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}');
    print('23'.padLeft(3, '0'));
    print('233'.padLeft(3, '0'));
  ...생략...
```
- Duration 클래스

  - inMinutes 게터 : 분 단위 시간 가져옴
 
  - inSeconds 게터 : 초 단위 시간 가져옴
 
    - 초 단위 시간은 분의 몫으로 넘어간 값을 제외한 나머지값만 보여주면 됨

- String 클래스

  - padLeft() : 최소 길이에 맞춰서 두 번째 매개변수에 입력된 값을 왼쪽에 채워줌
 
  - padRight() : 최소 길이에 맞춰서 두 번째 매개변수에 입력된 값을 오른쪽에 채워줌

  - pad() 함수들은 String 의 길이를 맞춰주는 역할
 
    - 첫 번째 매개변수 : String 의 최소 길이 입력
   
    - 두 번째 매개변수 : 길이가 부족할 때 채워줄 String 값 입력

> 실행 결과
```
  I/flutter (29938): 0:03:12.000000
  I/flutter (29938): 03:12
  I/flutter (29938): 023
  I/flutter (29938): 233
```
- 최소 3의 길이만큼 String 채워넣어야 하니 '023'

- '233'은 이미 최소 길이인 3 충족하여 그대로 '233'

<br>

---

<br>

12.2 사전 준비
---
### 01. 가상 단말에 동영상 추가
- 에셋 폴더에 추가해둔 동영상 파일들을 모두 에뮬레이터로 복사해야 함

  - [asset] 폴더 내 [video] 폴더 생성하여 원하는 동영상 옮기기

- 동영상 파일을 저장해도 파일 앱이 바로 실행되지 않기 때문에 파일이 잘 옮겨졌는지 직접 확인 필요

  - [Files] 앱 실행 후 왼쪽 상단의 메뉴 아이콘인 햄버거 버튼 클릭
 
  - 열리는 Drawer에서 [Downloads] 탭 클릭
 
  - 복사한 동영상이 모두 복사되어있는지 확인

|Files 앱 실행|햄버거 버튼|Downloads|파일확인|
|:-:|:-:|:-:|:-:|
|![이미지](./img/02.png)|![이미지](./img/03.png)|![이미지](./img/04.png)|![이미지](./img/05.png)|

<br>

### 02. 이미지 추가
- [asset] 폴더 내 [img] 폴더 내 배경 이미지 복사

<br>

### 03. pubspec.yaml 설정 후 [Pub get]
> pubspec.yaml
```dart
  ...생략...
  dependencies:
    flutter:
      sdk: flutter
      
    image_picker: 1.0.4
    video_player: ^2.5.1
    cupertino_icons: ^1.0.8
  
  ...생략...
  
  flutter:
  
    uses-material-design: true
    assets:
      - asset/img/
  ...생략///
```

<br>

### 04. 네이티브 설정(안드로이드용)
- 갤러리 관련 권한 필요

  - 안드로이드에서 갤러리 이미지 또는 동영상 읽기 가능

  - AndroidManifest.xml 파일에서 추가 가능
 
    - android.permission.READ_EXTERNAL_STORAGE 권한 추가
   
> android/app/src/main/AndroidManifest.xml
```dart
  <manifest xmlns:android="http://schemas.android.com/apk/res/android">
      <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
      <application
          android:label="vid_player"
          android:name="${applicationName}"
          android:icon="@mipmap/ic_launcher">
        <!-- 생략 -->
      </application>
  </manifest>
```

<br>

### 05. 프로젝트 초기화
- [lib] 폴더에 [screen] 폴더 생성 후 HomeScreen 위젯 생성할 home_screen.dart 생성
```dart
  import 'package:flutter/material.dart';
  
  class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) : super(key: key);
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Text(
          'Home Screen',
        ),
      );
    }
  }
```

<br>

- lib/main.dart 파일에 HomeScreen 위젯 등록
```dart
  import 'package:flutter/material.dart';
  import 'package:vid_player/screen/home_screen.dart';
  
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

12.3 레이아웃 구상
---
- 화면 하나로 구성

- 전체 화면을 차지하는 위젯 두 개를 활용해 조건에 따라 알맞은 위젯 노출

<br>

### 01. 첫 화면 : renderEmpty() 함수
- renderEmpty() : 앱을 처음 실행했을 때 화면에 보여줄 위젯을 반환하는 함수

  - 앱의 로고와 이름을 보여주고, grandient 배경 적용


<br>

### 02. 플레이 화면 : renderVideo() 함수
- 로고를 눌러서 실행하고 싶은 동영상 선택시 화면에 보여줄 위젯 반환

- 동영상을 볼 수 있고 동영상을 컨트롤할 수 있는 버튼 존재

  - 영상을 재생하거나 일시정지
 
  - 3초 전으로 돌리거나 3초 후로 이동
 
  - 새로운 영상 선택

<br>

---

<br>

12.4 구현
---




<br>

---

<br>

🚨 핵심 요약
---



<br>































