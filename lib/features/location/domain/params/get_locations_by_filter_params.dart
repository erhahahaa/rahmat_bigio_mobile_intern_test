import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_morty/utils/utils.dart';

part 'get_locations_by_filter_params.freezed.dart';

@freezed
class GetLocationsByFilterParams with _$GetLocationsByFilterParams {
  const factory GetLocationsByFilterParams({
    String? name,
    String? type,
    String? dimension,
  }) = _GetLocationsByFilterParams;

  const GetLocationsByFilterParams._();

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        'dimension': dimension,
      }.removeNullValues();
}
