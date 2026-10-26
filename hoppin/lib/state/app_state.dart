import 'package:flutter/material.dart';
import '../models/vendor.dart';
import '../models/booking.dart';
import '../data/mock_data.dart';

enum SortOption { rating, distance, price }
enum PriceBand { any, under300, mid, over600 }

class AppState extends ChangeNotifier {
  final UserProfile userProfile = UserProfile();

  Vendor? currentVendor;
  Booking? currentBooking;
  final List<Booking> bookingHistory = [];

  String? filterCategoryId;
  String? searchQuery;
  SortOption sort = SortOption.rating;
  bool verifiedOnly = false;
  bool availableNowOnly = false;
  PriceBand priceBand = PriceBand.any;
  Gender? genderPref;

  void selectVendor(Vendor v) { currentVendor = v; notifyListeners(); }

  void setFilter({String? categoryId, String? query}) {
    filterCategoryId = categoryId;
    searchQuery = query;
    notifyListeners();
  }

  void setSort(SortOption s) { sort = s; notifyListeners(); }
  void toggleVerifiedOnly() { verifiedOnly = !verifiedOnly; notifyListeners(); }
  void toggleAvailableNow() { availableNowOnly = !availableNowOnly; notifyListeners(); }
  void setPriceBand(PriceBand b) { priceBand = (priceBand == b) ? PriceBand.any : b; notifyListeners(); }
  void setGenderPref(Gender? g) { genderPref = g; notifyListeners(); }

  List<Vendor> get filteredVendors {
    var list = vendors.where((v) {
      if (filterCategoryId != null && v.categoryId != filterCategoryId) return false;
      if (searchQuery != null && searchQuery!.isNotEmpty) {
        final q = searchQuery!.toLowerCase();
        final matches = v.name.toLowerCase().contains(q) || v.categoryId.contains(q) || v.tagline.toLowerCase().contains(q);
        if (!matches) return false;
      }
      if (verifiedOnly && !v.verified) return false;
      if (availableNowOnly && !v.isAvailableNow) return false;
      if (genderPref != null && v.gender != genderPref) return false;
      final price = v.displayBasePrice;
      switch (priceBand) {
        case PriceBand.under300: if (price >= 300) return false; break;
        case PriceBand.mid: if (price < 300 || price > 600) return false; break;
        case PriceBand.over600: if (price <= 600) return false; break;
        case PriceBand.any: break;
      }
      return true;
    }).toList();

    switch (sort) {
      case SortOption.rating: list.sort((a, b) => b.rating.compareTo(a.rating)); break;
      case SortOption.distance: list.sort((a, b) => a.distanceKm.compareTo(b.distanceKm)); break;
      case SortOption.price: list.sort((a, b) => a.displayBasePrice.compareTo(b.displayBasePrice)); break;
    }
    return list;
  }

  void startBooking(Vendor vendor) {
    currentVendor = vendor;
    currentBooking = Booking(vendor: vendor, status: BookingStatus.requested);
    notifyListeners();
  }

  void vendorAccepts({QuoteBreakdown? quote}) {
    if (currentBooking == null) return;
    currentBooking!.status = BookingStatus.accepted;
    currentBooking!.quote = quote;
    notifyListeners();
  }

  void beginTracking() {
    if (currentBooking == null) return;
    currentBooking!.status = BookingStatus.onTheWay;
    notifyListeners();
  }

  void completePayment(String method, double amount) {
    if (currentBooking == null) return;
    currentBooking!.paymentMethod = method;
    currentBooking!.finalAmount = amount;
    currentBooking!.status = BookingStatus.completed;
    bookingHistory.insert(0, currentBooking!);
    notifyListeners();
  }
}
