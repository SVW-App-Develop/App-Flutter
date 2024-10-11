// 인스턴스화할 때 입력받을 타입을 T 로 지정
class Cache<T> {
  // data 의 타입을 추후 입력될 T 타입으로 지정
  final T data;

  Cache({required this.data});
}

void main() {
  // T 의 타입을 List<int> 로 입력
  final cache = Cache<List<int>>(
      data : [1, 2, 3]
  );

  // 제네릭에 입력된 값을 통해 data 변수의 타입 자동 유추
  print(cache.data.reduce((value, element) => value + element));
}