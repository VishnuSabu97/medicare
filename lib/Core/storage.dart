import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();
  factory LocalStorage() => _instance;
  LocalStorage._internal();

  final storage = const FlutterSecureStorage();

  Future<String?> getDoctorName() async {
    return await storage.read(key: 'doctorName');
  }

  Future<void> setDoctorName(String doctorName) async {
    return await storage.write(key: 'doctorName', value: doctorName);
  }

  Future<String?> getDate() async {
    return await storage.read(key: 'date');
  }

  Future<void> setDate(String date) async {
    return await storage.write(key: 'date', value: date);
  }

  Future<String?> getName() async {
    return await storage.read(key: 'name');
  }

  Future<void> setName(String name) async {
    return await storage.write(key: 'name', value: name);
  }

  Future<String?> getEmail() async {
    return await storage.read(key: 'email');
  }

  Future<void> setEmail(String email) async {
    return await storage.write(key: 'email', value: email);
  }

  Future<String?> getAddress() async {
    return await storage.read(key: 'address');
  }

  Future<void> setAddress(String address) async {
    return await storage.write(key: 'address', value: address);
  }

  Future<String?> getPhone() async {
    return await storage.read(key: 'phone');
  }

  Future<void> setPhone(String phone) async {
    return await storage.write(key: 'phone', value: phone);
  }

  Future<String?> getDetails() async {
    return await storage.read(key: 'details');
  }

  Future<void> setDetails(String details) async {
    return await storage.write(key: 'details', value: details);
  }

}
