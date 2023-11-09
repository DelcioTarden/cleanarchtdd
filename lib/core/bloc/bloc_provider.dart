import 'package:cleanarchtdd/core/bloc/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlocProvider extends StatelessWidget {
  final Bloc bloc;
  final Widget child;
  const BlocProvider({required this.bloc, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<Bloc>(
      create:(_){
        return bloc;
      },
      dispose:(_, value){
        value.dispose();
      },
      child: Consumer<Bloc>(
        builder: (_,bloc, __){
          return child;
        }
      ),
    );
  }
}