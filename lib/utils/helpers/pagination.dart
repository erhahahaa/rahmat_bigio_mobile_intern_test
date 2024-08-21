import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @Default(0) int count,
    @Default(1) int pages,
    String? next,
    String? prev,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

@Freezed(genericArgumentFactories: true)
class WithPagination<T> with _$WithPagination<T> {
  const factory WithPagination({
    required Pagination info,
    required List<T> results,
  }) = _WithPagination<T>;

  factory WithPagination.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$WithPaginationFromJson(json, fromJsonT);
}
