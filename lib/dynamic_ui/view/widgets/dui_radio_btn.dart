import 'package:flutter/cupertino.dart';
import '../../../extensions.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../model/dynamic_ui_model.dart';

class DynamicRadioButton extends StatefulWidget {
  const DynamicRadioButton({
    Key? key,
    required this.field,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  final DUIFieldModel field;
  final void Function(bool) onChanged;
  final bool value;

  @override
  State<DynamicRadioButton> createState() => _DynamicRadioButtonState();
}

class _DynamicRadioButtonState extends State<DynamicRadioButton> {
  late bool _val;

  @override
  void initState() {
    _val = widget.value;
    super.initState();
  }

  _onChanged(bool v) {
    setState(() {
      _val = !_val;
    });
    widget.onChanged(_val);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onChanged(!_val),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: 45,
        decoration: KHelper.of(context).filled,
        child: Row(
          children: [
            const SizedBox(width: 8),
            Expanded(child: Text(widget.field.placeholder.replaceAll('_', ' ').capitalized, style: KTextStyle.of(context).title3)),
            Transform.scale(
              scale: .6,
              child: CupertinoSwitch(
                thumbColor: KColors.of(context).thumbColor,
                trackColor: KColors.of(context).background,
                value: _val,
                onChanged: _onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
