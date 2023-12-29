import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/models/item_model.dart';
import 'package:untitled2/widgets/spacer_widget.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel itemModel;
  final bool isShown;
  final VoidCallback onPressed;

  const ItemWidget(
      {Key? key,
      required this.itemModel,
      required this.onPressed,
      required this.isShown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isShown) {
      return const SizedBox();
    }
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.network(itemModel.photoUrl, width: 120, height: 120),
                  horizontalSpace(20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          itemModel.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        verticalSpace(4),
                        Text(
                          '${itemModel.price} тенге',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        verticalSpace(4),
                        Obx(
                          () =>
                              Text("В складе: ${itemModel.countLeftInStorage}"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        verticalSpace(12),
      ],
    );
  }
}
