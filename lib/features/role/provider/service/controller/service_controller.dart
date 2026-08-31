import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/features/role/provider/service/model/service_model.dart';

class ServiceController extends GetxController {
  final searchController = TextEditingController();
  final rxSearchQuery = ''.obs;

  final services = <ServiceModel>[
    ServiceModel(
      id: '1',
      title: 'General Consultation',
      price: 48.0,
      duration: '1 hour',
    ),
    ServiceModel(
      id: '2',
      title: 'General Consultation2',
      price: 48.0,
      duration: '1 hour',
    ),
    ServiceModel(
      id: '3',
      title: 'General Consultation3',
      price: 48.0,
      duration: '1 hour',
    ),
        ServiceModel(
      id: '4',
      title: 'General Consultation4',
      price: 48.0,
      duration: '1 hour',
    ),
  ].obs;

  // Form controllers
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      rxSearchQuery.value = searchController.text;
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    nameController.dispose();
    priceController.dispose();
    timeController.dispose();
    super.onClose();
  }

  void prepareForAdd() {
    nameController.clear();
    priceController.clear();
    timeController.clear();
  }

  void prepareForEdit(ServiceModel service) {
    nameController.text = service.title;
    priceController.text = service.price.toStringAsFixed(0);
    timeController.text = service.duration;
  }

  void saveService(String? serviceId) {
    final name = nameController.text.trim();
    final price = double.tryParse(priceController.text.trim()) ?? 0.0;
    final time = timeController.text.trim();

    if (serviceId != null) {
      editService(serviceId, name, price, time);
    } else {
      addService(name, price, time);
    }
  }

  List<ServiceModel> get filteredServices {
    if (rxSearchQuery.value.isEmpty) {
      return services;
    }
    final query = rxSearchQuery.value.toLowerCase();
    return services.where((service) {
      return service.title.toLowerCase().contains(query);
    }).toList();
  }

  void addService(String title, double price, String duration) {
    final newService = ServiceModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      price: price,
      duration: duration,
    );
    services.add(newService);
  }

  void editService(String id, String title, double price, String duration) {
    final index = services.indexWhere((s) => s.id == id);
    if (index != -1) {
      services[index] = ServiceModel(
        id: id,
        title: title,
        price: price,
        duration: duration,
      );
    }
  }

  void removeService(String id) {
    services.removeWhere((s) => s.id == id);
  }
}
