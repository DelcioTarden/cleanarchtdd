import 'package:cleanarchtdd/core/bloc/base_bloc.dart';

class AppBloc implements Bloc {

  // late BehaviorSubject<bool> _controllerSplashScreenIsFinished;
  // Function(bool) get _sinkSplashScreenIsFinished { return _controllerSplashScreenIsFinished.sink.add; }
  // Stream<bool> get streamSplashScreenIsFinished { return _controllerSplashScreenIsFinished.stream; }

  AppBloc() {
    //_controllerSplashScreenIsFinished = BehaviorSubject<bool>.seeded(false);
    //_splashScreenCounter();
  }

  // void _splashScreenCounter() async {
  //   await Future.delayed(const Duration(milliseconds: 3000));
  //   _sinkSplashScreenIsFinished(true);
  // }

  @override
  void dispose() async {
    //await _controllerSplashScreenIsFinished.close();
  }
}