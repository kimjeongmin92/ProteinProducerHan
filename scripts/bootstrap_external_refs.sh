#!/usr/bin/env bash
set -euo pipefail

mkdir -p external

clone_ref () {
  name="$1"
  url="$2"
  if [ -d "external/$name/.git" ]; then
    echo "[skip] $name"
  else
    git clone --depth 1 "$url" "external/$name"
  fi
}

clone_ref DeepCoy https://github.com/fimrie/DeepCoy.git
clone_ref SmallMolEval https://github.com/llnl/SmallMolEval.git
clone_ref MUBDsyn https://github.com/taoshen99/MUBDsyn.git
clone_ref MUBD-DecoyMaker2.0 https://github.com/jwxia2014/MUBD-DecoyMaker2.0.git
clone_ref DataSAIL https://github.com/kalininalab/DataSAIL.git
clone_ref GEMS https://github.com/camlab-ethz/GEMS.git

echo "External repositories cloned under ./external/"
echo "Record commit hashes before comparative experiments."
