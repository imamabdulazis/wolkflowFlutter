import 'package:wolkflow/store/store.dart';
import 'package:flutter/material.dart';

/*
  Reducer that directs actions of all tags screens into their reducers.
**/
TagsState tagReducer(TagsState state, action) {
  if (action is TypedAction && action.type.startsWith("TAG_")) {
    debugPrint(action.type);
    var tag = action.type.split('_')[2];
    debugPrint(tag);
    var newState =
        state.rebuild((b) => b..states.putIfAbsent(tag, () => TagState()));
    return newState.rebuild((e) => e
      ..states.updateValue(
          tag,
          (tagState) => tagState.rebuild(
                (k) => k
                  ..indexState.replace(itemListReducer(TAG_INDEX_PREFIX + tag,
                      newState.states[tag].indexState, action))
                  ..entriesState.replace(itemListReducer(
                      TAG_ENTRIES_PREFIX + tag,
                      newState.states[tag].entriesState,
                      action))
                  ..linksState.replace(itemListReducer(TAG_LINKS_PREFIX + tag,
                      newState.states[tag].linksState, action)),
              )));
  } else {
    return state;
  }
}
