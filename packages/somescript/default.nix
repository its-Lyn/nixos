{ writeScriptBin, ... }:
writeScriptBin "run-somescript" ''
  echo hello
  echo "I'm somescript"
''
