class Trip {
  int id;
  String title;
  DateTime? start_at;
  DateTime? end_at;

  Trip(
    this.id,
    this.title, {
    this.start_at,
    this.end_at,
  });
}
