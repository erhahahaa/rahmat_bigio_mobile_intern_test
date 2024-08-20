import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_morty/utils/utils.dart';

part 'get_episodes_by_filter_params.freezed.dart';

@freezed
class GetEpisodesByFilterParams with _$GetEpisodesByFilterParams {
  const factory GetEpisodesByFilterParams({
    String? name,
    String? episode,
  }) = _GetEpisodesByFilterParams;

  const GetEpisodesByFilterParams._();

  Map<String, dynamic> toJson() => {
        'name': name,
        'episode': episode,
      }.removeNullValues();
}
