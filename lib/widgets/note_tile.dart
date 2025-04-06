import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key, required this.text});
  final String text;

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
        trailing: IconButton(
          //! didnt work
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
