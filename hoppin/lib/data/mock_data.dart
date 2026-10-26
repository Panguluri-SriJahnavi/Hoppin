import 'package:flutter/material.dart';
import '../models/vendor.dart';
import '../theme/app_theme.dart';

final List<ServiceCategory> categories = [
  ServiceCategory(id: 'electrical', label: 'Electrical', icon: Icons.bolt, gradient: [AppColors.primary, AppColors.primaryDark]),
  ServiceCategory(id: 'plumbing', label: 'Plumbing', icon: Icons.water_drop, gradient: const [Color(0xFF1E6E8C), Color(0xFF123B4B)]),
  ServiceCategory(id: 'cleaning', label: 'Cleaning', icon: Icons.cleaning_services, gradient: const [Color(0xFF6B4226), Color(0xFF42280F)]),
  ServiceCategory(id: 'cooking', label: 'Cooking', icon: Icons.restaurant, gradient: const [Color(0xFFB5581F), Color(0xFF7A3B12)]),
  ServiceCategory(id: 'tutoring', label: 'Tutoring', icon: Icons.menu_book, gradient: const [Color(0xFF7A5A0B), Color(0xFF4A3705)]),
  ServiceCategory(id: 'beauty', label: 'Beauty', icon: Icons.content_cut, gradient: const [Color(0xFF9C4A6B), Color(0xFF5E2A40)]),
  ServiceCategory(id: 'moving', label: 'Moving', icon: Icons.local_shipping, gradient: const [Color(0xFF4A5568), Color(0xFF2D3340)]),
  ServiceCategory(id: 'appliance', label: 'AC & Appliance', icon: Icons.ac_unit, gradient: const [Color(0xFF2B6CB0), Color(0xFF1A365D)]),
  ServiceCategory(id: 'painting', label: 'Painting', icon: Icons.format_paint, gradient: const [Color(0xFFC0392B), Color(0xFF7B241C)]),
  ServiceCategory(id: 'carpentry', label: 'Carpentry', icon: Icons.carpenter, gradient: const [Color(0xFF8B5E34), Color(0xFF54371D)]),
  ServiceCategory(id: 'petcare', label: 'Pet Care', icon: Icons.pets, gradient: const [Color(0xFF38856A), Color(0xFF204A3B)]),
];

ServiceCategory categoryById(String id) => categories.firstWhere((c) => c.id == id);

