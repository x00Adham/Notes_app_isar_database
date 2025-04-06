import 'package:flutter/material.dart';
import 'package:notice_app_isar/widgets/note_settings.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    super.key,
    required this.text,
    this.onEditPressed,
    this.onDeletePressed,
  });
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(text),
        trailing: Builder(
          builder:
              (context) => IconButton(
                //! didnt work
                onPressed:
                    () => showPopover(
                      height: 100,
                      width: 100,
                      context: context,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      bodyBuilder:
                          (context) => NoteSettings(
                            onEditTap: onEditPressed,
                            ondeleteTap: onDeletePressed,
                          ),
                    ),
                icon: const Icon(Icons.more_vert),
              ),
        ),
      ),
    );
  }
}
