import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';

part 'get_characters_by_filter_params.freezed.dart';

@Freezed(toJson: false)
abstract class GetCharactersByFilterParams with _$GetCharactersByFilterParams {
  const factory GetCharactersByFilterParams({
    String? name,
    CharacterStatus? status,
    String? species,
    String? type,
    CharacterGender? gender,
  }) = _GetCharactersByFilterParams;

  const GetCharactersByFilterParams._();

  Map<String, dynamic> toJson() => {
        'name': name,
        'status': status?.value,
        'species': species,
        'type': type,
        'gender': gender?.value,
      }.removeNullValues();
}
