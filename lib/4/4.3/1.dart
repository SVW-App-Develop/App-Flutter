void main(){
  String dayKor = '월요일';

  // switch 문이 함수처럼 값을 반환
  String dayEnglish = switch (dayKor) {
    // '=>' 를 사용하면 switch 문 조건에 맞을 때 값 반환 가능
    '월요일' => 'Monday',
    '화요일' => 'Tuesday',
    '수요일' => 'Wednesday',
    '목요일' => 'Thursday',
    '금요일' => 'Friday',
    '토요일' => 'Saturday',
    '일요일' => 'Sunday',
    // _ 는 default 와 같은 의미로 사용됨
    _ => 'Not Found',
  };

  print(dayEnglish);
}