final List<Vendor> vendors = [
  Vendor(id: 1, name: 'Ravi Kumar', categoryId: 'electrical', icon: Icons.bolt, distanceKm: 1.2, rating: 4.9, reviews: 212, pricing: PricingType.quote, priceFrom: 199, unit: 'visit', availability: 'Available now', tagline: '6 yrs experience', experience: '6 yrs', arrival: '12 min', verified: true, gender: Gender.male),
  Vendor(id: 2, name: 'Suresh Naidu', categoryId: 'electrical', icon: Icons.bolt, distanceKm: 2.6, rating: 4.6, reviews: 87, pricing: PricingType.quote, priceFrom: 179, unit: 'visit', availability: 'Available in 20 min', tagline: '4 yrs experience', experience: '4 yrs', arrival: '20 min', verified: true, gender: Gender.male),
  Vendor(id: 11, name: 'Divya Rao', categoryId: 'electrical', icon: Icons.bolt, distanceKm: 3.1, rating: 4.8, reviews: 64, pricing: PricingType.quote, priceFrom: 219, unit: 'visit', availability: 'Available tomorrow', tagline: 'Residential & commercial wiring', experience: '5 yrs', arrival: '—', verified: false, gender: Gender.female),
  Vendor(id: 3, name: 'Anil Varma', categoryId: 'plumbing', icon: Icons.water_drop, distanceKm: 1.8, rating: 4.7, reviews: 150, pricing: PricingType.quote, priceFrom: 249, unit: 'visit', availability: 'Available now', tagline: '8 yrs experience', experience: '8 yrs', arrival: '15 min', verified: true, gender: Gender.male),
  Vendor(id: 12, name: 'Mahesh Babu R.', categoryId: 'plumbing', icon: Icons.water_drop, distanceKm: 2.2, rating: 4.5, reviews: 58, pricing: PricingType.quote, priceFrom: 229, unit: 'visit', availability: 'Available now', tagline: 'Leak repair specialist', experience: '6 yrs', arrival: '18 min', verified: true, gender: Gender.male),
  Vendor(id: 4, name: 'Sunita Devi', categoryId: 'cleaning', icon: Icons.cleaning_services, distanceKm: 2.4, rating: 4.8, reviews: 98, pricing: PricingType.fixed, price: 499, unit: 'visit', availability: 'Free 6:00 PM', tagline: 'Deep cleaning specialist', experience: '5 yrs', arrival: '25 min', verified: true, gender: Gender.female),
  Vendor(id: 5, name: 'Lakshmi Priya', categoryId: 'cleaning', icon: Icons.cleaning_services, distanceKm: 0.9, rating: 4.9, reviews: 176, pricing: PricingType.fixed, price: 449, unit: 'visit', availability: 'Available now', tagline: 'Eco-friendly products', experience: '3 yrs', arrival: '10 min', verified: true, gender: Gender.female),
  Vendor(id: 13, name: 'Ganesh Patel', categoryId: 'cleaning', icon: Icons.cleaning_services, distanceKm: 1.7, rating: 4.4, reviews: 39, pricing: PricingType.fixed, price: 399, unit: 'visit', availability: 'Available now', tagline: 'Bachelor pad & office cleaning', experience: '2 yrs', arrival: '16 min', verified: false, gender: Gender.male),
  Vendor(id: 6, name: 'Kiran Reddy', categoryId: 'tutoring', icon: Icons.menu_book, distanceKm: 0.8, rating: 5.0, reviews: 41, pricing: PricingType.fixed, price: 350, unit: 'hr', availability: 'Available today', tagline: 'Maths & Physics, Class 8-12', experience: '3 yrs', arrival: '—', verified: true, gender: Gender.male),
  Vendor(id: 7, name: 'Priya Sharma', categoryId: 'tutoring', icon: Icons.menu_book, distanceKm: 1.5, rating: 4.7, reviews: 63, pricing: PricingType.fixed, price: 300, unit: 'hr', availability: 'Available tomorrow', tagline: 'Spoken English & Coding basics', experience: '2 yrs', arrival: '—', verified: true, gender: Gender.female),
  Vendor(id: 14, name: 'Naveen Kumar', categoryId: 'tutoring', icon: Icons.menu_book, distanceKm: 2.0, rating: 4.6, reviews: 28, pricing: PricingType.fixed, price: 280, unit: 'hr', availability: 'Available today', tagline: 'Chemistry & Biology, Class 9-12', experience: '4 yrs', arrival: '—', verified: false, gender: Gender.male),
  Vendor(id: 8, name: 'Ramesh Achari', categoryId: 'cooking', icon: Icons.restaurant, distanceKm: 1.1, rating: 4.8, reviews: 54, pricing: PricingType.fixed, price: 600, unit: 'day', availability: 'Available now', tagline: 'South Indian & North Indian cuisine', experience: '10 yrs', arrival: '18 min', verified: true, gender: Gender.male),
  Vendor(id: 15, name: 'Padma Latha', categoryId: 'cooking', icon: Icons.restaurant, distanceKm: 1.9, rating: 4.9, reviews: 81, pricing: PricingType.fixed, price: 650, unit: 'day', availability: 'Available now', tagline: 'Home-style Andhra cuisine', experience: '12 yrs', arrival: '20 min', verified: true, gender: Gender.female),
  Vendor(id: 9, name: 'Meena Kumari', categoryId: 'beauty', icon: Icons.content_cut, distanceKm: 1.6, rating: 4.6, reviews: 73, pricing: PricingType.fixed, price: 399, unit: 'visit', availability: 'Available now', tagline: 'Haircut, styling & makeup', experience: '5 yrs', arrival: '14 min', verified: true, gender: Gender.female),
  Vendor(id: 16, name: 'Ajay Salon Studio', categoryId: 'beauty', icon: Icons.content_cut, distanceKm: 2.3, rating: 4.4, reviews: 47, pricing: PricingType.fixed, price: 349, unit: 'visit', availability: 'Available now', tagline: "Men's grooming & haircuts", experience: '4 yrs', arrival: '19 min', verified: false, gender: Gender.male),
  Vendor(id: 10, name: 'Suresh Movers Co.', categoryId: 'moving', icon: Icons.local_shipping, distanceKm: 3.2, rating: 4.5, reviews: 112, pricing: PricingType.quote, priceFrom: 999, unit: 'job', availability: 'Book 1 day ahead', tagline: '2-truck team available', experience: '7 yrs', arrival: '—', verified: true, gender: Gender.male),
  Vendor(id: 17, name: 'Andhra Packers', categoryId: 'moving', icon: Icons.local_shipping, distanceKm: 4.0, rating: 4.3, reviews: 66, pricing: PricingType.quote, priceFrom: 1199, unit: 'job', availability: 'Book 1 day ahead', tagline: 'Packing + moving, insured', experience: '9 yrs', arrival: '—', verified: true, gender: Gender.male),
  Vendor(id: 18, name: 'Kalyan Cool Care', categoryId: 'appliance', icon: Icons.ac_unit, distanceKm: 1.4, rating: 4.7, reviews: 95, pricing: PricingType.quote, priceFrom: 299, unit: 'visit', availability: 'Available now', tagline: 'AC service, fridge & washing machine repair', experience: '7 yrs', arrival: '22 min', verified: true, gender: Gender.male),
  Vendor(id: 19, name: 'Fresh Air Tech', categoryId: 'appliance', icon: Icons.ac_unit, distanceKm: 2.5, rating: 4.5, reviews: 52, pricing: PricingType.quote, priceFrom: 249, unit: 'visit', availability: 'Available in 30 min', tagline: 'AC gas refill & servicing', experience: '5 yrs', arrival: '30 min', verified: false, gender: Gender.male),
  Vendor(id: 20, name: 'Venkat Painters', categoryId: 'painting', icon: Icons.format_paint, distanceKm: 2.9, rating: 4.6, reviews: 44, pricing: PricingType.quote, priceFrom: 499, unit: 'job', availability: 'Book 1 day ahead', tagline: 'Interior & exterior painting', experience: '8 yrs', arrival: '—', verified: true, gender: Gender.male),
  Vendor(id: 21, name: 'ColorCraft Studio', categoryId: 'painting', icon: Icons.format_paint, distanceKm: 3.4, rating: 4.4, reviews: 31, pricing: PricingType.quote, priceFrom: 549, unit: 'job', availability: 'Book 1 day ahead', tagline: 'Texture & waterproof painting', experience: '6 yrs', arrival: '—', verified: false, gender: Gender.male),
  Vendor(id: 22, name: 'Ramu Woodworks', categoryId: 'carpentry', icon: Icons.carpenter, distanceKm: 1.9, rating: 4.8, reviews: 69, pricing: PricingType.quote, priceFrom: 249, unit: 'visit', availability: 'Available now', tagline: 'Furniture repair & custom carpentry', experience: '10 yrs', arrival: '25 min', verified: true, gender: Gender.male),
  Vendor(id: 23, name: 'Krishna Carpentry', categoryId: 'carpentry', icon: Icons.carpenter, distanceKm: 2.7, rating: 4.5, reviews: 38, pricing: PricingType.quote, priceFrom: 219, unit: 'visit', availability: 'Available today', tagline: 'Door, window & cabinet fixes', experience: '5 yrs', arrival: '—', verified: true, gender: Gender.male),
  Vendor(id: 24, name: 'Happy Paws Care', categoryId: 'petcare', icon: Icons.pets, distanceKm: 1.3, rating: 4.9, reviews: 57, pricing: PricingType.fixed, price: 299, unit: 'visit', availability: 'Available now', tagline: 'Dog walking & grooming', experience: '3 yrs', arrival: '11 min', verified: true, gender: Gender.female),
  Vendor(id: 25, name: 'Pet Buddy Services', categoryId: 'petcare', icon: Icons.pets, distanceKm: 2.1, rating: 4.6, reviews: 33, pricing: PricingType.fixed, price: 349, unit: 'visit', availability: 'Available today', tagline: 'Pet sitting & vet visits', experience: '2 yrs', arrival: '17 min', verified: false, gender: Gender.male),
];

class PaymentMethod {
  final IconData icon;
  final String name;
  final String subtitle;
  const PaymentMethod({required this.icon, required this.name, required this.subtitle});
}

final List<PaymentMethod> paymentMethods = [
  const PaymentMethod(icon: Icons.credit_card, name: 'Credit / Debit Card', subtitle: 'Visa •••• 4242'),
  const PaymentMethod(icon: Icons.smartphone, name: 'UPI', subtitle: 'GPay, PhonePe, Paytm, BHIM'),
  const PaymentMethod(icon: Icons.account_balance, name: 'Net Banking', subtitle: 'All major Indian banks'),
  const PaymentMethod(icon: Icons.account_balance_wallet, name: 'Wallets', subtitle: 'Paytm Wallet, Amazon Pay'),
  const PaymentMethod(icon: Icons.payments, name: 'Cash on Service', subtitle: 'Pay the vendor directly'),
  const PaymentMethod(icon: Icons.replay_circle_filled, name: 'Pay Later / EMI', subtitle: 'For bookings above ₹999'),
];
