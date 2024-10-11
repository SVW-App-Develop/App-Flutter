void main(){
  (int a, int b) val = (1, -1);   // (int, int) 타입의 val 선언하고 (1, -1)로 초기화

  switch(val){          // `val`을 평가하는 switch 문 시작
    case (1, _) when val.$2 > 0 : // `val`의 첫 번째 요소가 1이고 두 번째 요소가 0보다 큰지 검사
      print('1, _');    // 조건이 만족되면 '1, _' 출력
      break;            // switch 문 종료
    default :           // 어떤 경우도 일치하지 않을 때 실행되는 블록
      print('default'); // 다른 케이스가 만족되지 않으면 'default' 출력
  }
}