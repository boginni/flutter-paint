import 'package:boginni_utils/boginni_utils.dart';
import 'package:flutter/material.dart';

class LayerControllerWidget extends StatefulWidget {
  const LayerControllerWidget({
    super.key,
    required this.layers,
  });

  final int layers;

  @override
  State<LayerControllerWidget> createState() => _LayerControllerWidgetState();
}

class _LayerControllerWidgetState extends State<LayerControllerWidget> {
  final keys = List.generate(5, (index) => ValueKey(index));

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
            Text(
              'Layers',
              style: context.textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 8,
            ),
            ReorderableListView.builder(
              itemCount: widget.layers,
              shrinkWrap: true,
              buildDefaultDragHandles: false,
              onReorder: (oldIndex, newIndex) {
                final key = keys.removeAt(oldIndex);
                keys.insert(newIndex, key);
              },
              itemBuilder: (context, index) {
                final keyValue = keys[index].value;

                return Padding(
                  key: keys[index],
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(8),
                    clipBehavior: Clip.antiAlias,
                    child: ReorderableDragStartListener(
                      index: index,
                      enabled: true,
                      child: Row(
                        children: [
                          ColoredBox(
                            color: Colors.primaries[keyValue % Colors.primaries.length],
                            child: const SizedBox(
                              width: 100,
                              height: 100,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('Layer ${keyValue + 1}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
