import 'package:flutter/material.dart';

linhaTabela(List<Text> labels) {
  return TableRow(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    children: labels
        .map(
          (label) => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: label,
            ),
          ),
        )
        .toList(),
  );
}
