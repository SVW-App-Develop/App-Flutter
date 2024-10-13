# 8단계 : 블로그 웹 앱
- 콜백 함수, 웹뷰, 네이티브 설정

  - 웹뷰 : 웹사이트의 URL 을 입력하면 해당 웹사이트를 화면에 보여주는 역할
 
    - 네이티브 UI 가 아니라 약간의 이질감은 있지만 웹사이트를 쉽게 앱으로 구현 가능
   
  - 앱바(AppBar) : 머티리얼 디자인 요소
 
    - 앱 맨 위에 페이지 이름이나 앱 이름을 적어둔 형태의 UI 를 그려주는 위젯

<br>

|개요|설명|
|-|-|
|**프로젝트명**|blog_web_app|
|**개발환경**|플러터 SDK : 3.24.3|
|**미션**|웹뷰를 사용해서 웹사이트를 앱으로 포장하기|
|**기능**|웹뷰를 사용해서 앱에서 웹사이트 실행하기|
|**조작법**|앱을 실행하면 웹사이트 실행|
|**핵심 구성요소**|- StatelessWidget<br><br>- 앱바<br><br>- 웹뷰<br><br>- IconButton|
|**플러그인**|webciew_flutter : 4.4.1|

<br>

8.1 사전 지식
---
### 01. 콜백(callback) 함수
- 일정 작업이 완료되면 실행되는 함수

  - 함수를 정의해두면 바로 실행되지 않고 특정 조건이 성립될 때 실행

> ex
```dart
  WebViewController controller = WebViewController()
    ..setNavigationDelegate(NavigationDelegate(
    // 로딩 완료 후 실행되는 함수
      onPageFinished: (String url){
        print('url');
      }
    )
  )
```
- onPageFinished() : 웹뷰에서 페이지 로딩이 완료된 뒤에 실행되는 콜백 함수

  - 첫 번째 매개변수 : 로딩된 페이지의 URL 반환
 
  - 페이지 로딩 후 실행하고 싶은 작업이 있다면 함수 내부에 코드 정의
 
- 웹뷰 위젯(WebViewWidget) 의 콜백 함수

  - onPageFinished()
 
  - onWebViewCreated()
 
  - onPageStarted()
 
  - onProgress()

<br>

### 02. 웹뷰 위젯
- 프레임워크에 내장된 브라우저를 앱의 네이티브 컴포넌트(component)에 임베딩(embedding)하는 기능

  - 앱에서 웹 브라우저 기능을 구현해주는 기술

- 단점

  - 네이티브 컴포너트에 비해 속도가 느림
 
  - 애니메이션이 부자연스러움
 
- 장점

  - 기존에 만든 웹사이트를 손쉽게 활용 가능
 
- 웹뷰 구현시 사용할 웹뷰 위젯은 controller 파라미터에 WebViewController 객체 입력

  - 웹뷰 컨트롤러 : 웹뷰 위젯을 제어하는데 필요한 기능 제공

<br>

#### 💡 웹뷰 위젯의 속성
|속성|설명|
|:-:|-|
|setJavascriptMode|웹뷰에서 자바스크립트 실행 허용 여부 결정<br><br>- JavascriptMode.unrestricted : 자바스크림트를 제한 없이 실행 가능<br><br>- JavascriptMode.disabled : 자바스크립트 실행 불가|
|setBackgroundColor|배경색 지정 가능|
|loadRequest|새로운 URL 로 이동|
|setNavigationDelegate|NavigationDelegate 객체 입력 필수이며, 해당 객체에 다양한 콜백 함수 포함<br><br>- onProgress : 새로운 페이지를 열어서 로딩이 될 때마다 실행되는 함수<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 매개변수로 로딩의 진행도를 0~1 사이 값으로 받음<br><br>- onPageStarted : 새로운 페이지로 이동하면 실행되는 콜백 함수<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 이동하고 있는 페이지의 URL 을 콜백 함수의 매개변수로 입력받음<br><br>- onPageFinished : 새로운 페이지로 이동이 완료되면 실행되는 콜백 함수<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 로딩 완료된 웹페이지의 URL 을 매개변수로 입력받음|

<br>

### 03. 안드로이드와 iOS 네이티브 설정
- 플러터도 각 네이티브 플랫폼으로 코드가 컴파일되므로 최소한의 네이티브 설정 필요

  - ex) 인터넷 권한, https 프로토콜에 관한 권한 설정, 카메라, 사진첩, 푸시(push) 권한 등
  
    - 보안에 민감한 사항이나 하드웨어 접근시 네이티브 설정

- 네이티브 설정이 필요한 플러그인은 보통 플러그인 홈페이지에 설정법 기재되어 있음

- 네이티브 설정이 필요한 경우는 일반적으로 해당 플러그인의 pub.dev 소개 페이지에서 확인 가능

<br>

---

<br>

8.2 사전 준비
---




