import 'package:crowdfunding_mobile/data/app_colors.dart';
import 'package:flutter/material.dart';


class FinanceListTile extends StatelessWidget {
  final String text;
  final Widget leadingIcon;
  final Widget trailingIcon;
  final Function() onTap;
  final Color color;
  const FinanceListTile(
      {required this.text,
      required this.leadingIcon,
      required this.trailingIcon,
      required this.onTap,
      this.color = const Color(0xFF4338CA),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          tileColor: mainColor,
          leading: leadingIcon,
          title: Text(
            text,
            textScaleFactor: 1,
          ),
          trailing: trailingIcon,
          selected: false,
          onTap: onTap,
        ),
      ),
      textColor: white,
      iconColor: white,
    );
  }
}
