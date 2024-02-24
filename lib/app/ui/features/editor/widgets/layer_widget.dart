import 'package:boginni_utils/boginni_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paint/app/ui/features/editor/controllers/editor_store.dart';

class LayerControllerWidget extends StatefulWidget {
  const LayerControllerWidget({
    super.key,
    required this.store,
  });

  final EditorStore store;

  @override
  State<LayerControllerWidget> createState() => _LayerControllerWidgetState();
}

class _LayerControllerWidgetState extends State<LayerControllerWidget> {

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
                  'Layers: ${widget.store.layers.length}',
                  style: context.textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final layers = widget.store.layers;
                    widget.store.setLayers(layers..add(layers.length));
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            ReorderableListView.builder(
              itemCount: widget.store.layers.length,
              shrinkWrap: true,
              buildDefaultDragHandles: false,
              onReorder: (oldIndex, newIndex) {
                final layers = widget.store.layers;
                final layer = layers.removeAt(oldIndex);
                layers.insert(newIndex, layer);
                widget.store.setLayers(layers);
              },
              itemBuilder: (context, index) {
                final keyValue = widget.store.layers[index];

                return Padding(
                  key: ValueKey(keyValue),
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(8),
                    clipBehavior: Clip.antiAlias,
                    child: ReorderableDragStartListener(
                      index: index,
                      enabled: true,
                      child: Stack(
                        children: [
                          Row(
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
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                final layers = widget.store.layers;
                                widget.store.setLayers(layers..removeAt(index));
                              },
                            )
                          ),
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
