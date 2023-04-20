import 'package:flutter/material.dart';

/// A mixin that can be used with a [StatefulWidget] to register a callback.
///
/// function [callbackAfterBuild] to be called after the widget is built.
/// To use this mixin, create a class
///  that extends [StatefulWidget] and mixes in
/// that class. Then, implement the [callbackAfterBuild]
///  function to perform any.
mixin CallbackAfterBuildMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((_) => callbackAfterBuild());
  }

  void callbackAfterBuild();
}
