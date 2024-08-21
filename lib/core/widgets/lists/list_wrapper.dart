import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListWrapper<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final bool isLoading;

  const ListWrapper({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Skeletonizer(
        child: _buildList(),
      );
    }
    return _buildList();
  }

  Widget _buildList() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: items.length,
      itemBuilder: (context, index) => itemBuilder(items[index]),
    );
  }
}
