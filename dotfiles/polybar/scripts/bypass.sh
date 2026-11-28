#!/usr/bin/env bash

INTERFACE="warp"

case "$1" in
--toggle)
  if ip link show "$INTERFACE" >/dev/null 2>&1; then
    sudo awg-quick down "$INTERFACE"
  else
    sudo awg-quick up "$INTERFACE"
  fi
  ;;
*)
  if ip link show "$INTERFACE" >/dev/null 2>&1; then
    echo "%{F#a6e3a1}AWG: ON%{F-}"
  else
    echo "%{F#f38ba8}AWG: OFF%{F-}"
  fi
  ;;
esac
