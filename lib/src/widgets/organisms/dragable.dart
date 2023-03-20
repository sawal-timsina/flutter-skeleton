import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';
import 'launguage_switcher.dart';

class DraggableBox extends StatefulWidget {
  final GlobalKey overlayKey;

  const DraggableBox({super.key, required this.overlayKey});

  @override
  State<DraggableBox> createState() => _DraggableBoxState();
}

class _DraggableBoxState extends State<DraggableBox> {
  double _positionX = 0;

  double _positionY = 100;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _positionX,
      top: _positionY,
      child: Draggable(
        feedback: const LanguageSwitcher(),
        childWhenDragging: Container(),
        onDragEnd: (details) {
          final parentPos = widget.overlayKey.globalPaintBounds;
          if (parentPos == null) return;
          setState(() {
            _positionX = details.offset.dx - parentPos.left;
            _positionY = details.offset.dy - parentPos.top;
          });
        },
        child: const LanguageSwitcher(),
      ),
    );
  }
}
