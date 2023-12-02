import 'package:comfyshare/UniversalVariables.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ComfyLogo extends StatelessWidget {
  const ComfyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 46, width: 46,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                  )
                ]
            ),
            child: Image.asset('assets/ComfyLogo.png', width: 46,)),
        const Gap(14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello 👋',style: LogoHelloStyle,),
            Text('There!',style: LogoThereStyle)
          ],
        )
      ],
    );
  }
}
