[
  "fnm"
  "lua"
  "pyenv"
  "pyenv-virtualenv"
  {
    name = "mysql@8.4";
    conflicts_with = [ "mysql" ];
    link = true;
    restart_service = "changed";
  }
  # Default database will be called "postgres". To connect to it:
  # psql -d postgres
  {
    name = "postgresql@17";
    conflicts_with = [ "postgresql" ];
    link = true;
    restart_service = "changed";
  }
]
