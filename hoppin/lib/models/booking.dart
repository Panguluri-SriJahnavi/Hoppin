import 'vendor.dart';

enum BookingStatus { requested, accepted, onTheWay, inProgress, completed }

class QuoteBreakdown {
  final double inspectionCharge;
  final double estimatedParts;
  double get total => inspectionCharge + estimatedParts;
  const QuoteBreakdown({required this.inspectionCharge, required this.estimatedParts});
}

class Booking {
  final Vendor vendor;
  BookingStatus status;
  QuoteBreakdown? quote;
  double? finalAmount;
  String? paymentMethod;
  final DateTime createdAt;

  Booking({required this.vendor, this.status = BookingStatus.requested, this.quote, this.finalAmount, this.paymentMethod, DateTime? createdAt})
      : createdAt = createdAt ?? DateTime.now();

  double get chargeableAmount => finalAmount ?? quote?.total ?? vendor.displayBasePrice;
}

class UserProfile {
  String name;
  String phone;
  String address;
  bool locationGranted;
  String language;
  bool largerText;

  UserProfile({this.name = '', this.phone = '', this.address = '', this.locationGranted = false, this.language = 'en', this.largerText = false});
  bool get isComplete => name.isNotEmpty && phone.isNotEmpty && address.isNotEmpty;
}
