class Idol {
  // 생성자에서 입력받는 변수들은 일반적으로 final 키워드 사용
  // 인스턴스화한 다음에 변수의 값을 변경하는 실수를 막기 위함
  final String name;

  // 생성자 선언
  // 클래스와 같은 이름이어야 함
  // 함수의 매개변수를 선언하는 것처럼 매개변수 지정
  // 네임드 파라미터 및 옵셔널 파라미터 사용 가능
  // : 기호 뒤에 입력받은 매개변수가 저장될 클래스 변수를 지정해줌
  Idol(String name) : this.name = name;

  void sayName() {
    print('그는 ${this.name}입니다');
  }
}

void main() {
  // name 에 '스트레이키즈' 저장
  Idol strayKids = Idol('스트레이키즈');
  strayKids.sayName();

  // name 에 'SEVENTEEN' 저장
  Idol seventeen = Idol('SEVENTEEN');
  seventeen.sayName();
}