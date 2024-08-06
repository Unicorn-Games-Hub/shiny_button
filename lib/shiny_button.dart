import 'package:flutter/material.dart';

enum ShineDirection { leftToRight, rightToLeft, topToBottom, bottomToTop }

enum IconPosition { leading, trailing, above, below }

class ShinyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final String label;
  final Icon? icon;
  final Color backgroundColor;
  final Color textColor;
  final bool isEnabled;
  final Duration shineDuration;
  final ShineDirection shineDirection;
  final IconPosition iconPosition;
  final Color disabledBackgroundColor;
  final Color disabledTextColor;
  final bool isReverse;
  final TextStyle? textStyle;
  final double borderRadius;
  final double elevation;
  final Color shadowColor;
  final List<Color>? customGradient;
  final bool showRipple;
  final String? tooltip;
  final bool isLoading;
  final double loadingIndicatorSize;
  final EdgeInsetsGeometry padding;
  final bool disableElevationWhenDisabled;

  const ShinyButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    required this.label,
    this.icon,
    required this.backgroundColor,
    required this.textColor,
    this.isEnabled = true,
    this.shineDuration = const Duration(seconds: 2),
    this.shineDirection = ShineDirection.leftToRight,
    this.iconPosition = IconPosition.leading,
    this.disabledBackgroundColor = Colors.grey,
    this.disabledTextColor = Colors.white,
    this.isReverse = false,
    this.textStyle,
    this.borderRadius = 8.0,
    this.elevation = 2.0,
    this.shadowColor = Colors.black45,
    this.customGradient,
    this.showRipple = true,
    this.tooltip,
    this.isLoading = false,
    this.loadingIndicatorSize = 24.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.disableElevationWhenDisabled = true,
  }) : super(key: key);

  @override
  _ShinyButtonState createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.shineDuration,
      vsync: this,
    );

    if (widget.isEnabled) {
      _controller.repeat(reverse: widget.isReverse);
    }
  }

  @override
  void didUpdateWidget(ShinyButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isEnabled) {
      _controller.repeat(reverse: widget.isReverse);
    } else {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Alignment getShineBegin() {
    switch (widget.shineDirection) {
      case ShineDirection.leftToRight:
        return widget.isReverse ? Alignment.centerRight : Alignment.centerLeft;
      case ShineDirection.rightToLeft:
        return widget.isReverse ? Alignment.centerLeft : Alignment.centerRight;
      case ShineDirection.topToBottom:
        return widget.isReverse ? Alignment.bottomCenter : Alignment.topCenter;
      case ShineDirection.bottomToTop:
        return widget.isReverse ? Alignment.topCenter : Alignment.bottomCenter;
    }
  }

  Alignment getShineEnd() {
    switch (widget.shineDirection) {
      case ShineDirection.leftToRight:
        return widget.isReverse ? Alignment.centerLeft : Alignment.centerRight;
      case ShineDirection.rightToLeft:
        return widget.isReverse ? Alignment.centerRight : Alignment.centerLeft;
      case ShineDirection.topToBottom:
        return widget.isReverse ? Alignment.topCenter : Alignment.bottomCenter;
      case ShineDirection.bottomToTop:
        return widget.isReverse ? Alignment.bottomCenter : Alignment.topCenter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip ?? '',
      child: IgnorePointer(
        ignoring: !widget.isEnabled,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ShaderMask(
              shaderCallback: (Rect bounds) {
                if (!widget.isEnabled || widget.isLoading) {
                  return LinearGradient(
                    colors: [Colors.transparent, Colors.transparent],
                  ).createShader(bounds);
                }

                return LinearGradient(
                  colors: widget.customGradient ??
                      <Color>[
                        Colors.white.withOpacity(0.0),
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.0),
                      ],
                  stops: widget.customGradient != null
                      ? List.generate(
                          widget.customGradient!.length,
                          (index) =>
                              index / (widget.customGradient!.length - 1))
                      : [
                          (_controller.value - 0.3).clamp(0.0, 1.0),
                          _controller.value.clamp(0.0, 1.0),
                          (_controller.value + 0.3).clamp(0.0, 1.0),
                        ],
                  begin: getShineBegin(),
                  end: getShineEnd(),
                ).createShader(bounds);
              },
              blendMode: widget.isEnabled && !widget.isLoading
                  ? BlendMode.srcATop
                  : BlendMode.dst,
              child: Material(
                elevation: widget.isEnabled
                    ? widget.elevation
                    : widget.disableElevationWhenDisabled
                        ? 0
                        : widget.elevation,
                shadowColor: widget.shadowColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                child: InkWell(
                  onTap: widget.isEnabled ? widget.onPressed : null,
                  onLongPress: widget.isEnabled ? widget.onLongPress : null,
                  splashColor: widget.showRipple
                      ? Colors.white.withOpacity(0.3)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      color: widget.isEnabled
                          ? widget.backgroundColor
                          : widget.disabledBackgroundColor,
                      gradient: widget.customGradient != null
                          ? LinearGradient(
                              colors: widget.customGradient!,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                    ),
                    padding: widget.padding,
                    child: widget.isLoading
                        ? SizedBox(
                            width: widget.loadingIndicatorSize,
                            height: widget.loadingIndicatorSize,
                            child: CircularProgressIndicator(
                              color: widget.textColor,
                              strokeWidth: 2.0,
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (widget.icon != null &&
                                  widget.iconPosition == IconPosition.leading)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: widget.icon,
                                ),
                              if (widget.icon != null &&
                                  widget.iconPosition == IconPosition.above)
                                Column(
                                  children: [
                                    widget.icon!,
                                    SizedBox(height: 4.0),
                                    Text(
                                      widget.label,
                                      style: widget.textStyle ??
                                          TextStyle(
                                            color: widget.isEnabled
                                                ? widget.textColor
                                                : widget.disabledTextColor,
                                          ),
                                    ),
                                  ],
                                ),
                              if (widget.icon != null &&
                                  widget.iconPosition == IconPosition.below)
                                Column(
                                  children: [
                                    Text(
                                      widget.label,
                                      style: widget.textStyle ??
                                          TextStyle(
                                            color: widget.isEnabled
                                                ? widget.textColor
                                                : widget.disabledTextColor,
                                          ),
                                    ),
                                    SizedBox(height: 4.0),
                                    widget.icon!,
                                  ],
                                ),
                              if (widget.icon == null ||
                                  widget.iconPosition == IconPosition.leading ||
                                  widget.iconPosition == IconPosition.trailing)
                                Text(
                                  widget.label,
                                  style: widget.textStyle ??
                                      TextStyle(
                                        color: widget.isEnabled
                                            ? widget.textColor
                                            : widget.disabledTextColor,
                                      ),
                                ),
                              if (widget.icon != null &&
                                  widget.iconPosition == IconPosition.trailing)
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: widget.icon,
                                ),
                            ],
                          ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
