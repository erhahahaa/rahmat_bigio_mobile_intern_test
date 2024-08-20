import 'package:freezed_annotation/freezed_annotation.dart';

part 'by_ids_param.freezed.dart';

@freezed
class ByIdsParam with _$ByIdsParam {
  const factory ByIdsParam({
    required List<int> ids,
  }) = _ByIdsParam;

  const ByIdsParam._();

  String serialize() => ids.join(',');
}
