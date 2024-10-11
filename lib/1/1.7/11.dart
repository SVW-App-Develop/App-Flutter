void main() {
  try {
    final name = '이용복';

    // throw 키워드로 고의적으로 에러 발생시킴
    throw Exception('이름이 잘못됐습니다');
    print(name);
  } catch(e) {
    // try 에서 에러가 발생했으니 catch 로직 실행
    print(e);
  }
}