import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:reservation_demo/controller/hotel_reservation_controller.dart';
import 'package:reservation_demo/screens/bottom_sheet_widget/widgets/expanded_hotel_card_widget.dart';
import 'package:reservation_demo/screens/shared_widgets/text_widget.dart';
import 'package:reservation_demo/utils/themes.dart';

class ReservationsBottomSheetWidget extends StatelessWidget {
  final ScrollController scrollController;
  const ReservationsBottomSheetWidget(this.scrollController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelReservationController>(builder: (controller) {
      var staysList = controller.hotelReservations.reservations.first.stays;
      return Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                25.height,
                Image.network(staysList.first.stayImages.first),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            text: 'Hotel Check-in',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: MyThemes().blackWhiteColor),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            text: 'Multiple Reservations',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: MyThemes().blackWhiteColor),
                          )),
                      10.height,
                      ...List.generate(
                          controller
                              .hotelReservations.reservations.first.stays.length,
                          (index) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 3.0),
                                child: ExpandedHotelCardWidget(
                                    reservation: controller
                                        .hotelReservations.reservations.first,
                                    hotelStay: controller.hotelReservations
                                        .reservations.first.stays[index],
                                    isClicked: index == 0 ? true : false),
                              )),
                    ],
                  ),
                ),
                8.height,
                1.height,
                15.height,
              ],
            ),
          ),
          Container(
            height: 25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: MyThemes().topBarBSColor,
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20))),
            child: Center(
              child: Container(
                width: 55,
                height: 6,
                decoration: BoxDecoration(
                    color: white.withOpacity(0.63),
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
          )
        ],
      );
    });
  }
}
