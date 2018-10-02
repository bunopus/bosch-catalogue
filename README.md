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
