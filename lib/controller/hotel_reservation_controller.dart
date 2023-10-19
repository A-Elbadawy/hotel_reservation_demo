import 'package:get/get.dart';
import 'package:reservation_demo/models/reservations_model.dart';
import 'package:reservation_demo/services/hotel_reservation_service.dart';
import 'package:reservation_demo/utils/globals.dart';

class HotelReservationController extends GetxController {
  ///hotelReservations model
  HotelReservations hotelReservations = HotelReservations(reservations: []);

  ///
  Future<bool> getHotelReservations() async {
    // 1.Send To API
    loading = true;
    var res = await HotelReservationService().getHotelReservations();
    loading = false;
    // 2.Get response
    if (res.data != null) {
      // 3.change the data
      hotelReservations = HotelReservations.fromJson(res.data);
      update();
      return true;
    } else if (res.error) {
      ///
      showResponseMsgSnackBar(res);
      return false;
    }
    return false;
  }
}
