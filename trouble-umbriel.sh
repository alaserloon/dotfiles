for pid in $(pgrep -x umbriel); do
  readlink "/proc/$pid/exe"
  "/proc/$pid/exe" -v
done
