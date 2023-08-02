import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';

class OnSuccessView extends StatefulWidget {
  final String msg;
  final Widget? destination, until;
  final bool? doubleBack;

  const OnSuccessView(
      {Key? key,
      required this.msg,
      this.destination,
      this.doubleBack = false,
      this.until})
      : super(key: key);

  @override
  State<OnSuccessView> createState() => _OnSuccessViewState();
}

class _OnSuccessViewState extends State<OnSuccessView> {
  @override
  void initState() {
    timer();
    super.initState();
  }

  timer() async {
    Timer(
      const Duration(seconds: 3),
      () {
        if (widget.destination == null && widget.until == null) {
          Navigator.pop(context);
          if (widget.doubleBack!) {
            Navigator.pop(context);
          }
        } else if (widget.until != null) {
          debugPrint('================= pushAndRemoveUntil : ${widget.until}');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => widget.until!),
              (route) => false);
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => widget.destination!));
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
            children: [
              SvgPicture.asset('assets/images/acc_added_success.svg'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.msg,
                        style: KTextStyle.of(context).body,
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
