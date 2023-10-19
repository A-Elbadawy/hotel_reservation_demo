import 'package:flutter/material.dart';
import 'package:reservation_demo/screens/shared_widgets/circular_image_widget.dart';
import 'package:reservation_demo/screens/shared_widgets/text_widget.dart';
import 'package:reservation_demo/utils/themes.dart';

class HotelCardNameWidget extends StatelessWidget {
  final String hotelName;
  final String imageURL;
  final bool isClicked;

  const HotelCardNameWidget(
      {Key? key, required this.hotelName, required this.imageURL,required this.isClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyThemes().hotelCardColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(isClicked ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            size: 35, color: MyThemes().blackWhiteColor),
        title: TextWidget(
          text: hotelName,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: MyThemes().blackWhiteColor),
        ),
        trailing: CircularImageWidget(
            imageURL: imageURL),
      ),
    );
  }
}
