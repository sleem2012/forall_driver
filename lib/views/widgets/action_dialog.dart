import 'package:flutter/material.dart';
import '../../shared/theme/helper.dart';

import '../../shared/theme/text_theme.dart';
import 'custom_button.dart';

class ActionDialog extends StatelessWidget {
  final String? title;
  final List<Widget> content;
  final ShapeBorder? shape;
  final String? approveAction;
  final String? cancelAction;
  final void Function()? onApproveClick;
  final void Function()? onCancelClick;

  const ActionDialog({
    Key? key,
    this.title,
    this.content = const <Widget>[],
    this.shape,
    this.approveAction,
    this.cancelAction,
    this.onApproveClick,
    this.onCancelClick,
  }) : super(key: key);

  void show<T>(BuildContext context) => KHelper.showCustomBottomSheet(this);

  @override
  Widget build(BuildContext context) {
    assert(onCancelClick != null && cancelAction != null);
    assert(onApproveClick != null && approveAction != null);

    return Column(
      children: [
        const SizedBox(height: 30),
        const Icon(Icons.info_outline_rounded, size: 50),
        const SizedBox(height: 30),
        if (title != null)
          Text(
            title!,
            textAlign: TextAlign.center,
            style: KTextStyle.of(context).body,
          ),
        const SizedBox(height: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: content,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              if (onApproveClick != null)
                Expanded(
                  child: KButton(
                    title: approveAction!,
                    onPressed: onApproveClick!,
                  ),
                ),
              const SizedBox(height: 10),
              if (onCancelClick != null)
                Expanded(
                  child: TextButton(
                    onPressed: onCancelClick!,
                    child: Text(cancelAction!),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
