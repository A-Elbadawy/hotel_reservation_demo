import 'package:reservation_demo/models/api_response.dart';
import 'package:reservation_demo/services/network_utils.dart';

class HotelReservationService {

  ///
  Future<APIResponse> getHotelReservations() async {
    return await getRequest('/mobile-guests/user-events', headers: authHeader());
  }
}