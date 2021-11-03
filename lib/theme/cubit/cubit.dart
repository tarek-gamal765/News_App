import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cache%20helper/cache_helper.dart';
import 'package:news/theme/cubit/states.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInitialState());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
       emit(NewsChangeThemeModeState());
    } else if(fromShared == null){
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(NewsChangeThemeModeState());
    });
    emit(NewsChangeThemeModeState());
    }
     
  }
}
