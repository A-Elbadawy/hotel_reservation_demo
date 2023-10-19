import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:reservation_demo/models/reservations_model.dart';
import 'package:reservation_demo/screens/bottom_sheet_widget/widgets/ticket_card_widget.dart';
import 'package:reservation_demo/screens/shared_widgets/circular_image_widget.dart';
import 'package:reservation_demo/screens/shared_widgets/generic_svg_widget.dart';
import 'package:reservation_demo/screens/shared_widgets/text_widget.dart';
import 'package:reservation_demo/utils/themes.dart';

class HotelCardDetailsWidget extends StatefulWidget {
  final Reservation reservation;
  final Stay hotelStay;

  const HotelCardDetailsWidget(
      {Key? key, required this.reservation, required this.hotelStay})
      : super(key: key);

  @override
  State<HotelCardDetailsWidget> createState() => _HotelCardDetailsWidgetState();
}

class _HotelCardDetailsWidgetState extends State<HotelCardDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyThemes().hotelCardColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: MyThemes().secondaryTextColor,
              indent: 10,
              endIndent: 10,
            ),

            ///Guests title
            TextWidget(
              text: 'Guests:',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: MyThemes().blackWhiteColor),
            ),

            ///guests name - image
            _buildGuestNameImageRowWidget(
                imageURL:
                    widget.hotelStay.rooms.first.guests.first.avatar ?? '',
                fullName:
                    '  ${widget.hotelStay.rooms.first.guests.first.firstName ?? ''} ${widget.hotelStay.rooms.first.guests.first.lastName ?? ""}'),
            10.height,

            ///From - till
            _buildRowWithTowColumnWidget(
                firstColumn: _buildColumnWithToChildTextWidget(
                    title: 'From',
                    content: widget.reservation.startDate ?? 'Jan 01, 2022'),
                secondColumn: _buildColumnWithToChildTextWidget(
                    title: 'Till',
                    content: widget.reservation.endDate ?? 'Jan 01, 2022')),
            10.height,

            ///Stars
            _buildRowWithTowColumnWidget(
                firstColumn: _buildRatingStarsWidget(),
                secondColumn: _buildColumnWithToChildTextWidget(
                    title: 'Room Count',
                    content: widget.hotelStay.rooms.length.toString())),
            10.height,

            ///location title
            TextWidget(
              text: 'Location:',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: MyThemes().blackWhiteColor),
            ),

            ///map address
            _buildAddressMapWidget(),

            ///ticket card
            TicketCardWidget(
              ticket: widget.reservation.userTickets.first,
            ),
            15.height,
            Divider(
              color: MyThemes().secondaryTextColor,
              indent: 10,
              endIndent: 10,
            ),
            15.height,

            ///room reservation title
            TextWidget(
              text: 'Room Reservation 01',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: MyThemes().blackWhiteColor),
            ),
            15.height,

            ///guests title
            TextWidget(
              text: 'Guests:',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: MyThemes().blackWhiteColor),
            ),

            ///guests name & image list
            ...List.generate(
                widget.hotelStay.rooms.first.guests.length,
                (index) => _buildGuestNameImageRowWidget(
                    imageURL:
                        widget.hotelStay.rooms.first.guests[index].avatar ?? '',
                    fullName:
                        '  ${widget.hotelStay.rooms.first.guests[index].firstName ?? ''} ${widget.hotelStay.rooms.first.guests[index].lastName ?? ""}')),
            15.height,

            ///Room Type title
            TextWidget(
              text: 'Room Type',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: MyThemes().blackWhiteColor),
            ),

            ///Room Type
            TextWidget(
              text: widget.hotelStay.rooms.first.roomTypeName ??
                  'Presedential Wing',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: MyThemes().blackWhiteColor),
            ),
            15.height,

            ///Room number & Sleeps
            _buildRowWithTowColumnWidget(
                firstColumn: _buildColumnWithToChildTextWidget(
                    title: 'Room Number',
                    content: widget.hotelStay.rooms.first.roomNumber ?? ''),
                secondColumn: _buildColumnWithToChildTextWidget(
                    title: 'Sleeps',
                    content:
                        widget.hotelStay.rooms.first.roomCapacity.toString())),
            15.height,
            Divider(
              color: MyThemes().secondaryTextColor,
              indent: 10,
              endIndent: 10,
            ),
            15.height,

            ///Gallery title
            TextWidget(
              text: 'Gallery:',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: MyThemes().blackWhiteColor),
            ),

            /// gallery list
            _buildListOfImagesWidget(),
            15.height,

            ///Amenities title
            TextWidget(
              text: 'Amenities',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: MyThemes().blackWhiteColor),
            ),

            ///Amenities
            TextWidget(
              text: widget.hotelStay.amenities ?? '',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: MyThemes().blackWhiteColor),
            ),
            15.height,
          ],
        ),
      ),
    );
  }

  _buildGuestNameImageRowWidget(
      {required String imageURL, required String fullName}) {
    return Row(
      children: [
        CircularImageWidget(imageURL: imageURL),
        TextWidget(
          text: fullName,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: MyThemes().blackWhiteColor),
        ),
      ],
    );
  }

  _buildRowWithTowColumnWidget(
      {required Widget firstColumn, required Widget secondColumn}) {
    return Row(children: [
      firstColumn,
      70.width,
      secondColumn,
    ]);
  }

  _buildColumnWithToChildTextWidget(
      {required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: title,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: MyThemes().blackWhiteColor),
        ),
        TextWidget(
          text: content,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: MyThemes().blackWhiteColor),
        ),
      ],
    );
  }

  _buildRatingStarsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Stars',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: MyThemes().blackWhiteColor),
        ),
        RatingBar.builder(
          initialRating: (widget.hotelStay.stars ?? 3).roundToDouble(),
          minRating: 1,
          itemSize: 20,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ignoreGestures: true,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            if (kDebugMode) {
              print(rating);
            }
          },
        ),
      ],
    );
  }

  _buildAddressMapWidget() {
    return Container(
      color: MyThemes().detailsCardColor,
      child: Row(children: [
        10.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: widget.hotelStay.name ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: MyThemes().blackWhiteColor),
              ),
              8.height,
              TextWidget(
                text: widget.hotelStay.address ??
                    'Address: Museum Park St, Doha, Qatar',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: MyThemes().blackWhiteColor),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(isDarkMode
                ? 'assets/images/map_dark.png'
                : 'assets/images/map_light.png'),
            GenericSvgWidget(
              path: 'assets/svgs/map_pin_icon.svg',
              color: isDarkMode ? Colors.white : null,
            )
          ],
        )
      ]),
    ).onTap(() async {
      final availableMaps = await MapLauncher.installedMaps;
      if (kDebugMode) {
        print(availableMaps);
      } // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

      await availableMaps.first.showMarker(
          coords: Coords(
              widget.hotelStay.lat.toDouble(), widget.hotelStay.lng.toDouble()),
          title: widget.hotelStay.name ?? '');
    });
  }

  _buildListOfImagesWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
              widget.hotelStay.stayImages.length,
              (index) => Row(
                    children: [
                      10.width,
                      Image.network(
                        widget.hotelStay.stayImages[index],
                        height: 400,
                      ),
                    ],
                  ))
        ],
      ),
    );
  }
}
