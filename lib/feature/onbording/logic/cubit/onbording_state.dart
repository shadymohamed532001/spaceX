part of 'onbording_cubit.dart';

@immutable
sealed class OnbordingState {}

final class OnbordingInitial extends OnbordingState {}

final class PageViewIndexChangedState extends OnbordingState {}

final class NavigateBetweenPages extends OnbordingState {}

final class SkipToSignInOrHome extends OnbordingState {}
