import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moon_design/moon_design.dart';
import 'package:rick_morty/utils/utils.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? hintText;
  final void Function(String value)? onSearch;

  const SearchAppBar({
    super.key,
    this.hintText,
    this.onSearch,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(48.h);
}

class _SearchAppBarState extends State<SearchAppBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: MoonTextInput(
        controller: _controller,
        hintText: context.str?.search,
        backgroundColor: Colors.transparent,
        trailing: IconButton(
          icon: Icon(
            MoonIcons.generic_search_24_light,
            size: 20.h,
          ),
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            FocusScope.of(context).unfocus();
            if (widget.onSearch != null) {
              widget.onSearch!(_controller.text);
            }
          },
        ),
        onSubmitted: (value) {
          FocusManager.instance.primaryFocus?.unfocus();
          FocusScope.of(context).unfocus();
          if (widget.onSearch != null) {
            widget.onSearch!(value);
          }
        },
      ),
    );
  }
}
