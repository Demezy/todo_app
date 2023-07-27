// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_settings_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarSettingsEntryCollection on Isar {
  IsarCollection<IsarSettingsEntry> get isarSettingsEntrys => this.collection();
}

const IsarSettingsEntrySchema = CollectionSchema(
  name: r'IsarSettingsEntry',
  id: -3240218537969208559,
  properties: {
    r'lastKnownRevision': PropertySchema(
      id: 0,
      name: r'lastKnownRevision',
      type: IsarType.long,
    )
  },
  estimateSize: _isarSettingsEntryEstimateSize,
  serialize: _isarSettingsEntrySerialize,
  deserialize: _isarSettingsEntryDeserialize,
  deserializeProp: _isarSettingsEntryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarSettingsEntryGetId,
  getLinks: _isarSettingsEntryGetLinks,
  attach: _isarSettingsEntryAttach,
  version: '3.1.0',
);

int _isarSettingsEntryEstimateSize(
  IsarSettingsEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _isarSettingsEntrySerialize(
  IsarSettingsEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.lastKnownRevision);
}

IsarSettingsEntry _isarSettingsEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSettingsEntry(
    lastKnownRevision: reader.readLong(offsets[0]),
  );
  object.id = id;
  return object;
}

P _isarSettingsEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarSettingsEntryGetId(IsarSettingsEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarSettingsEntryGetLinks(
    IsarSettingsEntry object) {
  return [];
}

void _isarSettingsEntryAttach(
    IsarCollection<dynamic> col, Id id, IsarSettingsEntry object) {
  object.id = id;
}

extension IsarSettingsEntryQueryWhereSort
    on QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QWhere> {
  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarSettingsEntryQueryWhere
    on QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QWhereClause> {
  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterWhereClause>
      idBetween(
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

extension IsarSettingsEntryQueryFilter
    on QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QFilterCondition> {
  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterFilterCondition>
      lastKnownRevisionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastKnownRevision',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterFilterCondition>
      lastKnownRevisionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastKnownRevision',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterFilterCondition>
      lastKnownRevisionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastKnownRevision',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterFilterCondition>
      lastKnownRevisionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastKnownRevision',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarSettingsEntryQueryObject
    on QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QFilterCondition> {}

extension IsarSettingsEntryQueryLinks
    on QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QFilterCondition> {}

extension IsarSettingsEntryQuerySortBy
    on QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QSortBy> {
  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterSortBy>
      sortByLastKnownRevision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownRevision', Sort.asc);
    });
  }

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterSortBy>
      sortByLastKnownRevisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownRevision', Sort.desc);
    });
  }
}

extension IsarSettingsEntryQuerySortThenBy
    on QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QSortThenBy> {
  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterSortBy>
      thenByLastKnownRevision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownRevision', Sort.asc);
    });
  }

  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QAfterSortBy>
      thenByLastKnownRevisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownRevision', Sort.desc);
    });
  }
}

extension IsarSettingsEntryQueryWhereDistinct
    on QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QDistinct> {
  QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QDistinct>
      distinctByLastKnownRevision() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastKnownRevision');
    });
  }
}

extension IsarSettingsEntryQueryProperty
    on QueryBuilder<IsarSettingsEntry, IsarSettingsEntry, QQueryProperty> {
  QueryBuilder<IsarSettingsEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarSettingsEntry, int, QQueryOperations>
      lastKnownRevisionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastKnownRevision');
    });
  }
}
