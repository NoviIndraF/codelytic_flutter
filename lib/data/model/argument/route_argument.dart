class RouteArgument {
  String? route;

  RouteArgument({ this.route});

  Map<String, dynamic> toMap() {
    return {'route': route};
  }
}