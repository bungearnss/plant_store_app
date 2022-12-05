import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ReviewerItem extends StatelessWidget {
  const ReviewerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          const Positioned(
            child: CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(
                  "https://www.opticalexpress.co.uk/media/1064/man-with-glasses-smiling-looking-into-distance.jpg"),
            ),
          ),
          const Positioned(
            right: 67,
            child: CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR47eGNB4uktvhbGIeWWDPNl-0L1EBWByWRkg&usqp=CAU"),
            ),
          ),
          const Positioned(
            right: 53,
            child: CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(
                  "https://digitalasset.intuit.com/content/dam/intuit/pcg/en_ca/profile/web/image/photos/grinning-man-with-coffee-image-profile-ca-desktop.jpg"),
            ),
          ),
          const Positioned(
            right: 39,
            child: CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(
                  "https://quickbooks.intuit.com/oidam/intuit/sbseg/en_us/Blog/Photography/Stock/Everything-you-need-to-know-about-small-business-tax-payments_featured.jpg"),
            ),
          ),
          const Positioned(
            right: 25,
            child: CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(
                  "https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg"),
            ),
          ),
          Positioned(
            right: 11,
            child: CircleAvatar(
              backgroundColor: accentColor,
              radius: 10,
              child: Text(
                "+20",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      fontSize: 8,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
