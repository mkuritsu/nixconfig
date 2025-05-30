{ ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        follow = "mouse";
        frame_color = "#89b4fa";
        separator_color = "frame";
        highlight = "#89b4fa";
        font = "jetbrains mono";
        format = "<b>%a</b>\n%b";
      };
      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };
      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };
      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#fab387";
      };
    };
  };
}
