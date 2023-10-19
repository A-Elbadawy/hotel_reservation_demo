import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:reservation_demo/models/reservations_model.dart';
import 'package:reservation_demo/screens/shared_widgets/circular_image_widget.dart';
import 'package:reservation_demo/screens/shared_widgets/text_widget.dart';
import 'package:reservation_demo/utils/themes.dart';

class TicketCardWidget extends StatelessWidget {
  final UserTicket ticket;

  const TicketCardWidget({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        26.height,
        Align(
            alignment: Alignment.centerLeft,
            child: TextWidget(
              text: 'Tickets:',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: MyThemes().blackWhiteColor),
            )),
        8.height,
        ///container with bottom corner clip path
        ClipPath(
          clipper: const CustomCornerClipPath(),
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: MyThemes().detailsCardColor,
            child: Row(
              children: [
                CircularImageWidget(
                    imageURL: ticket.ticketUserData?.avatar ??
                        'https://play-lh.googleusercontent.com/0SAFn-mRhhDjQNYU4'
                            '6ZwA7tz0xmRiQG4ZuZmuwU8lYmqj6zEpnqsee_6QDuhQ4ZofwXj=w240-h480-rw'),
                5.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text:
                          '${ticket.ticketUserData!.firstName} ${ticket.ticketUserData!.lastName}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: MyThemes().blackWhiteColor),
                    ),
                    TextWidget(
                      text: ticket.ticketSystemId ?? '#170122708123',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: MyThemes().secondaryTextColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        1.height,
        ///container with top corner clip path
        ClipPath(
          clipper: const CustomCornerClipPath(isTopCorners: true),
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: MyThemes().detailsCardColor,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichTextWidget(list: [
                      TextSpan(
                          text: 'Ticket Type: ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: MyThemes().blackWhiteColor)),
                      TextSpan(
                          text: ticket.ticketTypeName ?? 'MATCH Business Seat',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: MyThemes().secondaryTextColor)),
                    ]),
                    RichTextWidget(list: [
                      TextSpan(
                          text: 'Seat: ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: MyThemes().blackWhiteColor)),
                      TextSpan(
                          text: ticket.seat ?? 'Block 112 / Row S / Seat 1',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: MyThemes().secondaryTextColor)),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ),
        15.height,
      ],
    );
  }
}

class CustomCornerClipPath extends CustomClipper<Path> {
  final double cornerR;
  final bool isTopCorners;

  const CustomCornerClipPath({this.cornerR = 8.0, this.isTopCorners = false});

  @override
  Path getClip(Size size) {
    Path topCornerClipPath = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width - cornerR, 0)
      ..arcToPoint(
        Offset(size.width, cornerR),
        radius: Radius.circular(cornerR),
        clockwise: false,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..lineTo(0, cornerR)
      ..arcToPoint(
        Offset(cornerR, 0),
        radius: Radius.circular(cornerR),
        clockwise: false,
      )
      ..lineTo(0, 0);

    ///
    Path bottomCornerClipPath = Path()
      ..lineTo(size.width, 0)
      ..lineTo(
        size.width,
        size.height - cornerR,
      )
      ..arcToPoint(
        Offset(
          size.width - cornerR,
          size.height,
        ),
        radius: Radius.circular(cornerR),
        clockwise: false,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(cornerR, size.height)
      ..arcToPoint(
        Offset(
          0,
          size.height - cornerR,
        ),
        radius: Radius.circular(cornerR),
        clockwise: false,
      )
      ..lineTo(0, size.height);
    return isTopCorners ? topCornerClipPath : bottomCornerClipPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
