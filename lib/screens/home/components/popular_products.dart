import 'package:flutter/material.dart';
import 'package:masdamas/components/product_card.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: kPrimaryColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5),
            child: SectionTitle(
              text: "¡COMPREMOS!",
              press: () {},
              isColor: false,
            ),
          ),
          // SizedBox(
          //   height: 2,
          // ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // ...List.generate(products.length, (index) {
                //   if (products[index].isPopular)
                //     return Padding(
                //       padding: const EdgeInsets.all(5),
                //       child: ProductCard(
                //         productId: products[index],
                //         press: () {}
                //       ),
                //     );

                //   return SizedBox.shrink();
                // }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
