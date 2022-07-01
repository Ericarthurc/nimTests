import prologue
import nimja/parser
import os, strutils

proc yourFunc(title: string): string =
   compileTemplateFile(getScriptDir() / "index.nimja")

proc index*(ctx: Context) {.async.} =
   resp yourFunc("TACO TIME!")

let app = newApp()

app.get("/", index)

app.run()
