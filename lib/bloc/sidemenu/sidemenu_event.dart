part of 'sidemenu_bloc.dart';

@immutable
abstract class SidemenuEvent {}

class OnOpenMenu extends SidemenuEvent{
  OnOpenMenu();
}

class OnCloseMenu extends SidemenuEvent{
  OnCloseMenu();
}
