void main() {
  try{
    // 에러가 없을 때 실행할 로직
    final String name = '이용복';

    print(name);  // 에러가 없으니 출력됨
  } catch(e) {    // catch 는 첫 번째 매개변수에 에러 정보 전달해줌
    // 에러가 있을 때 실행할 로직
    print(e);
  }
}