#!/system/bin/env sh
#
# Enable all Magisk modules except zn_magisk_compat

MODDIR="$(dirname "$0")"
for mod in "$MODDIR"/../*; do
  [ -d "$mod" ] || continue
  # Skip zn_magisk_compat module
  case "$mod" in
    */zn_magisk_compat) continue ;;
  esac
  if [ -f "$mod/disable" ]; then
    list="${list} $mod/disable"
  fi
done
[ -n "$list" ] && rm -f -- $list
