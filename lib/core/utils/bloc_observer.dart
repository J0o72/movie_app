import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(change);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print("Create => $bloc");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print("Close => $bloc");
  }
}
