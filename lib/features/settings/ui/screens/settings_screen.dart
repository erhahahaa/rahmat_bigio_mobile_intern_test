import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: AppBar(
        title: Text(context.str?.settings ?? 'Settings'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return ListTile(
                    title: Text(context.str?.theme ?? 'Theme'),
                    trailing: Switch(
                      value: state.themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        final theme = value ? ThemeMode.dark : ThemeMode.light;
                        context.read<SettingsBloc>().add(
                              SettingsEvent.changedTheme(theme),
                            );
                      },
                    ),
                  );
                },
              ),
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return ListTile(
                    title: Text(context.str?.language ?? 'Language'),
                    trailing: DropdownButton<Locale>(
                      value: state.locale,
                      items: [
                        DropdownMenuItem(
                          value: L10n.supportedLocales[0],
                          child: Text(
                            L10n.getNameFlag(
                                L10n.supportedLocales[0].languageCode),
                          ),
                        ),
                        DropdownMenuItem(
                          value: L10n.supportedLocales[1],
                          child: Text(
                            L10n.getNameFlag(
                                L10n.supportedLocales[1].languageCode),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        if (value == null) return;
                        context.read<SettingsBloc>().add(
                              SettingsEvent.changedLocale(value),
                            );
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: _buildAbout(context),
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: _buildCreator(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAbout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleLarge(context.str?.about ?? 'About'),
        Gap(8.h),
        ListTileBoxWrapper(
          title: context.str?.app_version ?? 'Version',
          subtitle: '1.0.0',
        ),
        ListTileBoxWrapper(
          title: context.str?.app_name ?? 'App Name',
          subtitle: 'Rick & Morty',
        ),
        ListTileBoxWrapper(
          title: context.str?.purpose ?? 'Purpose',
          subtitle: context.str?.actual_purpose ??
              'This app is made for internship purposes',
        ),
      ],
    );
  }

  Widget _buildCreator(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleLarge(context.str?.developer),
        Gap(8.h),
        ListTileBoxWrapper(
          image: 'https://avatars.githubusercontent.com/u/90142822?v=4',
          title: context.str?.name ?? 'Name',
          subtitle: 'Rahmat Hidayatullah',
        ),
        ListTileBoxWrapper(
          title: context.str?.email ?? 'Email',
          subtitle: 'rahmat.21020@mhs.unesa.ac.id / rahmat@zenta.dev',
        ),
        ListTileBoxWrapper(
          title: context.str?.phone ?? 'Phone',
          subtitle: '+62 85 732 030 855',
        ),
      ],
    );
  }
}
