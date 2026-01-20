import 'package:flutter/material.dart';

class ShortcutLinkFloatActionButtonAdd extends StatelessWidget {
  const ShortcutLinkFloatActionButtonAdd({
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  final void Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onPressed,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Theme.of(context).primaryColor,
        child: isLoading
            ? CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              )
            : Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 40,
              ),
      ),
    );
  }
}
