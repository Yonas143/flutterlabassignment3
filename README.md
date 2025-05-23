# flutterlabassignment3

lutter-lab-assignment-3


yonas mulugetaea (ATR/1410/08)

 lib/
│
├── app/                            # App-level configs
│   ├── router.dart                 # GoRouter setup
│   └── theme.dart                  # App theming (if any)
│
├── data/                           # Data Layer (API and models)
│   ├── models/
│   │   ├── album_model.dart
│   │   └── photo_model.dart
│   └── repository/
│       ├── album_repository.dart
│       └── photo_repository.dart
│
├                          # Business Logic Layer
│   ├── bloc/
│   │   ├── album/
│   │   │   ├── album_bloc.dart
│   │   │   ├── album_event.dart
│   │   │   └── album_state.dart
│   │   └── photo/
│   │       ├── photo_bloc.dart
│   │       ├── photo_event.dart
│   │       └── photo_state.dart
│
├── presentation/                   # UI / Presentation Layer
│   ├── pages/
│   │   ├── album_list_page.dart
│   │   └── album_detail_page.dart
│   └── widgets/
│       ├── album_tile.dart
│       └── error_widget.dart
│
├── main.dart                       # App entry point
