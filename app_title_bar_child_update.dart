import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage(title: 'init title'));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<String?> _appBarTitleNotifier = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: ValueListenableBuilder<String?>(
            builder: (BuildContext context, String? value, Widget? child) {
              return Text(value ?? widget.title);
            },
            valueListenable: _appBarTitleNotifier,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ChildDemoTitleBar(titleNotifier: _appBarTitleNotifier)
            ],
          ),
        ),
      ),
    );
  }
}

class ChildDemoTitleBar extends StatefulWidget {
  final ValueNotifier<String?> titleNotifier;

  const ChildDemoTitleBar({Key? key, required this.titleNotifier})
      : super(key: key);

  @override
  State<ChildDemoTitleBar> createState() => _ChildDemoTitleBarState();
}

class _ChildDemoTitleBarState extends State<ChildDemoTitleBar> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: InkWell(
            onTap: () {
              _counter++;
              widget.titleNotifier.value = "title updated $_counter";
            },
            child: const Text("tap to update title")));
  }
}
