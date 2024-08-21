import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:moon_design/moon_design.dart';

class ListTileBoxWrapper extends StatelessWidget {
  final String? image;
  final String title, subtitle;
  final VoidCallback? onTap;
  final bool isFavorite, showChevron;

  const ListTileBoxWrapper({
    super.key,
    this.image,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.isFavorite = false,
    this.showChevron = false,
  });

  @override
  Widget build(BuildContext context) {
    return BoxWrapper(
      padding: EdgeInsets.all(4.w),
      margin: EdgeInsets.symmetric(vertical: 4.h),
      color: context.moonColors?.frieza.withOpacity(0.05),
      child: ListTile(
        leading: image != null
            ? CachedNetworkImage(
                imageUrl: image!,
                width: 36.h,
                height: 36.h,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundImage: imageProvider,
                ),
              )
            : null,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isFavorite) ...[
              const MoonButton.icon(
                icon: Icon(Icons.favorite, color: Colors.red),
              ),
            ]
          ],
        ),
        subtitle: Text(subtitle),
        trailing: showChevron
            ? const MoonButton.icon(
                icon: Icon(MoonIcons.controls_chevron_right_24_light),
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
