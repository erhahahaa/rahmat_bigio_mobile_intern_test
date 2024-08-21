import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LocationDetailScreen extends StatelessWidget {
  final int id;
  const LocationDetailScreen({
    super.key,
    @pathParam required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
