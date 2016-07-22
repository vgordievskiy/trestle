part of trestle.orm;

class CustomRepositoryQuery<M> {
  final Query _query;
  final MapsFieldsToObject<M> _mapper;
  final Map<Symbol, List> _assignments;

  CustomRepositoryQuery<M> _assign(Symbol name, Object value) =>
      new CustomRepositoryQuery(_query, _mapper,
          new Map.unmodifiable(new Map.from(_assignments)
            ..addAll({name: new List.unmodifiable((_assignments[name] ?? [])
              ..add(value))})));

  CustomRepositoryQuery(this._query, this._mapper, [this._assignments = const {}]);

  Future<M> first() => get().first;

  Stream<M> get() => _query.get()
      .asyncMap((fields) => _mapper.deserialize(fields, _assignments));
}
