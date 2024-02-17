abstract class AppEvent {
  const AppEvent();
}

class TriggerBottomBarEvent extends AppEvent {
  final int index;
  const TriggerBottomBarEvent(this.index) : super();
}
