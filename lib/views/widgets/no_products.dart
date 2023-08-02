import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';

class KNoProductsView extends StatelessWidget {
  const KNoProductsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SvgPicture.asset('assets/images/no_products.svg'),
          const SizedBox(height: 30),
          Text(Tr.get.no_products, style: KTextStyle.of(context).headers),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}