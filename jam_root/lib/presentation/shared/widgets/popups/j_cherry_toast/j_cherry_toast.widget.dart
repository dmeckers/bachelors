import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

// ignore: must_be_immutable
class JCherryToast extends StatefulWidget {
  //Overlay that does not block the screen
  OverlayEntry? overlayEntry;

  JCherryToast({
    super.key,
    this.title,
    required this.snackbarQueue,
    required this.icon,
    required this.themeColor,
    this.iconColor = Colors.black,
    this.action,
    this.backgroundColor = defaultBackgroundColor,
    this.shadowColor = defaultShadowColor,
    this.actionHandler,
    this.description,
    this.iconWidget,
    this.toastPosition = Position.top,
    this.animationDuration = const Duration(
      milliseconds: 3500,
    ),
    this.animationCurve = Curves.ease,
    this.animationType = AnimationType.fromLeft,
    this.autoDismiss = true,
    this.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    this.layout = ToastLayout.ltr,
    this.displayCloseButton = true,
    this.borderRadius = 20,
    this.displayIcon = true,
    this.enableIconAnimation = true,
    this.iconSize = 20,
    this.height,
    this.width,
    this.constraints,
    this.disableToastAnimation = false,
    this.onToastClosed,
    this.onTap,
  }) {
    assert(
      title != null || description != null,
      'Cherry toast must be initialized with minimum title or description',
    );
  }

  final Queue<JSnackbarData> snackbarQueue;

  JCherryToast.success({
    super.key,
    this.title,
    this.action,
    this.actionHandler,
    this.description,
    this.backgroundColor = defaultBackgroundColor,
    this.shadowColor = defaultShadowColor,
    this.toastPosition = Position.top,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.animationCurve = Curves.ease,
    this.animationType = AnimationType.fromLeft,
    this.autoDismiss = true,
    this.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    this.layout = ToastLayout.ltr,
    this.displayCloseButton = true,
    this.borderRadius = 20,
    this.iconWidget,
    this.displayIcon = true,
    this.enableIconAnimation = true,
    this.height,
    this.width,
    this.constraints,
    this.disableToastAnimation = false,
    this.onToastClosed,
    this.onTap,
    required this.snackbarQueue,
  }) {
    assert(
      title != null || description != null,
      'Cherry toast must be initialized with minimum title or description',
    );
    icon = Icons.check_circle;
    _initializeAttributes(successColor);
  }

  JCherryToast.error({
    super.key,
    this.title,
    this.action,
    this.actionHandler,
    this.backgroundColor = defaultBackgroundColor,
    this.shadowColor = defaultShadowColor,
    this.description,
    this.toastPosition = Position.top,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.animationCurve = Curves.ease,
    this.animationType = AnimationType.fromLeft,
    this.autoDismiss = true,
    this.iconWidget,
    this.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    this.layout = ToastLayout.ltr,
    this.displayCloseButton = true,
    this.borderRadius = 20,
    this.displayIcon = true,
    this.enableIconAnimation = true,
    this.height,
    this.width,
    this.constraints,
    this.disableToastAnimation = false,
    this.onToastClosed,
    required this.snackbarQueue,
    this.onTap,
  }) {
    assert(
      title != null || description != null,
      'Cherry toast must be initialized with minimum title or description',
    );
    icon = Icons.error_rounded;
    _initializeAttributes(errorColor);
  }

  JCherryToast.warning({
    super.key,
    this.title,
    this.action,
    this.actionHandler,
    this.description,
    this.backgroundColor = defaultBackgroundColor,
    this.shadowColor = defaultShadowColor,
    this.toastPosition = Position.top,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.animationCurve = Curves.ease,
    this.animationType = AnimationType.fromLeft,
    this.autoDismiss = true,
    this.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    this.layout = ToastLayout.ltr,
    this.displayCloseButton = true,
    this.borderRadius = 20,
    this.iconWidget,
    this.displayIcon = true,
    this.enableIconAnimation = true,
    this.height,
    this.width,
    this.constraints,
    required this.snackbarQueue,
    this.disableToastAnimation = false,
    this.onToastClosed,
    this.onTap,
  }) {
    assert(
      title != null || description != null,
      'Cherry toast must be initialized with minimum title or description',
    );
    icon = Icons.warning_rounded;
    _initializeAttributes(warningColor);
  }

