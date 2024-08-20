import 'package:freezed_annotation/freezed_annotation.dart';

part 'by_id_param.freezed.dart';

@freezed
class ByIdParam with _$ByIdParam {
  const factory ByIdParam({
    required int id,
  }) = _ByIdParam;
}
