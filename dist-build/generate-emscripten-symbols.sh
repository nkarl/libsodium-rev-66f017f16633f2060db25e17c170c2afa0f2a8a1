#! /bin/sh

set -e

symbols() {
  {
    SUMO="$1"
    while read symbol standard sumo; do
      found="$standard"
      if [ "x$SUMO" != "sumo" ]; then
        found="$sumo"
      fi
      if [ "$found" = "1" ]; then
        eval "defined_${symbol}=yes"
      else
        eval "defined_${symbol}=no"
      fi
    done < emscripten-symbols.def

    nm /usr/local/lib/libsodium.18.dylib | \
    fgrep ' T _' | \
    cut -d' ' -f3 | {
      while read symbol; do
        eval "found=\$defined_${symbol}"
        if [ "$found" = "yes" ]; then
          echo "$symbol"
        elif [ "$found" != "no" ]; then
          echo >&2
          echo "*** [$symbol] was not expected ***" >&2
          echo >&2
          exit 1
        fi
      done
    }
  } | \
    sort | \
    {
      while read symbol ; do
        if [ ! -z "$out" ]; then
          out="${out},"
        fi
        out="${out}\"${symbol}\""
      done
      echo "[${out}]"
    }
}

out=$(symbols standard)
sed s/EXPORTED_FUNCTIONS_STANDARD=\'.*\'/EXPORTED_FUNCTIONS_STANDARD=\'${out}\'/ < emscripten.sh > emscripten.sh.tmp && \
  mv -f emscripten.sh.tmp emscripten.sh
sed s/EXPORTED_FUNCTIONS_STANDARD=\'.*\'/EXPORTED_FUNCTIONS_STANDARD=\'${out}\'/ < emscripten-wasm.sh > emscripten-wasm.sh.tmp && \
  mv -f emscripten-wasm.sh.tmp emscripten-wasm.sh

out=$(symbols sumo)
sed s/EXPORTED_FUNCTIONS_SUMO=\'.*\'/EXPORTED_FUNCTIONS_SUMO=\'${out}\'/ < emscripten.sh > emscripten.sh.tmp && \
  mv -f emscripten.sh.tmp emscripten.sh
sed s/EXPORTED_FUNCTIONS_SUMO=\'.*\'/EXPORTED_FUNCTIONS_SUMO=\'${out}\'/ < emscripten-wasm.sh > emscripten-wasm.sh.tmp && \
  mv -f emscripten-wasm.sh.tmp emscripten-wasm.sh
