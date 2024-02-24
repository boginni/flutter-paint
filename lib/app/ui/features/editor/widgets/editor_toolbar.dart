import 'package:boginni_utils/boginni_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paint/app/ui/features/editor/controllers/editor_store.dart';

class EditorToolBar extends StatelessWidget implements PreferredSizeWidget {
  const EditorToolBar({super.key, required this.store});

  final EditorStore store;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: context.colorScheme.surfaceVariant,
        title: Row(
          children: [
            TextButton(
              onPressed: () {
                final layers = store.layers;
                store.setLayers(layers..add(0));
              },
              child: const Text('File'),
            ),
            const SizedBox(
              width: 16,
            ),
            TextButton(
              onPressed: () {
                final layers = store.layers;
                store.setLayers(layers..add(1));
              },
              child: const Text('Edit'),
            ),
            const SizedBox(
              width: 16,
            ),
            TextButton(
              onPressed: () {
                final layers = store.layers;
                store.setLayers(layers..add(2));
              },
              child: const Text('View'),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final layers = store.layers;
                    store.setLayers(layers..add(layers.length));
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    final layers = store.layers;
                    store.setLayers(layers..removeLast());
                  },
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
}
