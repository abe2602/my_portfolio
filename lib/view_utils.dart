import 'package:flutter/material.dart';
import 'dart:html' as html;

const String WorkRoute = '/work';
const String AboutRoute = '/about';

class RoundedProfilePicture extends StatelessWidget {
  const RoundedProfilePicture({@required this.imageUrl})
      : assert(imageUrl != null);

  final String imageUrl;

  @override
  Widget build(BuildContext context) => Card(
    elevation: 10,
    shape: const CircleBorder(),
    child: CircleAvatar(
      maxRadius: 110,
      backgroundImage: AssetImage(imageUrl),
      backgroundColor: Colors.white,
    ),
  );
}

class CustomAppBarItem extends StatelessWidget {
  const CustomAppBarItem(
      {@required this.itemText,
        @required this.onTap,
        @required this.navigatorKey,
      @required this.rootPage})
      : assert(itemText != null),
        assert(onTap != null),
        assert(navigatorKey != null),
        assert(rootPage != null);

  final String itemText;
  final Function onTap;
  final GlobalKey<NavigatorState> navigatorKey;
  final String rootPage;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Text(
        itemText,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    ),
  ).showCursorOnHover.moveUpOnHover;
}

// Based on: https://medium.com/flutter-community/hover-effects-in-flutter-web-using-extensions-2eb262bb6309
class TranslateOnHover extends StatefulWidget {
  final Widget child;
  const TranslateOnHover({Key key, this.child}) : super(key: key);

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -5, 0);
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}

extension HoverExtensions on Widget {
  // Get a regerence to the body of the view
  static final appContainer = html.window.document.getElementById('app-container');
  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      // When the mouse enters the widget set the cursor to pointer
      onHover: (event) {
        appContainer.style.cursor = 'pointer';
      },
      // When it exits set it back to default
      onExit: (event) {
        appContainer.style.cursor = 'default';
      },
    );
  }

  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }
}



