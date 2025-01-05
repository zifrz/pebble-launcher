{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05";
  packages = [
    pkgs.jdk17
    pkgs.unzip
  ];
  # Sets environment variables in the workspace
  env = { };

  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];
    previews = {
      previews = {
        # web = {
        #   command = [
        #     "flutter"
        #     "run"
        #     "--machine"
        #     "-d"
        #     "web-server"
        #     "--web-hostname"
        #     "0.0.0.0"
        #     "--web-port"
        #     "$PORT"
        #   ];
        #   manager = "flutter";
        # };
        android = {
          command = [
            "flutter"
            "run"
            "--machine"
            "-d"
            "android"
            "-d"
            "localhost:5555"
          ];
          manager = "flutter";
        };
      };
    };
  };
}
