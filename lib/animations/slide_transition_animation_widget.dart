import 'package:flutter/material.dart';

class SlideTransitionAnimationWidget extends StatefulWidget {
  final Widget child;
  final Curve curve;
  final Duration duration;
  final Offset begin;
  final Offset end;

  const SlideTransitionAnimationWidget(
      {Key? key,
      required this.child,
      required this.curve,
      required this.duration,
      required this.begin,
      required this.end})
      : super(key: key);

  @override
  State<SlideTransitionAnimationWidget> createState() =>
      _SlideTransitionAnimationWidgetState();
}

class _SlideTransitionAnimationWidgetState
    extends State<SlideTransitionAnimationWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward();
    _animation = Tween(begin: widget.begin, end: widget.end)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: widget.child);
  }
}
