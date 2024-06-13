class UserModel {
  final String displayName;
  final String userName;
  final String email;
  final String profilePic;
  final String subscriptions;
  final String videos;
  final String userId;
  final String description;
  final String type;

  UserModel({
    required this.displayName,
    required this.userName,
    required this.email,
    required this.profilePic,
    required this.subscriptions,
    required this.videos,
    required this.userId,
    required this.description,
    required this.type,
  });

  // Factory constructor for creating a new UserModel instance from a map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      displayName: json['displayName'],
      userName: json['userName'],
      email: json['email'],
      profilePic: json['profilePic'],
      subscriptions: json['subscriptions'],
      videos: json['videos'],
      userId: json['userId'],
      description: json['description'],
      type: json['type'],
    );
  }

  // Method for converting a UserModel instance into a map.
  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'userName': userName,
      'email': email,
      'profilePic': profilePic,
      'subscriptions': subscriptions,
      'videos': videos,
      'userId': userId,
      'description': description,
      'type': type,
    };
  }
}
