import 'package:flutter/material.dart';
import 'package:find_location/presentation/shared/style/app_colors.dart';
import 'package:find_location/presentation/shared/style/app_edge_insets.dart';
import 'package:find_location/presentation/shared/style/app_text_styles.dart';

class FormDropdown extends StatelessWidget {
  final String? selectedValue;
  final List<DropdownMenuItem<String>> items;
  final String hint;
  final void Function(String?) onChanged;

  const FormDropdown({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey[500]!,
        ),
      ),
      padding: AppEdgeInsets.cardSymetric,
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedValue,
        hint: Padding(
          padding: AppEdgeInsets.vsd,
          child: Text(
            hint,
            style: AppTextStyles.title.copyWith(fontSize: 14),
          ),
        ),
        style: AppTextStyles.title.copyWith(fontSize: 14),
        underline: const SizedBox(),
        icon: const Icon(
          Icons.expand_more_rounded,
          color: AppColors.primaryColor,
        ),
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
