import 'package:flutter/material.dart';

class FadeTransitionAnimationWidget extends StatefulWidget {
  final Widget child;
  final Curve curve;
  final Duration duration;

  const FadeTransitionAnimationWidget({
    Key? key,
    required this.child,
    required this.curve,
    required this.duration,
  }) : super(key: key);

  @override
  State<FadeTransitionAnimationWidget> createState() =>
      _FadeTransitionAnimationWidgetState();
}

class _FadeTransitionAnimationWidgetState
    extends State<FadeTransitionAnimationWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward();
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
