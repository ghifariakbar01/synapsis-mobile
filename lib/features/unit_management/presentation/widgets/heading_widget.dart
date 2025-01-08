/*
   Discarded - Use postman instead
*/

import 'package:flutter/material.dart';

import '../../../../../generated/generated.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14.0,
      children: [
        Assets.icons.icInstallation.svg(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Processing',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 35,
              width: MediaQuery.of(context).size.width / 1.5,
              child: const Row(
                children: [
                  Flexible(
                    child: Text(
                      'Mandatory before login tablet',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
