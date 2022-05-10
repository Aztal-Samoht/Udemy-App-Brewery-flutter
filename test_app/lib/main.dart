import 'package:flutter/material.dart';

void main() {

}

abstract class AbstractClass{
  void abstractMethod();
}

abstract class AbstractSubclass extends AbstractClass{
  void abstractMethod2();
}

abstract class AnInterface{
  void abstractMethod3();
}

mixin MyMixin{
  abstractMethod4();
}

class MyClass extends AbstractSubclass implements AnInterface with MyMixin{
  @override
  void abstractMethod() {
    // TODO: implement abstractMethod
  }

  @override
  void abstractMethod2() {
    // TODO: implement abstractMethod2
  }

  @override
  void abstractMethod3() {
    // TODO: implement abstractMethod3
  }

  @override
  abstractMethod4() {
    // TODO: implement abstractMethod4
    throw UnimplementedError();
  }

}