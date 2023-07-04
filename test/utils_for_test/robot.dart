import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:page_object/page_object.dart';

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

  Widget wrapRootWidget(Widget widget) =>
      ProviderScope(child: MaterialApp(home: widget));
}
