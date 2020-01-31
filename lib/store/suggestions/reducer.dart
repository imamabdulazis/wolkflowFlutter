import 'package:redux/redux.dart';
import 'package:wolkflow/store/store.dart';

Reducer<SuggestionsState> suggestionsReducer =
    combineReducers<SuggestionsState>([
  TypedReducer<SuggestionsState, SetAuthorSuggestionsAction>(
      _setAuthorsSuggestions),
  TypedReducer<SuggestionsState, SetTagSuggestionsAction>(_setTagSuggestions),
]);

SuggestionsState _setAuthorsSuggestions(
    SuggestionsState state, SetAuthorSuggestionsAction action) {
  return state.rebuild((b) => b
    ..authorSuggestions.clear()
    ..authorSuggestions.addAll(action.suggestions));
}

SuggestionsState _setTagSuggestions(
    SuggestionsState state, SetTagSuggestionsAction action) {
  return state.rebuild((b) => b
    ..tagSuggestions.clear()
    ..tagSuggestions.addAll(action.suggestions));
}
