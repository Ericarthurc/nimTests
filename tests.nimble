# Package

version       = "0.1.0"
author        = "Anonymous"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["tests"]


# Dependencies

requires "nim >= 1.6.6"
requires "prologue#head"
requires "nimja#head"
requires "nmark#head"

task prodbuild, "Build for production":
    exec "nimble build -d:release --threads:on"

task extension, "Install all extensions":
  exec "nimble install prologue@#head"
  exec "nimble install nimja@#head"
  exec "nimble install nmark@#head"