extension ObjectExt on dynamic {
  T? castOrNull<T>() => this is T ? this : null;
}
