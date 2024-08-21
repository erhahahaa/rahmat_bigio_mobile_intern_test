import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/core/core.dart';

@RoutePage()
class DetailCharacterScreen extends StatelessWidget {
  final int id;
  const DetailCharacterScreen({
    super.key,
    @pathParam required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Parent();
  }
}
