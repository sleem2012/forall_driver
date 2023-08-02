import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../../shared/theme/helper.dart';

class DUILoadingWrapper extends StatelessWidget {
  final Widget child;
  final bool isLoading, destroy;
  const DUILoadingWrapper({Key? key, required this.child, this.isLoading = false, this.destroy = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(KHelper.cornerRadius + 2),
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isLoading && destroy) SizedBox(key: GlobalKey(), child: child) else child,
              if (isLoading)
                Positioned(
                  top: 0,
                  width: width,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                    child: Container(decoration: const BoxDecoration(color: Colors.transparent)),
                  ),
                ),
              if (isLoading)
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: width,
                        height: 2,
                        child: const LinearProgressIndicator(),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
