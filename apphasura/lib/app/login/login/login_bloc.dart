import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class LoginBloc extends BlocBase {
  TextEditingController controller = TextEditingController();

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
