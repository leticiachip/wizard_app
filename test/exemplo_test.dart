import 'package:flutter_test/flutter_test.dart';

int add(int a, int b){
  return a+b;
}

void main(){
  test('teste', (){
    print("iniciou o teste");
    expect(add(2, 3), 5);
    expect(add(-1,1), 0);
  });
}