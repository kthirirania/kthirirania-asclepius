import 'package:asclepius/screens/home_screen.dart';
import 'package:asclepius/screens/main_page.dart';
import 'package:asclepius/screens/prescriptions_screen.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<MainPage>(() => MainPage());
    register<HomeScreen>(() => HomeScreen());
    register<PrescriptionScreen>(() => PrescriptionScreen());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
