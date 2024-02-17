abstract class HomeEvents {
  const HomeEvents();
}

class HomeSliderEvent extends HomeEvents {
  final int index;

  const HomeSliderEvent(this.index);
}
