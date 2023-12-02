import 'package:flutter/material.dart';

import '../AddNewSpace.dart';
import 'Logo.dart';

class ComfyShareAppBar extends StatefulWidget implements PreferredSizeWidget{
  const ComfyShareAppBar({super.key});

  @override
  State<ComfyShareAppBar> createState() => _ComfyShareAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class _ComfyShareAppBarState extends State<ComfyShareAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const ComfyLogo(),
        actionsIconTheme: const IconThemeData(
          size: 46.0,
        ),
        actions:const [
          AddNewSpaceWidget(),
        ]
    );
  }
}
