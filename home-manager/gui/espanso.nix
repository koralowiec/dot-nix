# Configuration for espanso

{ config, lib, pkgs, ... }:
let
  matches = [
    {
      trigger = ":today";
      replace = "{{today}}";
      vars = [{
        name = "today";
        type = "date";
        params = {
          format = "%Y-%m-%d";
        };
      }];
    }
    {
      trigger = ";r?";
      replace = "¿";
    }
    {
      trigger = ";r!";
      replace = "¡";
    }
    {
      trigger = ";si";
      replace = "í";
    }
    {
      trigger = ";sa";
      replace = "á";
    }
    {
      trigger = ";sn";
      replace = "ñ";
    }
    {
      trigger = ";se";
      replace = "é";
    }
    {
      trigger = ";su";
      replace = "ú";
    }
  ];
in
{ 
  services.espanso = {
    enable = true;
    matches = {
      default = {
        matches = matches;
      };
    };
  };
}
