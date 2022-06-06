part of 'sidemenu_bloc.dart';

@immutable
abstract class SidemenuEvent {}

class OnOpenMenu extends SidemenuEvent{
  OnOpenMenu();
}

class OnCloseMenu extends SidemenuEvent{
  OnCloseMenu();
}

class OnCurrentPage extends SidemenuEvent{
  final String currentPage;
  final String userID;
  OnCurrentPage(this.userID, {required this.currentPage});
}