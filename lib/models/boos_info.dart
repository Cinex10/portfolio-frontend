class BossInfo {
  static final BossInfo _singleton = BossInfo._internal();

  factory BossInfo() {
    return _singleton;
  }

  BossInfo._internal();

  String bio = '';
  String resume = '';
  String instagramUrl = '';
  String githubUrl = '';
  String facebookUrl = '';
  String linkedinUrl = '';
  List<String> skills = [];
  List<String> tools = [];
  List<String> interests = [];

  factory BossInfo.fromJson(Map<String, dynamic> json) {
    BossInfo bossInfo = BossInfo();
    bossInfo.bio = json['bio'];
    bossInfo.instagramUrl = json['instagram'];
    bossInfo.facebookUrl = json['facebook'];
    bossInfo.linkedinUrl = json['linkedin'];
    bossInfo.githubUrl = json['github'];
    bossInfo.resume = (json['resume']['data'] != null)
        ? json['resume']['data']['attributes']['url']
        : '';
    bossInfo.skills = (json['skills'] as String).split('\n');
    bossInfo.tools = (json['tools'] as String).split('\n');
    bossInfo.interests = (json['interests'] as String).split('\n');

    return bossInfo;
  }
}
