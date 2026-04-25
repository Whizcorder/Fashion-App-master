class DialogRequest {
  final String title;
  final String description;
  final String primaryButtonText;
  final String primaryButtonRoute;
  final String? secondaryButtonText;
  final String? secondaryButtonRoute;

  DialogRequest({
    required this.title,
    required this.description,
    required this.primaryButtonText,
    required this.primaryButtonRoute,
    this.secondaryButtonText,
    this.secondaryButtonRoute,
  });
}

class DialogResponse {
  final String? fieldOne;
  final String? fieldTwo;
  final bool? confirmed;

  DialogResponse({
    this.fieldOne,
    this.fieldTwo,
    this.confirmed,
  });
}