import 'package:flutter/material.dart';
import 'package:reservation_demo/models/reservations_model.dart';
import 'package:reservation_demo/screens/bottom_sheet_widget/widgets/hotel_card_details_widget.dart';
import 'package:reservation_demo/screens/bottom_sheet_widget/widgets/hotel_card_name_widget.dart';

class ExpandedHotelCardWidget extends StatefulWidget {
  final Reservation reservation;
  final Stay hotelStay;
  final bool isClicked;

  const ExpandedHotelCardWidget(
      {Key? key,
      required this.reservation,
      required this.isClicked,
      required this.hotelStay})
      : super(key: key);

  @override
  State<ExpandedHotelCardWidget> createState() =>
      _ExpandedHotelCardWidgetState();
}

class _ExpandedHotelCardWidgetState extends State<ExpandedHotelCardWidget> {
  late bool _isClicked;

  @override
  void initState() {
    super.initState();
    _isClicked = widget.isClicked;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              //open & close expanded hotel card widget
              _isClicked = !_isClicked;
            });
          },
          child: HotelCardNameWidget(
            hotelName: widget.hotelStay.name ?? 'Hotel Name',
            imageURL: widget.hotelStay.rooms.first.guests.first.avatar ??
                'https://play-lh.googleusercontent.com/0SAFn-mRhhDjQNYU4'
                    '6ZwA7tz0xmRiQG4ZuZmuwU8lYmqj6zEpnqsee_6QDuhQ4ZofwXj=w240-h480-rw',
            isClicked: _isClicked,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          reverseDuration: const Duration(milliseconds: 100),
          child: _isClicked
              ? HotelCardDetailsWidget(
                  reservation: widget.reservation,
                  hotelStay: widget.hotelStay,
                )
              : Container(),
        ),
      ],
    );
  }
}
