import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({
    super.key,
    required this.imageResource,
    required this.firstColor,
    required this.secondColor,
    this.scaleFactor,
  });

  final String imageResource;
  final Color firstColor;
  final Color secondColor;
  final double? scaleFactor;
  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with TickerProviderStateMixin {
  late AnimationController _animation;
  late Animation<double> _fadeInFadeOut;

  bool changeColor = false;

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.8).animate(_animation);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animation.forward();
        setState(() {
          changeColor = !changeColor;
        });
      }
    });
    _animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _fadeInFadeOut,
        child: Image.asset(
          widget.imageResource,
          scale: widget.scaleFactor,
          color: (changeColor) ? widget.secondColor : widget.firstColor,
        ),
      ),
    );
  }
}
