class Postmodel {
  String userName;
  String userTitle;
  String timeAgo;
  String postText;
  String likes;
  String comments;
  String? imageUrl;

  Postmodel({
    required this.userName,
    required this.userTitle,
    required this.timeAgo,
    required this.postText,
    required this.likes,
    required this.comments,
    this.imageUrl,
  });
}
