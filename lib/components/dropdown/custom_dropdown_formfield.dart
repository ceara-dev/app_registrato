import 'package:flutter/material.dart';
import '../../utils/app_theme.dart';

class CustomDropdownMenuFormField<T> extends StatefulWidget {
  final T? value;
  final List<T> items;
  final String Function(T) labelBuilder;
  final String? labelText;
  final FormFieldValidator<T> validator;
  final ValueChanged<T?> onChanged;

  const CustomDropdownMenuFormField({
    Key? key,
    this.value,
    required this.items,
    required this.labelBuilder,
    this.labelText,
    required this.validator,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropdownMenuFormField<T>> createState() =>
      _CustomDropdownMenuFormFieldState<T>();
}

class _CustomDropdownMenuFormFieldState<T>
    extends State<CustomDropdownMenuFormField<T>> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,

      child: DropdownMenu<T>(
        expandedInsets: const EdgeInsets.symmetric(vertical: 10),
        label: widget.labelText != null ? Text(widget.labelText!) : null,
        errorText: _errorText,
        dropdownMenuEntries: widget.items.map<DropdownMenuEntry<T>>((T item) {
          return DropdownMenuEntry<T>(
            value: item,
            label: widget.labelBuilder(item),
          );
        }).toList(),
        initialSelection: widget.value,
        onSelected: (T? newValue) {
          if (newValue != null) {
            setState(() {
              _errorText = null;
            });
            widget.onChanged(newValue);
          }
        },
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppTheme.textColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppTheme.textColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppTheme.primaryColor, width: 2.0),
          ),
          isDense: true,
        ),

        textStyle: const TextStyle(color: AppTheme.textColor),
      ),
    );
  }

  String? validate() {
    final error = widget.validator(widget.value);
    setState(() {
      _errorText = error;
    });
    return error;
  }

  void reset() {
    setState(() {
      _errorText = null;
    });
  }
}
