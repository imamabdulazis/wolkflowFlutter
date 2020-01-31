import 'package:redux/redux.dart';
import 'package:wolkflow/store/store.dart';

Reducer<EntitiesState> entitiesReducer = combineReducers<EntitiesState>(
    [TypedReducer<EntitiesState, AddEntitiesAction>(_addToState)]);

EntitiesState _addToState(EntitiesState state, AddEntitiesAction action) {
  return state.rebuild((b) => b
    ..entries.addAll(action.entities.entries.asMap())
    ..links.addAll(action.entities.links.asMap())
    ..linkComments.addAll(action.entities.linkComments.asMap())
    ..authorSuggestions.addAll(action.entities.authorSuggestions.asMap())
    ..notifications.addAll(action.entities.notifications.asMap())
    ..relatedLinks.addAll(action.entities.relatedLinks.asMap())
    ..entryComments.addAll(action.entities.entryComments.asMap()));
}
