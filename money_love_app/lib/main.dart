import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyloveapp/my_app.dart';
import 'package:moneyloveapp/sevice_locator.dart';

import 'blocs/blocs.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  setupLocator();
  runApp(MyApp());
}
