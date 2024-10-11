void switcher(dynamic anything){
  switch (anything) {
    // 정확히 'aaa' 문자열만 매치
    case 'aaa' :
      print('match : aaa');
      break;
    // 정확히 [1, 2] 리스트만 매치
    case [1, 2] :
      print('match : [1, 2]');
      break;
    // 3개의 값이 들어 있는 리스트를 모두 매치
    case [_, _, _] :
      print('match : [_, _, _]');
      break;
    // 첫 번째와 두 번째 값에 int 가 입력된 리스트를 매치
    case [int a, int b] :
      print('match : [int $a, int $b]');
      break;
    // 첫 번째 값에 String, 두 번째 값에 int 가 입력된 Record 타입을 매치
    case (String a, int b) :
      print('match : (String : $a, int : $b)');
      break;
    // 아무것도 매치되지 않을 경우 실행
    default :
      print('no match');
  }
}

void main(){
  switcher('aaa');
  switcher([1, 2]);
  switcher([3, 4, 5]);
  switcher([6, 7]);
  switcher(('정한', 30));
  switcher(8);
}