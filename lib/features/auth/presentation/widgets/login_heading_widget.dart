import 'package:flutter/material.dart';

import '../../../../../generated/generated.dart';

class LoginHeadingWidget extends StatelessWidget {
  const LoginHeadingWidget({
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
              'Login',
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
                      'User must be logged in',
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
