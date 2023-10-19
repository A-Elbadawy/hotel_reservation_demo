import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:reservation_demo/controller/app_controller.dart';
import 'package:reservation_demo/controller/hotel_reservation_controller.dart';
import 'package:reservation_demo/screens/bottom_sheet_widget/reservations_bottom_sheet_widget.dart';
import 'package:reservation_demo/screens/shared_widgets/generic_svg_widget.dart';
import 'package:reservation_demo/screens/shared_widgets/text_widget.dart';
import 'package:reservation_demo/screens/bottom_sheet_widget/ticket_bottom_sheet_widget.dart';
import 'package:reservation_demo/utils/globals.dart';
import 'package:reservation_demo/utils/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (controller) {
      return Scaffold(
        backgroundColor: MyThemes().backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ///
                    _buildOpenReservationButton(),
                    15.height,

                    ///
                    _buildShowIOSTicketButton(),
                    20.height,

                    ///
                    _buildShowAndroidTicketButton(),
                  ],
                ),

                ///
                _buildThemeSwitcherWidget(controller),
              ],
            ),
          ),
        ),
      );
    });
  }

  _buildOpenReservationButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
          onPressed: () async {
            if (Get.find<HotelReservationController>()
                .hotelReservations
                .reservations
                .isEmpty) {
              var isSuccess = await Get.find<HotelReservationController>()
                  .getHotelReservations();
              isSuccess
                  ? showCustomBottomSheet(
                      builder: (scrollController) =>
                          ReservationsBottomSheetWidget(scrollController),
                      initialChildSize: 0.50)
                  : null;
            } else {
              showCustomBottomSheet(
                  builder: (scrollController) =>
                      ReservationsBottomSheetWidget(scrollController),
                  initialChildSize: 0.50);
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 15,
            ),
            shape: const RoundedRectangleBorder(),
            backgroundColor: MyThemes().primaryButtonColor,
            minimumSize: Size(MediaQuery.of(context).size.width, 40),
          ),
          child: TextWidget(
            text: 'Open Reservation',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: MyThemes().primaryTextColor),
          )),
    );
  }

  _buildShowIOSTicketButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextButton(
          onPressed: () async {
            if (Get.find<HotelReservationController>()
                .hotelReservations
                .reservations
                .isEmpty) {
              var isSuccess = await Get.find<HotelReservationController>()
                  .getHotelReservations();
              isSuccess
                  ? showCustomBottomSheet(
                      builder: (scrollController) =>
                          TicketBottomSheetWidget(scrollController),
                      initialChildSize: 0.40)
                  : null;
            } else {
              showCustomBottomSheet(
                  builder: (scrollController) =>
                      TicketBottomSheetWidget(scrollController),
                  initialChildSize: 0.40);
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: MyThemes().primaryButtonColor)),
            backgroundColor: MyThemes().backgroundColor,
            minimumSize: Size(MediaQuery.of(context).size.width, 40),
          ),
          child: TextWidget(
            text: 'Show IOS Ticket',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: MyThemes().primaryButtonColor),
          )),
    );
  }

  _buildShowAndroidTicketButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextButton(
          onPressed: () async {
            if (Get.find<HotelReservationController>()
                .hotelReservations
                .reservations
                .isEmpty) {
              var isSuccess = await Get.find<HotelReservationController>()
                  .getHotelReservations();
              isSuccess
                  ? showCustomBottomSheet(
                      builder: (scrollController) =>
                          TicketBottomSheetWidget(scrollController),
                      initialChildSize: 0.40)
                  : null;
            } else {
              showCustomBottomSheet(
                  builder: (scrollController) =>
                      TicketBottomSheetWidget(scrollController),
                  initialChildSize: 0.40);
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 15,
            ),
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(),
            backgroundColor: MyThemes().backgroundColor,
            minimumSize: Size(MediaQuery.of(context).size.width, 40),
          ),
          child: TextWidget(
            text: 'Show Android Ticket ',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: MyThemes().primaryButtonColor),
          )),
    );
  }

  _buildThemeSwitcherWidget(AppController controller) {
    return Align(
      alignment: Alignment.topCenter,
      child: ListTile(
        leading: GenericSvgWidget(
            path: 'assets/svgs/theme_icon.svg',
            color: controller.isDark ? white : null),
        title: TextWidget(
          text: 'Theme',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: MyThemes().blackWhiteColor),
        ),
        trailing: GenericSvgWidget(
          path: controller.isDark
              ? 'assets/svgs/light_mode_icon.svg'
              : 'assets/svgs/dark_mode_icon.svg',
          onTap: () {
            setState(() {
              controller.switchTheme();
            });
          },
        ),
        // Switch(
        //   value: !controller.isDark,
        //   onChanged: (value) {
        //     setState(() {
        //       controller.switchTheme();
        //     });
        //   },
        //   activeTrackColor: appBackgroundColorDark,
        //   activeColor: white,
        //   inactiveThumbColor: white,
        //   inactiveTrackColor: appBackgroundColorLight,
        // ),
      ),
    );
  }
}
