import 'Observable.dart';
import 'Observer.dart';

class Notificador implements Observer {
  @override
  void update(Observable observable, String descripcion) {
    print(descripcion);
  }
}
