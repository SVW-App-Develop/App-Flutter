class Idol {
  String _name = '스트레이키즈';

  // get 키워드를 사용해서 게터임을 명시
  // 게터는 메서드와 다르게 매개변수를 전혀 받지 않음
  String get name {
    return this._name;
  }

  // 세터는 set 이라는 키워드를 사용해서 선언
  // 세터는 매개변수로 딱 하나의 변수를 받을 수 있음
  set name(String name) {
    this._name = name;
  }
}

void main() {
  Idol strayKids = Idol();
  strayKids.name = '세븐틴';   // 세터
  print(strayKids.name);      // 게터
  // _name 초기값은 '스트레이키즈'
  // 세터로 '세븐틴' 대입하고 게터로 확인해보니 '세븐틴'으로 저장되어 있음
}