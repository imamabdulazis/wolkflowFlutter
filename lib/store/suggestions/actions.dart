import 'package:wolkflow/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:wolkflow/store/store.dart';
import 'package:redux/redux.dart';
import 'package:wolkflow/models/models.dart';
import 'dart:async';

class SetAuthorSuggestionsAction {
  final List<AuthorSuggestion> suggestions;
  SetAuthorSuggestionsAction({this.suggestions});
}

class SetTagSuggestionsAction {
  final List<TagSuggestion> suggestions;
  SetTagSuggestionsAction({this.suggestions});
}

ThunkAction<AppState> loadSuggestions(String q, Completer completer) {
  return (Store<AppState> store) async {
    try {
      if (q != null) {
        if (q.startsWith("@") && verifyAuthorSuggestion(q)) {
          var suggestions = await api.suggest.suggestUsers(q.split("@")[1]);
          completer.complete();
          store.dispatch(SetAuthorSuggestionsAction(suggestions: suggestions));

          // Clear tag suggestions when its a tag suggestion
          store.dispatch(SetTagSuggestionsAction(suggestions: []));
          return;
        } else if (q.startsWith("#") && verifyTagSuggestion(q)) {
          var suggestions = await api.suggest.suggestTags(q.split("#")[1]);
          completer.complete();
          store.dispatch(SetTagSuggestionsAction(suggestions: suggestions));

          // Clear author suggestions when its a tag suggestion
          store.dispatch(SetAuthorSuggestionsAction(suggestions: []));
          return;
        }
      }
      store.dispatch(SetAuthorSuggestionsAction(suggestions: []));
      store.dispatch(SetTagSuggestionsAction(suggestions: []));
    } catch (e) {
      // store.dispatch(SetErrorAction(error: e));
    }
  };
}

// TODO: fix this regex
bool verifyAuthorSuggestion(String q) {
  return true;
  var regex = RegExp(r"^[A-Za-z0-9]+(?:[ _][A-Za-z0-9]+)*$");
  return regex.hasMatch(q);
}

// TODO: fix this regex
bool verifyTagSuggestion(String q) {
  return true;
  var regex = RegExp(r"^#\w+$");
  return regex.hasMatch(q);
}
