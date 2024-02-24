import 'package:flutter/material.dart';

abstract class StoreListenerPage extends StatefulWidget {
  const StoreListenerPage({
    super.key,
  });

  ChangeNotifier get changeNotifier;

  Widget build(BuildContext context);

  @override
  State<StoreListenerPage> createState() => _StoreListenerPageState();
}

class _StoreListenerPageState extends State<StoreListenerPage> {
  @override
  initState() {
    super.initState();
    widget.changeNotifier.addListener(rebuild);
  }

  void rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    widget.changeNotifier.removeListener(rebuild);
  }

  @override
  Widget build(BuildContext context) => widget.build(context);
}
