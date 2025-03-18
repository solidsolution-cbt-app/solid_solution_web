import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';

class MoreActionButton extends StatelessWidget {
  const MoreActionButton({
    required this.actions,
    required this.onSelectAction,
    super.key,
  });
  final List<MoreActionItem> actions;
  final Function(dynamic val) onSelectAction;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        elevation: 10,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        padding: EdgeInsets.zero,
        position: PopupMenuPosition.under,
        onSelected: (value) {
          onSelectAction(value);
        },
        itemBuilder: (context) => actions
            .map(
              (item) => PopupMenuItem(
                value: item.value,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    item.icon,
                    const SizedBox(
                      width: 10,
                    ),
                    CustomTextBody1(
                      text: item.label,
                      fontSize: item.fontSize,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Icon(Icons.more_vert),
        ));
  }
}

class MoreActionItem {
  final Widget icon;
  final dynamic value;
  final String label;
  final double? fontSize;

  MoreActionItem({
    required this.icon,
    required this.label,
    this.value,
    this.fontSize,
  });
}
