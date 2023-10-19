class HotelReservations {
  HotelReservations({
    required this.reservations,
  });

  final List<Reservation> reservations;

  factory HotelReservations.fromJson(Map<String, dynamic> json) {
    return HotelReservations(
      reservations: json["reservations"] == null
          ? []
          : List<Reservation>.from(
              json["reservations"]!.map((x) => Reservation.fromJson(x))),
    );
  }
}

class Reservation {
  Reservation({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.stays,
    required this.userTickets,
  });

  final int? id;
  final String? startDate;
  final String? endDate;
  final List<Stay> stays;
  final List<UserTicket> userTickets;

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json["id"],
      startDate: json["start_date"],
      endDate: json["end_date"],
      stays: json["stays"] == null
          ? []
          : List<Stay>.from(json["stays"]!.map((x) => Stay.fromJson(x))),
      userTickets: json["user_tickets"] == null
          ? []
          : List<UserTicket>.from(
              json["user_tickets"]!.map((x) => UserTicket.fromJson(x))),
    );
  }
}

class Stay {
  Stay({
    required this.name,
    required this.description,
    required this.lat,
    required this.lng,
    required this.address,
    required this.checkIn,
    required this.checkOut,
    required this.stars,
    required this.stayImages,
    required this.amenities,
    required this.rooms,
  });

  final String? name;
  final String? description;
  final String? lat;
  final String? lng;
  final String? address;
  final String? checkIn;
  final String? checkOut;
  final int? stars;
  final List<String> stayImages;
  final String? amenities;
  final List<Room> rooms;

  factory Stay.fromJson(Map<String, dynamic> json) {
    return Stay(
      name: json["name"],
      description: json["description"],
      lat: json["lat"],
      lng: json["lng"],
      address: json["address"],
      checkIn: json["check_in"],
      checkOut: json["check_out"],
      stars: json["stars"],
      stayImages: json["stay_images"] == null
          ? []
          : List<String>.from(json["stay_images"]!.map((x) => x)),
      amenities: json["amenities"],
      rooms: json["rooms"] == null
          ? []
          : List<Room>.from(json["rooms"]!.map((x) => Room.fromJson(x))),
    );
  }
}

class Room {
  Room({
    required this.roomNumber,
    required this.roomCapacity,
    required this.roomTypeName,
    required this.stayName,
    required this.guests,
  });

  final String? roomNumber;
  final int? roomCapacity;
  final String? roomTypeName;
  final String? stayName;
  final List<TicketUserData> guests;

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomNumber: json["room_number"],
      roomCapacity: json["room_capacity"],
      roomTypeName: json["room_type_name"],
      stayName: json["stay_name"],
      guests: json["guests"] == null
          ? []
          : List<TicketUserData>.from(
              json["guests"]!.map((x) => TicketUserData.fromJson(x))),
    );
  }
}

class TicketUserData {
  TicketUserData({
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.isUser,
  });

  final String? firstName;
  final String? lastName;
  final String? avatar;
  final bool? isUser;

  factory TicketUserData.fromJson(Map<String, dynamic> json) {
    return TicketUserData(
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"],
      isUser: json["is_user"],
    );
  }
}

class UserTicket {
  UserTicket({
    required this.ticketId,
    required this.seat,
    required this.ticketSystemId,
    required this.ticketTypeName,
    required this.ticketUserData,
    required this.gate,
  });

  final int? ticketId;
  final String? seat;
  final String? ticketSystemId;
  final String? ticketTypeName;
  final TicketUserData? ticketUserData;
  final String? gate;

  factory UserTicket.fromJson(Map<String, dynamic> json) {
    return UserTicket(
      ticketId: json["ticket_id"],
      seat: json["seat"],
      ticketSystemId: json["ticket_system_id"],
      ticketTypeName: json["ticket_type_name"],
      ticketUserData: json["ticket_user_data"] == null
          ? null
          : TicketUserData.fromJson(json["ticket_user_data"]),
      gate: json["gate"],
    );
  }
}
