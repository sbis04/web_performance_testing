import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_performance/main.dart';
import 'package:flutter_web_performance/screens/description_page.dart' show backKey;
import 'package:flutter_web_performance/screens/home_page.dart' show listItemKey;
import 'package:web_benchmarks_framework/recorder.dart';
import 'package:web_benchmarks_framework/driver.dart';

/// A recorder that measures frame building durations.
class AppRecorder extends WidgetRecorder {
  AppRecorder({@required this.benchmarkName}) : super(name: benchmarkName);

  final String benchmarkName;

  bool _completed = false;

  @override
  bool shouldContinue() {
    if (benchmarkName == 'scroll') {
      return profile.shouldContinue();
    } else {
      return profile.shouldContinue() || !_completed;
    }
  }

  @override
  Widget createWidget() {
    final automationFunction = {
      'scroll': automateScrolling,
      'tap': automateTapping,
      'page': automatePaging,
    }[benchmarkName];
    Future.delayed(Duration(milliseconds: 400), automationFunction);
    return MyApp();
  }

  Future<void> automateScrolling() async {
    final scrollable = Scrollable.of(find.byKey(listItemKey).evaluate().single);
    await scrollable.position.animateTo(
      2000,
      curve: Curves.linear,
      duration: Duration(seconds: 5),
    );
  }

  Future<void> automatePaging() async {
    final controller = LiveWidgetController(WidgetsBinding.instance);
    for (int i = 0; i < 10; ++i) {
      print('Testing round $i...');
      await controller.tap(find.byKey(listItemKey));
      await animationStops();
      await controller.tap(find.byKey(backKey));
      await animationStops();
    }
    _completed = true;
  }

  Future<void> automateTapping() async {
    final controller = LiveWidgetController(WidgetsBinding.instance);
    for (int i = 0; i < 20; ++i) {
      print('Testing round $i...');
      await controller.tap(find.byIcon(Icons.add_shopping_cart));
      await animationStops();
    }
    _completed = true;
  }

  Future<void> animationStops() async {
    while (WidgetsBinding.instance.hasScheduledFrame) {
      await Future<void>.delayed(Duration(milliseconds: 200));
    }
  }
}

Future<void> main() async {
  await runBenchmarks(
    {
      'scroll': () => AppRecorder(benchmarkName: 'scroll'),
      'tap': () => AppRecorder(benchmarkName: 'tap'),
      'page': () => AppRecorder(benchmarkName: 'page'),
    },
  );
}
