library round_rotate_view;

import 'package:flutter/material.dart';
import 'round_rotate_paint.dart';

class RoundRotateView extends StatefulWidget {
  const RoundRotateView({Key? key}) : super(key: key);

  @override
  State<RoundRotateView> createState() => _RoundRotateViewState();
}

class _RoundRotateViewState extends State<RoundRotateView>  with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 3));
    _controller.repeat();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: AnimatedBuilder(
          animation: _controller.view,
          builder: (context,child) {
            return CustomPaint(
              foregroundPainter: RoundRotatePainter(progress: _controller.value),
            );
          }
      ),
    );
  }
}
