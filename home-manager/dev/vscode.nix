{ pkgs, pkgs-unstable, ... }:
{ 
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      vscodevim.vim
    ];
    keybindings = [
      {
        key = "ctrl+shift+'";
        command =  "workbench.action.chat.openInSidebar";
      }
      {
        key = "ctrl+shift+/";
        command = "workbench.action.togglePanel";
      }
      {
        key = "ctrl+j";
        command = "-workbench.action.togglePanel";
      }
      {
        key = "alt+'";
        command = "workbench.action.focusPanel";
      }
    ];
    package = pkgs-unstable.vscode;
    mutableExtensionsDir = true;
    userSettings = {
      "editor.formatOnSave" = true;
      "editor.lineNumbers" = "relative";
      "editor.minimap.enabled" = false;
      "github.copilot.editor.enableAutoCompletions" = true;
      "python.languageServer" = "Pylance";
      "vim.useSystemClipboard" = true;
      "window.menuBarVisibility" = "toggle";
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "workbench.iconTheme" = "catppuccin-macchiato";
      # Disable VS Code's keybind for Ctrl+P in terminal
      "terminal.integrated.commandsToSkipShell" = [
        "-workbench.action.quickOpen"
      ];
      "telemetry.telemetryLevel" = "off";
    };
  };
}
