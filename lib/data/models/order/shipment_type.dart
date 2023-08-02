import 'package:freezed_annotation/freezed_annotation.dart';
part 'shipment_type.freezed.dart';

@freezed
abstract class ServiceType with _$ServiceType {
  const factory ServiceType.shopping() = ServiceTypeShopping;
  const factory ServiceType.ticketing() = ServiceTypeTicketing;
  const factory ServiceType.service() = ServiceTypeService;
  const factory ServiceType.carrying() = ServiceTypeCarrying;
  const factory ServiceType.display() = ServiceTypeDisplay;
  const factory ServiceType.client_base() = ServiceTypeClientBase;

  static ServiceType formString(String str) {
    switch (str) {
      case 'shopping':
        return const ServiceType.shopping();
      case 'ticketing':
        return const ServiceType.ticketing();
      case 'service':
        return const ServiceType.service();
      case 'carrying':
        return const ServiceType.carrying();
      case 'displaying':
        return const ServiceType.display();
      case 'client_base':
        return const ServiceType.client_base();
      default:
        return const ServiceType.shopping();
    }
  }
}
// flutter pub run build_runner watch --delete-conflicting-outputs