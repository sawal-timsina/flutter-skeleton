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
  late double _positionX;
  late double _positionY;
  @override
  void initState() {
    _positionX = 300;
    _positionY = 200;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _positionX,
      top: _positionY,
      child: Draggable(
        feedback: const LanguageSwitcher(),
        childWhenDragging: Container(),
        onDragEnd: (details) => {
          setState(() {
            final parentPos = widget.overlayKey.globalPaintBounds;
            if (parentPos == null) return;
            _positionX = details.offset.dx - parentPos.left;
            _positionY = details.offset.dy - parentPos.top;
          })
        },
        child: const LanguageSwitcher(),
      ),
    );
  }
}
