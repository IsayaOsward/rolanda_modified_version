class BookingResponse {
  final String bookingId;
  final String successId;
  final double total;

  BookingResponse({
    required this.bookingId,
    required this.successId,
    required this.total,
  });

  // Factory method to create an instance from a JSON map
  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      bookingId: json['booking_id'] as String? ?? 'Unknown',
      successId: json['success_id'] as String? ?? 'Unknown',
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
    );
  }

  // Method to create a default instance
  factory BookingResponse.defaultResponse() {
    return BookingResponse(
      bookingId: 'Unknown',
      successId: 'Unknown',
      total: 0.0,
    );
  }

  // Method to convert the instance back to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'success_id': successId,
      'total': total,
    };
  }
}
