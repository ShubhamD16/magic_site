import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Trial extends StatefulWidget {
  const Trial({Key key}) : super(key: key);

  @override
  _TrialState createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final _tictoc = ValueNotifier<Timer>(Timer.periodic(Duration(milliseconds: 200), (timer) {
      _counter.value += 1;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _counter,
          builder: (BuildContext context, int value, Widget child) {
            i += 1;
            return Text('$value, i- $i');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          _counter.value += 1;
        },
      ),
    );
  }
}
