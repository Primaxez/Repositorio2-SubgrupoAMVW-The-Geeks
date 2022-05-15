import 'Observer.dart';

abstract class Observable {
  void add(Observer observer);

  void remove(Observer observer);

  void notifyall(String descripcion);
}
