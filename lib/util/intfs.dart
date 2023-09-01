/// Specifies a class that can toggle one of its states from on to off and off to on.
///
/// This avoids checks such as:
///
/// ```
/// if(IsOn)
///   toggleOff;
/// else
///   toggleOn;
/// ```
abstract class HToggleable {
  /// Toggle on or of the current state of this class
  void toggle();
}

/// Specifies a class that can return one of its underlying operating objects.
///
/// Use with care!
abstract class HExposable<T> {
  /// Releases a reference to this object.
  T expose();
}
