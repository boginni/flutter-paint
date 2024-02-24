import 'package:boginni_utils/boginni_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paint/app/ui/features/editor/widgets/editor_toolbar.dart';
import 'package:flutter_paint/app/ui/features/editor/widgets/editor_tools_pallet.dart';
import 'package:flutter_paint/app/ui/features/editor/widgets/layer_widget.dart';

import '../../widgets/store_listener_page.dart';
import 'controllers/editor_store.dart';

class EditorPage extends StoreListenerPage {
  const EditorPage({
    super.key,
    required this.store,
  });

  final EditorStore store;

  @override
  ChangeNotifier get changeNotifier => store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditorToolBar(store: store),
      backgroundColor: context.colorScheme.surfaceVariant.withOpacity(0.5),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: store.canvasSize.width,
              height: store.canvasSize.height,
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colorScheme.outline,
                  width: 1,
                ),
                color: context.colorScheme.surface,
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: SizedBox(
              width: 200,
              child: LayerControllerWidget(
                store: store,
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: SizedBox(
              width: 200,
              child: EditorToolsPallet(store: store),
            ),
          )
        ],
      ),
    );
  }
}
