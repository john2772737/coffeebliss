import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<Themebutton>((event, emit) {
      if (state is ThemeLight){
        emit(ThemeDark());
      }
      else{
        emit(ThemeLight());
      }
    });
  }
}
