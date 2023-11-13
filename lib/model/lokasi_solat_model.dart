class LocationResponse {
  final String id;
  final String lokasi;

  LocationResponse({required this.id, required this.lokasi});

  factory LocationResponse.fromJson(Map<String, dynamic> json) {
    return LocationResponse(
      id: json['id'] as String,
      lokasi: json['lokasi'] as String,
    );
  }
}
