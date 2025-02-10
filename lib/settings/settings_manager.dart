import '../main.dart';

final themeModeRM = RM.inject(() => ThemeMode.system);
ThemeMode themeMode([ThemeMode? _]) {
  if (_ != null) themeModeRM.state = _;
  return themeModeRM.state;
}