  JCherryToast.info({
    super.key,
    this.title,
    this.action,
    this.actionHandler,
    this.description,
    required this.snackbarQueue,
    this.backgroundColor = defaultBackgroundColor,
    this.shadowColor = defaultShadowColor,
    this.toastPosition = Position.top,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.animationCurve = Curves.ease,
    this.animationType = AnimationType.fromLeft,
    this.autoDismiss = true,
    this.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    this.layout = ToastLayout.ltr,
    this.displayCloseButton = true,
    this.borderRadius = 20,
    this.displayIcon = true,
    this.enableIconAnimation = true,
    this.iconWidget,
    this.height,
    this.width,
    this.constraints,
    this.disableToastAnimation = false,
    this.onToastClosed,
    this.onTap,
  }) {
    assert(
      title != null || description != null,
      'Cherry toast must be initialized with minimum title or description',
    );
    icon = Icons.info_rounded;
    _initializeAttributes(infoColor);
  }

  void _initializeAttributes(Color color) {
    themeColor = color;
    iconColor = color;
    iconSize = 20;
  }

  final Function? onTap;

  ///Text widget displayed as a title in the toast
  ///required parameter for all toast types
  final Text? title;

  ///Text widget displayed as a description in the toast
  final Text? description;

  ///THe action button displayed below description
  ///by default there's no action added
  final Text? action;

  ///the toast icon, it's required when using the default constructor
  ///
  late IconData icon;

  ///the Icon color
  ///this parameter is only available on the default constructor
  ///for the built-in themes the color  will be set automatically
  late Color iconColor;
  //background color of container
  final Color backgroundColor;
  //box shadow color of container
  final Color shadowColor;
  //Custom widget displayed at the place of the predefined icons
  final Widget? iconWidget;

  ///the icon size
  ///by default is 20
  ///this parameter is available in default constructor
  late double iconSize;

  ///the toast display postion, possible values
  ///```dart
  ///{
  ///top,
  ///bottom
  ///}
  ///```
  final Position toastPosition;

  ///The color that will be applied on the circle behind the icon
  ///for better rendering the action button must have the same color
  ///
  late Color themeColor;

  ///the function invoked when clicking on the action button
  ///
  final Function? actionHandler;

  ///The duration of the animation by default it's 1.5 seconds
  ///
  final Duration animationDuration;

  ///the animation curve by default it's set to `Curves.ease`
  ///
  final Cubic animationCurve;

  ///The animation type applied on the toast
  ///```dart
  ///{
  ///fromTop,
  ///fromLeft,
  ///fromRight
  ///}
  ///```
  final AnimationType animationType;

  ///indicates whether the toast will be hidden automatically or not
  ///
  final bool autoDismiss;

  ///the duration of the toast if [autoDismiss] is true
  ///by default it's 3 seconds
  ///
  final Duration toastDuration;

  ///the layout of the toast
  ///```dart
  ///{
  ///ltr,
  ///rtl
  ///}
  ///

  ///```
  final ToastLayout layout;

  ///Display / Hide the close button icon
  ///by default it's true
  final bool displayCloseButton;

  ///define the border radius applied on the toast
  ///by default it's 20
  ///
  final double borderRadius;

  ///Define whether the icon will be  rendered or not
  ///
  final bool displayIcon;

  ///Define wether the animation on the icon will be rendered or not
  ///
  final bool enableIconAnimation;

  /// The attribute  is declaring a final variable named "width" of type double with a nullable value.
  /// width attribute define the toast width
  final double? width;

