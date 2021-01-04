#!/usr/bin/env bash

if [[ -z "${APP_CENTER_TOKEN_HWP_MAC}" ]]; then
  echo "There is no token for App Center."
  echo "Build without App Center SDK"
  echo "let appCenterToken: String? = nil" > ./HwpMac/Utils/AppCenter.swift
else
  TOKEN="${APP_CENTER_TOKEN_HWP_MAC}"
  echo "let appCenterToken = \"${TOKEN}\"" > ./HwpMac/Utils/AppCenter.swift
fi