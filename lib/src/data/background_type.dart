enum BackgroundType {
  color,
  gradient,
  image,
  video;

  @override
  String toString() {
    return name[0].toUpperCase() + name.substring(1);
  }
}
