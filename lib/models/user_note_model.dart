class NoteModel {
  final String userId;
  final String userNote;
  const NoteModel({required this.userId, required this.userNote});
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userNote': userNote,
    };
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      userId: json['userId'],
      userNote: json['userNote'],
    );
  }
}