  /// The attribute is declaring a final variable named "height" of type double with a nullable type
  /// modifier.
  /// height attribute define the toast height
  final double? height;

  ///Enable taost constraints customization (by default it's null)
  final BoxConstraints? constraints;

  ///indicate whether the toast animation is enabled or not
  ///by default the toast animation is enabled
  final bool disableToastAnimation;

  ///Callback invoked when toast get dismissed (closed by button or dismissed automtically)
  final Function()? onToastClosed;

  void show(BuildContext context) {
    overlayEntry = _overlayEntryBuilder();
    final overlay = Overlay.maybeOf(context);

    if (overlay != null) {
      overlay.insert(overlayEntry!);
    } else {
      Navigator.of(context).overlay?.insert(overlayEntry!);
    }
  }

  void closeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  ///Display the created cherry toast
  ///[context] the context of the application
  ///
  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      opaque: false,
      builder: (context) {
        return SafeArea(
          child: GestureDetector(
            onTap: onTap != null
                ? () {
                    onTap!();
                    closeOverlay();
                  }
                : null,
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              alignment: toastPosition.alignment,
              contentPadding: const EdgeInsets.all(0),
              insetPadding: const EdgeInsets.all(30),
              content: this,
            ),
          ),
        );
      },
    );
  }

  @override
  _JCherryToastState createState() => _JCherryToastState();
}

