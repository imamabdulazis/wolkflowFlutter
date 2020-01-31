import 'package:redux/redux.dart';
import 'package:wolkflow/store/store.dart';

Reducer<ThemeState> themeReducer = combineReducers<ThemeState>(
    [TypedReducer<ThemeState, SetThemeAction>(_setTheme)]);

ThemeState _setTheme(ThemeState state, SetThemeAction action) {
  return state.rebuild((b) => b..currentTheme = action.theme);
}
