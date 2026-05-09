{ ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      default_mode = "locked";
      default_shell = "nu";
      mirror_session = true;
      session_name = "main";
      attach_to_session = true;
      serialization_interval = 600;
    };
  };
}
