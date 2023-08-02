import 'package:flutter/material.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/views/widgets/icon_button.dart';


class CapAppBar extends StatefulWidget {
  const CapAppBar({Key? key}) : super(key: key);

  @override
  State<CapAppBar> createState() => _CapAppBarState();
}

class _CapAppBarState extends State<CapAppBar> {
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          setState(() {
            isOnline = !isOnline;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(2),
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1.3, color: isOnline ? Colors.yellowAccent : Colors.red),
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 500),
            alignment: isOnline ? Alignment.centerRight : Alignment.centerLeft,
            curve: Curves.fastOutSlowIn,
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: isOnline ? Colors.yellowAccent : Colors.red),
                    child: Text(
                      isOnline ? Tr.get.online :Tr.get.offline ,
                      style: const TextStyle(fontSize: 10, color: Colors.black),
                    )),
              ],
            ),
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: KIconButton(
            onPressed: () {},
            child: const Icon(Icons.settings),
          ),
        ),
      ],
      leading: KIconButton(
        onPressed: () {},
        child: const Icon(Icons.list),
      ),
    );
  }
}
