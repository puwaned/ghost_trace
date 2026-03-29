// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fog_tile_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFogTileModelCollection on Isar {
  IsarCollection<FogTileModel> get fogTileModels => this.collection();
}

const FogTileModelSchema = CollectionSchema(
  name: r'FogTileModel',
  id: -4956195208680145791,
  properties: {
    r'exploredAt': PropertySchema(
      id: 0,
      name: r'exploredAt',
      type: IsarType.dateTime,
    ),
    r'latitude': PropertySchema(
      id: 1,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 2,
      name: r'longitude',
      type: IsarType.double,
    )
  },
  estimateSize: _fogTileModelEstimateSize,
  serialize: _fogTileModelSerialize,
  deserialize: _fogTileModelDeserialize,
  deserializeProp: _fogTileModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _fogTileModelGetId,
  getLinks: _fogTileModelGetLinks,
  attach: _fogTileModelAttach,
  version: '3.1.0+1',
);

int _fogTileModelEstimateSize(
  FogTileModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _fogTileModelSerialize(
  FogTileModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.exploredAt);
  writer.writeDouble(offsets[1], object.latitude);
  writer.writeDouble(offsets[2], object.longitude);
}

FogTileModel _fogTileModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FogTileModel();
  object.exploredAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.latitude = reader.readDouble(offsets[1]);
  object.longitude = reader.readDouble(offsets[2]);
  return object;
}

P _fogTileModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _fogTileModelGetId(FogTileModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _fogTileModelGetLinks(FogTileModel object) {
  return [];
}

void _fogTileModelAttach(
    IsarCollection<dynamic> col, Id id, FogTileModel object) {
  object.id = id;
}

extension FogTileModelQueryWhereSort
    on QueryBuilder<FogTileModel, FogTileModel, QWhere> {
  QueryBuilder<FogTileModel, FogTileModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FogTileModelQueryWhere
    on QueryBuilder<FogTileModel, FogTileModel, QWhereClause> {
  QueryBuilder<FogTileModel, FogTileModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FogTileModelQueryFilter
    on QueryBuilder<FogTileModel, FogTileModel, QFilterCondition> {
  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition>
      exploredAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exploredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition>
      exploredAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exploredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition>
      exploredAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exploredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition>
      exploredAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exploredAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition>
      latitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition>
      latitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition>
      latitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition>
      latitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition>
      longitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition>
      longitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition>
      longitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterFilterCondition>
      longitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension FogTileModelQueryObject
    on QueryBuilder<FogTileModel, FogTileModel, QFilterCondition> {}

extension FogTileModelQueryLinks
    on QueryBuilder<FogTileModel, FogTileModel, QFilterCondition> {}

extension FogTileModelQuerySortBy
    on QueryBuilder<FogTileModel, FogTileModel, QSortBy> {
  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy> sortByExploredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exploredAt', Sort.asc);
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy>
      sortByExploredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exploredAt', Sort.desc);
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }
}

extension FogTileModelQuerySortThenBy
    on QueryBuilder<FogTileModel, FogTileModel, QSortThenBy> {
  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy> thenByExploredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exploredAt', Sort.asc);
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy>
      thenByExploredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exploredAt', Sort.desc);
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }
}

extension FogTileModelQueryWhereDistinct
    on QueryBuilder<FogTileModel, FogTileModel, QDistinct> {
  QueryBuilder<FogTileModel, FogTileModel, QDistinct> distinctByExploredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exploredAt');
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<FogTileModel, FogTileModel, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }
}

extension FogTileModelQueryProperty
    on QueryBuilder<FogTileModel, FogTileModel, QQueryProperty> {
  QueryBuilder<FogTileModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FogTileModel, DateTime, QQueryOperations> exploredAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exploredAt');
    });
  }

  QueryBuilder<FogTileModel, double, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<FogTileModel, double, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }
}
