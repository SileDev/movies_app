import 'package:flutter/material.dart';

class ProductionDataLine extends StatelessWidget {
  final String label, content;
  final bool? contain;
  const ProductionDataLine({
    super.key,
    required this.label,
    required this.content,
    this.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Label
        SizedBox(
          width: 56,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        //Contenido
        Expanded(
          child: Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: contain != null && contain! ? 1 : null,
            overflow:
                contain != null && contain! ? TextOverflow.ellipsis : null,
          ),
        ),
      ],
    );
  }
}
