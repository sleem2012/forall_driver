import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forall_driver/shared/theme/colors.dart';

class AppLoader extends StatefulWidget {
  final String? title;

  const AppLoader({Key? key, this.title}) : super(key: key);
  @override
  State<AppLoader> createState() => _AppLoaderState();

  void showAsDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => this,
    );
  }
}

class _AppLoaderState extends State<AppLoader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.title ?? '', textAlign: TextAlign.center, style: const TextStyle(fontSize: 17, color: Colors.grey)),
        Container(
          padding: const EdgeInsets.all(50),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: KColors.of(context).accentColor,
                    // valueColor: An,
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/Logo Only.svg',
                  height: 60,
                  width: 60,
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 20),
      ],
    );
  }
}
