class DetailsViewNavigatorModel {
  final String fromWhere;
  final int id;

  DetailsViewNavigatorModel({required this.fromWhere, required this.id});

  Map<String, dynamic> toJson() {
    return {
      'fromWhere': fromWhere,
      'id': id,
    };
  }
}
