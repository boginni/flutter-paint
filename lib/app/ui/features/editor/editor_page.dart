import 'package:flutter/material.dart';
import 'package:flutter_paint/app/ui/features/editor/widgets/layer_widget.dart';

class EditorPage extends StatelessWidget {
  const EditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editor'),
      ),
      body: const Stack(
        children: [
          Center(
            child: Text('Editor'),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: SizedBox(
              width: 200,
              child: LayerControllerWidget(
                layers: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



