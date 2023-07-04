import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:page_object/page_object.dart';

/// Abstract class to implement each Widget Robot
///
/// Robot classes are used to implement the specification or behavior 
/// you want to test, with detailed comparisons of operations and expectations
abstract class Robot<W extends Widget> extends PageObject {
  Robot(this.tester) : super(find.byType(W));

  Robot.child(this.tester, Finder parent)
      : super(
          find.descendant(
            of: parent,
            matching: find.byType(W),
          ),
        );
  Robot.withKey(this.tester, Key key) : super(find.byKey(key));

  final WidgetTester tester;

  Widget wrapRootWidget(
    Widget widget, {
    List<Override> providerOverrides = const [],
  }) =>
      ProviderScope(
        overrides: providerOverrides,
        child: MaterialApp(home: widget),
      );
}
