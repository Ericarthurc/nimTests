import prologue
import prologue/middlewares/[staticfile]
import nimja/parser
import std/[with, os, strutils]

proc yourFunc(title: string, body: string): string =
   compileTemplateFile(getScriptDir() / "index.nimja")

proc index*(ctx: Context) {.async.} =
   resp yourFunc("Index", "Root Content")

let
   env = loadPrologueEnv(".env")
   settings = newSettings(port = Port(env.getOrDefault("PORT", 8080)))

var app = newApp(settings)

with app:
   # Static
   use(staticFileMiddleware("/public"))
   get("/manifest.webmanifest", redirectTo("/public/manifest.webmanifest"))
   get("/robots.txt", redirectTo("/public/robots.txt"))
   get("/sw.js", redirectTo("/public/sw.js"))

   # Routes
   get("/", index)

   # Start Server
   run()
