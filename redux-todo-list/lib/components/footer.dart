import 'package:flutter/material.dart';
import 'package:todo/containers/filter_link.dart'; 
import 'package:todo/models.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
        children: <Widget>[
          FilterLink(
            text: 'All',
            filter: VisibilityFilter.showAll,
          ),
          FilterLink(
            text: 'Active',
            filter: VisibilityFilter.showActive,
          ),
          FilterLink(
            text: 'Completed',
            filter: VisibilityFilter.showCompleted,
          ),
        ],
      );
  }
}
