class Reservation {
  final int id;  // New field for ID
  final String paymentStatus; // Updated to match the JSON structure
  final String fullName; // Full name of the guest
  final String email; // Guest's email
  final String phone; // Guest's phone number
  final String beforeDiscount; // Price before discount
  final String total; // Total price
  final String saved; // Amount saved
  final String checkInDate; // Check-in date
  final String checkOutDate; // Check-out date
  final int totalDays; // Total days of stay
  final int numAdults; // Number of adults
  final int numChildren; // Number of children
  final bool checkedIn; // Check-in status
  final bool checkedOut; // Check-out status
  final bool isActive; // Reservation active status
  final bool checkedInTracker; // Check-in tracker status
  final bool checkedOutTracker; // Check-out tracker status
  final String date; // Date of reservation
  final String bookingId; // Unique booking ID
  final int user; // User ID
  final int hotel; // Hotel ID
  final int roomType; // Room type ID
  final List<int> room; // List of room IDs
  final List<String> coupons; // List of coupons

  Reservation({
    required this.id,
    required this.paymentStatus,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.beforeDiscount,
    required this.total,
    required this.saved,
    required this.checkInDate,
    required this.checkOutDate,
    required this.totalDays,
    required this.numAdults,
    required this.numChildren,
    required this.checkedIn,
    required this.checkedOut,
    required this.isActive,
    required this.checkedInTracker,
    required this.checkedOutTracker,
    required this.date,
    required this.bookingId,
    required this.user,
    required this.hotel,
    required this.roomType,
    required this.room,
    required this.coupons,
  });

  // Factory constructor to create a Reservation from JSON
  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] ?? 0, // Provide default value if null
      paymentStatus: json['payment_status'] ?? 'unknown', // Default if null
      fullName: json['full_name'] ?? 'Unknown', // Default if null
      email: json['email'] ?? 'No email', // Default if null
      phone: json['phone'] ?? 'No phone', // Default if null
      beforeDiscount: json['before_discount']?.toString() ?? '0.00', // Safely convert to string
      total: json['total']?.toString() ?? '0.00', // Safely convert to string
      saved: json['saved']?.toString() ?? '0.00', // Safely convert to string
      checkInDate: json['check_in_date'] ?? 'Unknown Date', // Default if null
      checkOutDate: json['check_out_date'] ?? 'Unknown Date', // Default if null
      totalDays: json['total_days'] ?? 0, // Default if null
      numAdults: json['num_adults'] ?? 0, // Default if null
      numChildren: json['num_children'] ?? 0, // Default if null
      checkedIn: json['checked_in'] ?? false, // Default if null
      checkedOut: json['checked_out'] ?? false, // Default if null
      isActive: json['is_active'] ?? false, // Default if null
      checkedInTracker: json['checked_in_tracker'] ?? false, // Default if null
      checkedOutTracker: json['checked_out_tracker'] ?? false, // Default if null
      date: json['date'] ?? 'Unknown Date', // Default if null
      bookingId: json['booking_id'] ?? 'Unknown', // Default if null
      user: json['user'] ?? 0, // Default if null
      hotel: json['hotel'] ?? 0, // Default if null
      roomType: json['room_type'] ?? 0, // Default if null
      room: List<int>.from(json['room']?.map((x) => x as int) ?? []), // Handle room list
      coupons: List<String>.from(json['coupons']?.map((x) => x as String) ?? []), // Handle coupons list
    );
  }
}
