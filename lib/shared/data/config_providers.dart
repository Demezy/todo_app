import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/config/app_config.dart';

/// Currently app config should be overridden in [setup]function in [main.dart].
final appConfigProvider = Provider<AppConfig>((ref) {
  throw UnimplementedError(
    'Currently app config should be overridden before app starts.',
  );
});
