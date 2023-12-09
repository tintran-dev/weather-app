import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:weather_app/core/data/constant.dart';

// ignore: must_be_immutable
class AppSearchField<T> extends StatelessWidget {
  AppSearchField({
    super.key,
    required this.suggestions,
    this.onSearchTextChanged,
    this.onSuggestionTap,
    this.focusNode,
  });

  final FocusNode? focusNode;
  final List<SearchFieldListItem<T>> suggestions;
  final List<SearchFieldListItem<T>>? Function(String)? onSearchTextChanged;
  final dynamic Function(SearchFieldListItem<T>)? onSuggestionTap;

  final SuggestionDecoration _suggestionDecoration = SuggestionDecoration(
    color: Colors.white,
    padding: const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 12,
    ),
    borderRadius: BorderRadius.circular(4),
  );

  @override
  Widget build(BuildContext context) {
    return SearchField<T>(
      key: const Key('searchfield'),
      suggestions: suggestions,
      suggestionsDecoration: _suggestionDecoration,
      onSearchTextChanged: onSearchTextChanged,
      hint: AppString.hintSearch,
      searchInputDecoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.orange,
            style: BorderStyle.solid,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
        ),
        fillColor: Colors.white.withOpacity(0.9),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
      ),
      focusNode: focusNode,
      suggestionState: Suggestion.expand,
      onSuggestionTap: (SearchFieldListItem<T> x) {
        focusNode?.unfocus();
        onSuggestionTap?.call(x);
      },
      onTapOutside: (_) {
        focusNode?.unfocus();
      },
    );
  }
}
