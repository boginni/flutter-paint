import 'package:flutter/cupertino.dart';
import 'package:flutter_paint/app/domain/editor_tool.dart';

class EditorStore extends ChangeNotifier {
  List<int> _layers = [];

  List<EditorTool> tools = EditorTool.getTools();

  List<int> get layers => _layers;

  void setLayers(List<int> layers) {
    _layers = layers;
    notifyListeners();
  }

  Size _canvasSize = const Size(600, 400);

  Size get canvasSize => _canvasSize;

  set canvasSize(Size size) {
    _canvasSize = size;
    notifyListeners();
  }
}
