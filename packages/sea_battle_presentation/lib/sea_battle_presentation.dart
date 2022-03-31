library sea_battle_presentation;

export 'presentation/view/app_view.dart';
export "presentation/sea_battle_app.dart";
export "presentation/page/error/error_page.dart";
export "presentation/page/first_setup/first_setup_page.dart";
export "presentation/page/home/home_page.dart";
export "presentation/page/poster/poster_page.dart";
export "presentation/page/rating/rating_page.dart";

export "handler/abstraction/error_localizer.dart";
export "handler/abstraction/first_setup_step_handler.dart";
export "handler/abstraction/first_setup_copier.dart";

export "handler/implementation/default_first_setup_copier.dart";
export "handler/implementation/empty_string_error_localizer.dart";
export "handler/implementation/existing_error_localizer.dart";
export "handler/implementation/first_setup_language_step_handler.dart";
export "handler/implementation/first_setup_nickname_step_handler.dart";
export "handler/implementation/short_string_error_localizer.dart";
export "handler/implementation/unknown_error_localizer.dart";

export "router/app_router.dart";
export "router/default_app_router.dart";

export "logic/abstraction/progress_stages_builder.dart";
export "logic/implementation/default_progress_stages_builder.dart";
