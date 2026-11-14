import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination;

  late int _starCount;
  bool _isStarred = false;
  DateTime _selectedDate = DateTime(2026, 11, 15);
  late String _selectedPackage;
  bool _isDarkMode = false;

  CruiseBookingViewModel({CruiseDestination? destination})
      : destination = destination ?? CruiseDestination.rajangCruise {
    _starCount = this.destination.initialRating;
    _selectedPackage = this.destination.packages.first;
  }

  int get starCount => _starCount;
  bool get isStarred => _isStarred;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;

  String get formattedDate {
    final day = _selectedDate.day.toString().padLeft(2, '0');
    final month = _selectedDate.month.toString().padLeft(2, '0');
    final year = _selectedDate.year.toString();
    return '$day/$month/$year';
  }

  void toggleStar() {
    if (_isStarred) {
      _starCount--;
      _isStarred = false;
    } else {
      _starCount++;
      _isStarred = true;
    }
    notifyListeners();
  }

  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  void updatePackage(String? newPackage) {
    if (newPackage != null && newPackage != _selectedPackage) {
      _selectedPackage = newPackage;
      notifyListeners();
    }
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}