import '../core/locator.dart';
import '../core/services/navigator_service.dart';
import 'package:provider/provider.dart';

class ProviderInjector {
  static List<Provider> providers = [
    ..._independentServices,
    ..._dependentServices,
    ..._consumableServices,
  ];

  static List<Provider> _independentServices = [
    Provider<NavigatorService>(
      create: (_) => locator<NavigatorService>(),
    ),
  ];

  static List<Provider> _dependentServices = [];

  static List<Provider> _consumableServices = [];
}