import 'package:flutter/material.dart';

class LightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LightAppBar({Key? key, this.left, this.center, this.right}) : super(key: key);

  final Widget? left;
  final Widget? center;
  final Widget? right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (left != null) ? left! : const SizedBox(),
          (center != null) ? center! : const SizedBox(),
          (right != null) ? right! : const SizedBox(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 64);
}
