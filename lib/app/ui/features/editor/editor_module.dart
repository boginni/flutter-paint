import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_paint/app/ui/features/core/core_module.dart';
import 'package:flutter_paint/app/ui/features/editor/controllers/editor_store.dart';

import 'editor_page.dart';

class EditorModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addInstance(EditorStore());
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => EditorPage(
        store: Modular.get(),
      ),
    );
  }
}
