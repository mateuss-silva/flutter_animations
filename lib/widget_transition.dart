import 'package:flutter/material.dart';

class WidgetsTransition extends StatefulWidget {
  final Widget firstWidget;
  final Widget secondWidget;

  final bool showFirstWidget;

  const WidgetsTransition({
    Key? key,
    this.showFirstWidget = true,
    required this.firstWidget,
    required this.secondWidget,
  }) : super(key: key);

  @override
  _WidgetsTransitionState createState() => _WidgetsTransitionState();
}

class _WidgetsTransitionState extends State<WidgetsTransition>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late bool showFirst;

  @override
  void initState() {
    showFirst = widget.showFirstWidget;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..animateTo(1, duration: Duration.zero);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      reverseDuration: Duration(seconds: 1),
      duration: Duration(seconds: 1),
      switchInCurve: Curves.elasticInOut,
      switchOutCurve: Curves.elasticInOut,
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: _controller,
        child: InkWell(
          borderRadius: BorderRadius.circular(32),
          child: child,
          onTap: () {
            _controller.animateTo(0).then((value) {
              setState(() {
                showFirst = !showFirst;
              });
              _controller.animateTo(1);
            });
          },
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: showFirst ? widget.firstWidget : widget.secondWidget,
      ),
    );
  }
}
