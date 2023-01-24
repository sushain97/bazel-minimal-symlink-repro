def _make_symlink(ctx):
    symlink = ctx.actions.declare_file(ctx.attr.name)
    ctx.actions.symlink(output = symlink, target_file = ctx.file.src)
    return [DefaultInfo(files = depset([symlink]))]

make_symlink = rule(
    _make_symlink,
    attrs = {
        "src": attr.label(mandatory = True, allow_single_file = True),
    },
)
