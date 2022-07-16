import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class PoweredBySection extends StatelessWidget {
  const PoweredBySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 36),
        Text(S.of(context).powered_by_text, style: const TextStyle( fontWeight: FontWeight.bold,)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Image(
              image: AssetImage('airtable.png'),
              width: 96,
              height: 96,
            ),
            Image(
              image: AssetImage('dio.png'),
              width: 96,
              height: 96,
            ),
            Image(
              image: AssetImage('flutter_bloc.png'),
              width: 96,
              height: 96,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(S.of(context).designed_with, style: const TextStyle( fontWeight: FontWeight.bold,)),
      ],
    );
  }
}
