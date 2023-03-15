import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';
import 'launguage_switcher.dart';

class DraggableBox extends StatefulWidget {
  final GlobalKey stackKey;
  const DraggableBox({super.key, required this.stackKey});

  @override
  State<DraggableBox> createState() => _DraggableBoxState();
}

class _DraggableBoxState extends State<DraggableBox> {
  var _x = 50.0;
  var _y = 50.0;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _x,
      top: _y,
      child: Draggable(
        feedback: const LaunguageSwitcher(),
        childWhenDragging: Container(),
        onDragEnd: (details) => {
          setState(() {
            final parentPos = widget.stackKey.globalPaintBounds;
            if (parentPos == null) return;
            _x = details.offset.dx - parentPos.left;
            _y = details.offset.dy - parentPos.top;
          })
        },
        child: const LaunguageSwitcher(),
      ),
    );
  }
}
