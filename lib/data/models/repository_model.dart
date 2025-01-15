import 'dart:convert';

class TrendingResponse {
  final int totalCount;
  final bool incompleteResults;
  final List<Repository> items;

  TrendingResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  factory TrendingResponse.fromJson(Map<String, dynamic> json) {
    return TrendingResponse(
      totalCount: json['total_count'],
      incompleteResults: json['incomplete_results'],
      items: (json['items'] as List)
          .map((item) => Repository.fromJson(item))
          .toList(),
    );
  }
}

class Repository {
  final int id;
  final String name;
  final String fullName;
  final String htmlUrl;
  final Owner owner;

  Repository({
    required this.id,
    required this.name,
    required this.fullName,
    required this.htmlUrl,
    required this.owner,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      htmlUrl: json['html_url'],
      owner: Owner.fromJson(json['owner']),
    );
  }
}

class Owner {
  final String login;
  final String avatarUrl;

  Owner({
    required this.login,
    required this.avatarUrl,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}
