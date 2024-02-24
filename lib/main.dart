import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_paint/app/app_widget.dart';
import 'package:flutter_paint/app/ui/features/editor/editor_module.dart';

void main() {
  runApp(
    ModularApp(
      module: EditorModule(),
      child: const AppWidget(),
    ),
  );
}
