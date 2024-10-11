class Idol {
  // '_'로 변수명을 시작하면 프라이빗 변수 선언 가능
  String _name;

  Idol(this._name);
}

void main() {
  Idol strayKids = Idol('스트레이키즈');

  // 같은 파일에서는 _name 변수에 접근 가능
  // 다른 파일에서는 _name 변수에 접근 불가
  print(strayKids._name);
}