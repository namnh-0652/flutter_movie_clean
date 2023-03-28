# flutter_movie_clean
A sample Flutter application follow clean architecture

## Installation
Clone this repository
```bash
git clone git@github.com:namnh-0652/flutter_movie_clean.git
```
Install Pub
```bash
flutter clean
flutter pub get
```

Run command to add file `locale_keys.g.dart`, this file support for library `easy_localization`
```bash
flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart
```

Run command to run code generator for your assets, fonts, colors... by `FlutterGen`
```bash 
flutter packages pub run build_runner build
```
