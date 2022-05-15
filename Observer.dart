import 'Observable.dart';

abstract class Observer {
  void update(Observable observable, String descripcion);
}
