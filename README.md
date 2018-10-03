# bosch-catalogue
Example repository for Dart language, which demonstrates server, client and mobile development and code reuse between them  
**Note**: this code is not super clean and polished, just an example. Pull requests are welcome :-)

## Story line
(each line is a commit)  
       ---------------------------
1. Start with simple server without any additional dependencies. Just listen on the localhost for the requests.
  **NOTE**: Put attention on *analysis_options.yaml*. It's recommended options (and most strict though).
  To start server run:
  ```zsh
    cd server
    pub get
    dart bin/server.dart
  ```
2. Mock database, and define Painting model
3. Added `json_serializable` - package for data serialization/deserialization. To generate model, follow the [rules](https://github.com/dart-lang/json_serializable/tree/master/example).
4. Combine all together. Add paintings to response, but we require additional `Paintings` class for that as a container for paintings array
       ---------------------------
5. Let's start to creating web app. Add super simple Angular 5 application (see [README](web_app/README.md) to build and run)
6. Add data, views and many more. NOTE: this is not production app, so expect many shitcoding ¯\_(ツ)_/¯.
Notice `/web/lib/paintings_service.dart`, main service for data serialization/deserialization
7. Move all models to separate package, and include it into server and web
Notice `/web_app/analysis_options.yaml`. There is one important line
    ```yaml
      plugins:
        - angular
    ```
    it enables analyzer support for angular html files