import 'package:flutter/material.dart';

class RectGetter extends StatefulWidget {
  final GlobalKey<RectGetterState> rectKey;
  final Widget child;

  /// Use this static method to get child`s rectangle information when had a custom GlobalKey
  static Rect? getRectFromKey(GlobalKey<RectGetterState> globalKey) {
    var object = globalKey.currentContext?.findRenderObject();
    var translation = object?.getTransformTo(null).getTranslation();
    var size = object?.semanticBounds.size;

    if (translation != null && size != null) {
      return Rect.fromLTWH(translation.x, translation.y, size.width, size.height);
    } else {
      return null;
    }
  }

  /// create a custom GlobalKey , use this way to avoid type exception in dart2 .
  static GlobalKey<RectGetterState> createGlobalKey() => GlobalKey<RectGetterState>();

  /// constructor with key passed , and then you can get child`s rect by using RectGetter.getRectFromKey(key)
  const RectGetter({required this.rectKey, required this.child}) : super(key: rectKey);

  factory RectGetter.defaultKey({required Widget child}) => RectGetter(rectKey: GlobalKey(), child: child);

  Rect? getRect() => getRectFromKey(rectKey);

  RectGetter clone() => RectGetter.defaultKey(child: child);


  @override
  RectGetterState createState() => RectGetterState();

}

class RectGetterState extends State<RectGetter> {
  @override
  Widget build(BuildContext context) => widget.child;
}
