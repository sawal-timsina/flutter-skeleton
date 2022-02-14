import 'dart:io';

import 'package:flutter/material.dart';

class DoubleBackToClose extends StatefulWidget {
  final Widget child;
  final Function? onBackPress;

  const DoubleBackToClose({
    Key? key,
    required this.child,
    this.onBackPress,
  }) : super(key: key);

  @override
  _DoubleBackToCloseState createState() => _DoubleBackToCloseState();
}

class _DoubleBackToCloseState extends State<DoubleBackToClose> {
  int _lastTimeBackButtonWasTapped = -1;
  static const exitTimeInMillis = 2000;

  bool get _isAndroid => Platform.isAndroid;

  @override
  Widget build(BuildContext context) {
    if (_isAndroid) {
      return WillPopScope(
        onWillPop: _handleWillPop,
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }

  Future<bool> _handleWillPop() async {
    bool isHandled = true;
    if (widget.onBackPress != null) {
      isHandled = await widget.onBackPress!();
    }

    if (!isHandled) {
      return false;
    }

    final _currentTime = DateTime.now().millisecondsSinceEpoch;
    if ((_currentTime - _lastTimeBackButtonWasTapped) < exitTimeInMillis) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      return true;
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        _getExitSnackBar(context),
      );
      return false;
    }
  }

  SnackBar _getExitSnackBar(
    BuildContext context,
  ) {
    return const SnackBar(
      content: Text('Press BACK again to exit!'),
      backgroundColor: Colors.red,
      duration: Duration(
        seconds: 2,
      ),
      behavior: SnackBarBehavior.floating,
    );
  }
}
