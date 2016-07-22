part of trestle.gateway;

class CustomQuery extends _Query {
  final String query;
  CustomQuery(Driver _driver, String table, this.query)
    : super(_driver, table);
}
