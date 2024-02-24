import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditorTool {
  final String name;
  final IconData icon;

  EditorTool({required this.name, required this.icon});

  static List<EditorTool> getTools() {
    return [
      EditorTool(name: 'Brush', icon: CupertinoIcons.paintbrush),
      EditorTool(name: 'Eraser', icon: Icons.remove_circle_outline),
      EditorTool(name: 'Fill', icon: CupertinoIcons.paintbrush_fill),
      EditorTool(name: 'Line', icon: CupertinoIcons.arrow_up_right),
      EditorTool(name: 'Rectangle', icon: CupertinoIcons.rectangle),
      EditorTool(name: 'Circle', icon: CupertinoIcons.circle),
      EditorTool(name: 'Text', icon: CupertinoIcons.textformat),
    ];
  }
}
