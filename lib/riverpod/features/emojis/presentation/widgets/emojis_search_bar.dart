import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/ui/ui_colors.dart';

class EmojisSearchBar extends HookConsumerWidget {
  const EmojisSearchBar({
    super.key,
    required this.onChanged,
  });

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    useListenable(focusNode);

    const initialValue = '';
    final controller = useTextEditingController(text: initialValue);

    final bool isEmpty =
        useListenableSelector(controller, () => controller.text.isEmpty);

    return Container(
      decoration: BoxDecoration(
        color: UIColors.neutral0,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 1),
            blurRadius: 3,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          hintText: 'Buscar',
          hintStyle: const TextStyle(
            color: UIColors.neutral75,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    controller.clear();
                    onChanged(initialValue);
                  },
                ),
        ),
        onTapOutside: (e) {
          focusNode.unfocus();
        },
        onEditingComplete: () {
          focusNode.unfocus();
        },
        onSubmitted: (value) {
          focusNode.unfocus();
        },
      ),
    );
  }
}