class _JCherryToastState extends State<JCherryToast>
    with TickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late Animation<Offset> disabledAnimationOffset;
  late AnimationController slideController;
  late BoxDecoration toastDecoration;
  Timer? autoDismissTimer;

  @override
  void initState() {
    super.initState();
    initAnimation();

    toastDecoration = BoxDecoration(
      color: widget.backgroundColor,
      border: Border.all(
        color: Colors.white,
        width: 1,
      ),
      // borderRadius: BorderRadius.circular(widget.borderRadius),
      // boxShadow: [
      //   BoxShadow(
      //     color: widget.shadowColor,
      //     spreadRadius: 1,
      //     blurRadius: 2,
      //     offset: const Offset(0, 1), // changes position of shadow
      //   ),
      // ],
    );
    if (widget.autoDismiss) {
      autoDismissTimer = Timer(widget.toastDuration, () {
        if (!widget.disableToastAnimation) {
          // slideController.reverse();
        }
        Timer(widget.animationDuration, () {
          widget.closeOverlay();
        });
      });
    }
  }

  @override
  void dispose() {
    widget.onToastClosed?.call();
    autoDismissTimer?.cancel();
    if (!widget.disableToastAnimation) {
      slideController.dispose();
    }
    super.dispose();
  }

  late Animation<Offset> sequenceAnimation;

  ///Initialize animation parameters [slideController] and [offsetAnimation]
  void initAnimation() {
    slideController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    if (widget.disableToastAnimation) {
      disabledAnimationOffset = Tween<Offset>(
        begin: const Offset(0, 0),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: slideController,
          curve: widget.animationCurve,
        ),
      );
    } else {
      switch (widget.animationType) {
        case AnimationType.fromLeft:
          // offsetAnimation = Tween<Offset>(
          //   begin: const Offset(-2, 0),
          //   end: const Offset(0, 0),
          // ).animate(
          //   CurvedAnimation(
          //     parent: slideController,
          //     curve: widget.animationCurve,
          //   ),
          // );

          offsetAnimation = TweenSequence(
            <TweenSequenceItem<Offset>>[
              TweenSequenceItem<Offset>(
                tween: Tween<Offset>(
                        begin: const Offset(-2, 0), end: const Offset(0, 0))
                    .chain(CurveTween(curve: Curves.easeIn)),
                weight: 1.0,
              ),
              TweenSequenceItem<Offset>(
                tween: Tween<Offset>(
                  begin: const Offset(0, 0),
                  end: const Offset(0, 0),
                ).chain(CurveTween(curve: Curves.easeOut)),
                weight: 13.0,
              ),
              TweenSequenceItem<Offset>(
                tween: Tween<Offset>(
                        begin: const Offset(0, 0), end: const Offset(2, 0))
                    .chain(CurveTween(curve: Curves.easeInOut)),
                weight: 1.0,
              ),
            ],
          ).animate(slideController);

          break;
        case AnimationType.fromRight:
          offsetAnimation = Tween<Offset>(
            begin: const Offset(2, 0),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: slideController,
              curve: widget.animationCurve,
            ),
          );
          break;
        case AnimationType.fromTop:
          offsetAnimation = Tween<Offset>(
            begin: const Offset(0, -2),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: slideController,
              curve: widget.animationCurve,
            ),
          );
          break;
        case AnimationType.fromBottom:
          offsetAnimation = Tween<Offset>(
            begin: const Offset(0, 2),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: slideController,
              curve: widget.animationCurve,
            ),
          );
          break;
        default:
      }
    }

    /// ! To support Flutter < 3.0.0
    /// This allows a value of type T or T?
    /// to be treated as a value of type T?.
    ///
    /// We use this so that APIs that have become
    /// non-nullable can still be used with `!` and `?`
    /// to support older versions of the API as well.
    T? ambiguate<T>(T? value) => value;

    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback((_) {
      if (!widget.disableToastAnimation) {
        slideController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animationType == AnimationType.fromBottom) {
      return AnimatedBuilder(
        animation: offsetAnimation,
        builder: (ctx, child) {
          return Transform.translate(
            offset: offsetAnimation.value,
            child: renderJCherryToastContent(context),
          );
        },
      );
    }

    return SlideTransition(
      position: widget.disableToastAnimation
          ? disabledAnimationOffset
          : offsetAnimation,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: renderJCherryToastContent(context),
      ),
    );
  }

  ///render a left layout toast if [this.widget.layout] set to LTR
  ///
  Widget renderJCherryToastContent(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: toastDecoration,
          constraints: widget.constraints,
          width: widget.width,
          height: widget.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: widget.description.isNotNull &&
                                widget.title.isNotNull
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          widget.iconWidget ??
                              (widget.displayIcon
                                  ? JCherryToastIcon(
                                      color: widget.themeColor,
                                      icon: widget.icon,
                                      iconSize: widget.iconSize,
                                      iconColor: widget.iconColor,
                                      enableAnimation:
                                          widget.enableIconAnimation,
                                    )
                                  : const SizedBox()),
                          renderToastContent(),
                        ],
                      ),
                    ),
                    if (widget.displayCloseButton)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          right: 10,
                        ),
                        child: renderCloseButton(context),
                      ),
                  ],
                ),
                if (widget.snackbarQueue.isNotEmpty)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        widget.snackbarQueue.clear();
                        _handleClose();
                      },
                      child: Text(
                        'Close all ${widget.snackbarQueue.length}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// render the close button icon with a clickable  widget that
  /// will hide the toast
  ///
  InkWell renderCloseButton(BuildContext context) {
    return InkWell(
      onTap: _handleClose,
      child: Icon(
        Icons.close,
        color: Colors.grey[500],
        size: 15,
      ),
    );
  }

  void _handleClose() {
    if (!widget.disableToastAnimation &&
        widget.animationType != AnimationType.fromLeft) {
      slideController.reverse();
    }
    autoDismissTimer?.cancel();
    widget.closeOverlay();
  }

  ///render the toast content (Title, Description and Action)
  ///
  Expanded renderToastContent() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: widget.layout == ToastLayout.ltr
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            widget.description ?? const Text(''),
            // if (widget.title != null) widget.title!,
            // if (widget.description != null)
            //   Column(
            //     children: [
            //       const SizedBox(
            //         height: 5,
            //       ),
            //       widget.description!
            //     ],
            //   ),

            if (widget.action != null)
              Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      widget.actionHandler?.call();
                    },
                    child: widget.action,
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
