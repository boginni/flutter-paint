import 'package:boginni_utils/boginni_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paint/app/ui/features/editor/controllers/editor_store.dart';

class EditorToolsPallet extends StatelessWidget {
  const EditorToolsPallet({
    super.key,
    required this.store,
  });

  final EditorStore store;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceVariant,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'tools',
                  style: context.textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            GridView.builder(
              itemCount: store.tools.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final tool = store.tools[index];
                return IconButton(
                  icon: Icon(tool.icon),
                  onPressed: () {
                    // store.setActiveTool(tool);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
