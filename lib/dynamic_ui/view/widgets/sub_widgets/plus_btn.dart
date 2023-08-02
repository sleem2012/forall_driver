import 'package:flutter/material.dart';

import '../dui_notifications.dart';

class DUIPlusBtn extends StatelessWidget {
  const DUIPlusBtn({Key? key, this.onPressed, this.hasError = false}) : super(key: key);
  final void Function()? onPressed;
  final bool? hasError;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: const StadiumBorder(),
        child: Icon(Icons.add_circle_rounded, color: hasError! ? Colors.red : null),
      ),
    );
  }
}

class DUIconButton extends StatelessWidget {
  const DUIconButton({Key? key, this.onPressed, required this.child, this.radius, this.isLoading = false}) : super(key: key);
  final void Function()? onPressed;
  final Widget child;
  final double? radius;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius ?? 30,
      height: radius ?? 30,
      child: isLoading!
          ? const SizedBox(
              height: 15,
              width: 15,
              child: Center(child: Padding(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator())),
            )
          : RawMaterialButton(
              onPressed: onPressed,
              shape: const StadiumBorder(),
              child: child,
            ),
    );
  }
}

class DUIChip extends StatelessWidget {
  final void Function(dynamic key)? onDeleted;
  final Map<String, dynamic> map;

  const DUIChip({super.key, this.onDeleted, required this.map});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 5,
        runSpacing: 5,
        children: map.entries
            .map(
              (e) => Chip(
                label: Text(e.value),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onDeleted: onDeleted != null
                    ? () {
                        onDeleted?.call(e.key);
                      }
                    : null,
              ),
            )
            .toList(),
      ),
    );
  }
}

class DUIChips extends StatelessWidget {
  final void Function(NotifyModel e)? onDeleted;
  final List<NotifyModel> list;
  const DUIChips({super.key, this.onDeleted, required this.list});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 5,
      runSpacing: 2,
      children: list
          .map(
            (e) => Chip(
              label: Text('${e.date} , ${e.title} , ${e.description}'),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onDeleted: () => onDeleted?.call(e),
            ),
          )
          .toList(),
    );
  }
}

class KDivider extends StatelessWidget {
  const KDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 2, thickness: 1);
  }
}
