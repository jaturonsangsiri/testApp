abstract class LayoutEvent {}

class CheckLayoutEvent extends LayoutEvent {
  final double screenWidth;

  CheckLayoutEvent(this.screenWidth);
}