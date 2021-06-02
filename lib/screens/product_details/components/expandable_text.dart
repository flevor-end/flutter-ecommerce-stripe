import 'package:masdamas/screens/product_details/provider_models/ExpandText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class ExpandableText extends StatelessWidget {
  final String title;
  final String content;
  final int maxLines;
  const ExpandableText({
    Key key,
    this.title,
    @required this.content,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpandText(),
      child: Consumer<ExpandText>(builder: (context, expandText, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   title,
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontWeight: FontWeight.w600,
            //     fontSize: 16,
            //   ),
            // ),
            // Divider(
            //   height: 8,
            //   thickness: 1,
            //   endIndent: 16,
            // ),
            Text(
              content,
              maxLines: expandText.isExpanded ? null : maxLines,
              textAlign: TextAlign.left,
            ),
            GestureDetector(
              onTap: () {
                expandText.isExpanded ^= true;
              },
              child: Row(
                children: [
                  Text(
                    expandText.isExpanded == false
                        ? "Ver más detalles"
                        : "Mostrar menos ",
                    style: TextStyle(
                      color: kShopColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kShopColor,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
