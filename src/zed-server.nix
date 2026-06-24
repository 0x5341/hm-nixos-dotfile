{ pkgs, ... }: {
  home.file.".zed_server" = {
    source = "${pkgs.zed-editor.remote_server}/bin";
    recursive = true;
  };
}
