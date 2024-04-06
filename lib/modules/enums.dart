enum MessageType {
  text,
  image,
  video,
  files;

  String toJson() => name;

  factory MessageType.fromJson(String json) => values.byName(json);
}
