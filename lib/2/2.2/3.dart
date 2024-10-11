class Idol {
  final String name;

  // this 를 사용할 경우
  // 해당되는 변수에 자동으로 매개변수가 저장됨
  Idol(this.name);

  void sayName() {
    print('그는 ${this.name}입니다');
  }
}