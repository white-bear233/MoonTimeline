$ErrorActionPreference = 'Stop'
Push-Location (Split-Path $PSScriptRoot -Parent)
try {
  function CheckExit { if ($LASTEXITCODE -ne 0) { throw "Validation failed ($LASTEXITCODE)" } }
  moon info
  CheckExit
  moon fmt --check
  CheckExit
  foreach ($backend in @('js', 'wasm-gc')) {
    moon check --target $backend
    CheckExit
    moon build --target $backend
    CheckExit
    moon test --target $backend
    CheckExit
  }
  .venv/Scripts/python.exe tools/oracle.py --check
  CheckExit
  python tools/generate_time_tests.py --check
  CheckExit
  .venv/Scripts/python.exe tools/check_roundtrip.py
  CheckExit
  .venv/Scripts/python.exe tools/check_edits.py
  CheckExit
  git diff --check
  CheckExit
} finally { Pop-Location }
