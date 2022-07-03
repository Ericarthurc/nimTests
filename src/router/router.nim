import prologue
import strformat

proc blogHandler(ctx: Context) {.async.} = resp "Good bye!"

proc blogIdHandler(ctx: Context) {.async.} =
    let blogId = ctx.getPathParams("blog")
    resp &"<h2>{blogId}</h2>"


proc blogRoutes*(app: Prologue): Group {.discardable.} =
    var blogRoutes = newGroup(app, "/blog", @[])
    blogRoutes.get("/", blogHandler)
    blogRoutes.get("/{blog}", blogIdHandler)

    return blogRoutes

