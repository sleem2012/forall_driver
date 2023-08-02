import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';

class OnErrorView extends StatefulWidget {
  final String msg;
  final Widget? destination;
  final bool? doubleBack;

  const OnErrorView({Key? key, required this.msg, this.destination, this.doubleBack = false}) : super(key: key);

  @override
  State<OnErrorView> createState() => _OnErrorViewState();
}

class _OnErrorViewState extends State<OnErrorView> {
  @override
  void initState() {
    timer();
    super.initState();
  }

  timer() async {
    Timer(
      const Duration(seconds: 4),
      () {
        if (widget.destination == null) {
          Navigator.pop(context);
          if (widget.doubleBack!) {
            Navigator.pop(context);
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => widget.destination!),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/Logo Only.svg'),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Sorry",
                style: KTextStyle.of(context).names,
              ),
              const SizedBox(
                height: 30,
              ),
              SvgPicture.asset('assets/images/oops.svg'),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.msg,
                        style: KTextStyle.of(context).names,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
