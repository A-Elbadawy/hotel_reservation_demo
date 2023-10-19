import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_demo/controller/hotel_reservation_controller.dart';
import 'package:reservation_demo/screens/bottom_sheet_widget/widgets/ticket_card_widget.dart';
import 'package:reservation_demo/utils/themes.dart';

class TicketBottomSheetWidget extends StatelessWidget {
  final ScrollController scrollController;

  const TicketBottomSheetWidget(this.scrollController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelReservationController>(builder: (controller) {
      return Stack(
        children: [
          ///TicketCardWidget
          SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TicketCardWidget(
                  ticket: controller
                      .hotelReservations.reservations.first.userTickets.first),
            ),
          ),
          ///
          Container(
            height: 25,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20))),
            child: Center(
              child: Container(
                width: 55,
                height: 6,
                decoration: BoxDecoration(
                    color: MyThemes().blackWhiteColor,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
          )
        ],
      );
    });
  }
}
