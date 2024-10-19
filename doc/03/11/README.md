# 11단계 : 디지털 주사위
- 가속도계, 자이로스코프, Sensor_Plus

  - 가속도계 : 특정 방향으로 가속을 하는 정도를 측정하는 기기
 
    - 어느 정도의 가속 수치를 흔드는 핸동으로 인식할지에 대한 기준 중요
   
    - 사용자가 특정 수치를 넘는 강도로 핸드폰을 흔든 순간 인식하는 함수 구현
   
      - 기준을 사용자가 설정하도록 Slider 위젯 이용
     
  - 화면 두 개를 만들어 탭과 스크롤로 이동
 
    - 두 화면을 각각 따로 위젯으로 구현
   
    - BottomNavigationBar 이용

- [실습 프로젝트 바로가기](https://github.com/SVW-App-Develop/Random_Dice.git)

<br>

|개요|설명|
|-|-|
|**프로젝트명**|random_dice|
|**개발환경**|플러터 SDK : 3.24.3|
|**미션**|핸드폰을 흔들면 새로운 주사위를 뽑아주는 앱 만들기|
|**기능**|- BottomNavigation 이용해 탭 형태의 UI 구현<br><br>- 가속도계를 사용해서 흔들기 기능 구현<br><br>- Slider 이용해 흔들기 민감도를 설정하는 기능 구현|
|**조작법**|- 첫 번째 탭에서 핸드폰을 흔들면 주사위의 숫자가 랜덤하게 변경<br><br>- 두 번째 탭에서 슬라이더를 움직이면 흔들기의 민감도 지정 가능|
|**핵심 구성요소**|- 가속도계<br><br>- BottomNavigationBar<br><br>- Slider|
|**플러그인**|- shake: 3.13.x<br><br>- sensors_plus: 3.1.0|

<br>

---

<br>

11.1 사전 지식
---
### 01. 가속도계
- 특정 물체가 특정 방향으로 이동하는 가속도가 어느 정도인지를 숫자로 측정하는 기기

  - 대부분의 핸드폰에 가속도계 장착되어 있음
 
- 3개의 축으로 가속도 측정 가능

  - 움직임 이벤트를 받으면 x, y, z 축의 측정 결과가 모두 double 값으로 반환됨

|가속도계와 x, y, z 축|
|-|
|![이미지](./img/01.png)|

<br>

### 02. 자이로스코프(gyroscope)
- x, y, z 축으로의 직선 움직임만 측정 가능한 가속도계의 단점 보완

  - x, y, z 축의 회전 측정 가능
 
- 회전에 대한 이벤트를 받게 되면 x, y, z 축 모두에서의 회전값이 동시에 반환됨

|자이로스코프와 x, y, z 축의 회전|
|-|
|![이미지](./img/02.png)|

<br>

### 03. Sensor_Plus 패키지
- 핸드폰의 가속도계와 자이로스코프 센서 간단하게 사용 가능

- 가속도계와 자이로스코프 센서의 데이터는 x, y, z 축의 움직임을 각각 반환

  - 전반적인 핸드폰의 움직임을 측정하려면 정규화(normalization) 필요
 
- shake 패키지 : 미리 정규화 작업은 해둠

  - x, y, z 각 값을 통합해 전반적인 움직임 수치를 계산해서 핸드폰을 흔든 정도를 수치화
 
- sensors_plus 패키지를 이용한 가속도계와 자이로스코프 사용법 숙지하면 유용함

> sensors_plus 패키지를 pubspec.yaml 에 등록 후 코드 사용
```dart
  import 'package:sensors_plus/sensors_plus.dart';
  
  // 중력을 반영한 가속도계 값
  accelerometerEvents.listen((AccelerometerEvent event){
    print(event.x);   // x 축 수치
    print(event.y);   // y 축 수치
    print(event.z);   // z 축 수치
  });
  
  // 중력을 반영하지 않은 순수 사용자의 힘에 의한 가속도계 값
  userAccelerometerEvents.listen((UserAccelerometerEvent event){
    print(event.x);   // x 축 수치
    print(event.y);   // y 축 수치
    print(event.z);   // z 축 수치
  });
  
  gyroscopeEvents.listen((GyroscopeEvent event){
    print(event.x);   // x 축 수치
    print(event.y);   // y 축 수치
    print(event.z);   // z 축 수치
  });
```

<br>

---

<br>

11.2 사전 준비
---



<br>

---

<br>

11.3 레이아웃 구상
---



<br>

---

<br>

11.4 구현
---



<br>

---

<br>

🚨 핵심 요약
---



<br>









