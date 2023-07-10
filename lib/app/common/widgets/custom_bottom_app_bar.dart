import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({
    Key? key,
    required this.children,
    this.selectedItemColor,
  })  : assert(children.length == 5, 'children.length must be 5'),
        super(key: key);

  final List<CustomBottomAppBarItem> children;
  final Color? selectedItemColor;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map(
          (item) {
            final currentItem =
                widget.children.indexOf(item) == _selectedItemIndex;
            return Expanded(
              child: InkWell(
                onTap: item.onPressed,
                onTapUp: (_) => setState(() => _selectedItemIndex = widget.children.indexOf(item)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Icon(
                    currentItem ? item.primaryIcon : item.secondaryIcon,
                    color: currentItem
                        ? widget.selectedItemColor
                        : AppColors.lightGrey,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class CustomBottomAppBarItem {
  CustomBottomAppBarItem({
    this.label,
    this.primaryIcon,
    this.secondaryIcon,
    this.onPressed,
  });

  CustomBottomAppBarItem.empty({
    this.label,
    this.secondaryIcon,
    this.primaryIcon,
    this.onPressed,
  });

  final String? label;
  final VoidCallback? onPressed;
  final IconData? primaryIcon;
  final IconData? secondaryIcon;
}
