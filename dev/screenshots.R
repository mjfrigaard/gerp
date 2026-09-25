# Render console screenshots for the vignettes (man/figures/grp_*.png)
# requires: chromium (or Chrome) on the PATH and the magick package
devtools::load_all()
options(cli.num_colors = 1, cli.unicode = TRUE, width = 76)

chromium <- Sys.which(c("chromium", "google-chrome", "chrome"))
chromium <- chromium[nzchar(chromium)][1]
fig_dir <- normalizePath("man/figures")

# run code in a fresh 'projects' folder and capture the console ----
capture_console <- function(code, setup = NULL) {
  root <- fs::path(withr::local_tempdir(.local_envir = parent.frame()), "projects")
  fs::dir_create(root)
  proj <- fs::path(root, "my-project")
  if (!is.null(setup)) setup(root, proj)
  withr::local_dir(if (fs::dir_exists(proj)) proj else root)
  out <- character()
  for (line in code) {
    out <- c(out, paste(">", line))
    res <- withCallingHandlers(
      utils::capture.output(print_value(eval(parse(text = line), globalenv()))),
      message = function(m) {
        out <<- c(out, sub("\n$", "", conditionMessage(m)))
        invokeRestart("muffleMessage")
      }
    )
    out <- c(out, res)
  }
  out <- gsub(fs::path_real(root), "~/projects", out, fixed = TRUE)
  gsub(root, "~/projects", out, fixed = TRUE)
}

print_value <- function(x) {
  if (withVisible(x)$visible && !is.null(x)) print(x)
}

# console text to html ----
console_html <- function(lines) {
  esc <- function(x) {
    x <- gsub("&", "&amp;", x, fixed = TRUE)
    x <- gsub("<", "&lt;", x, fixed = TRUE)
    gsub(">", "&gt;", x, fixed = TRUE)
  }
  body <- vapply(lines, function(l) {
    if (startsWith(l, "> ")) {
      paste0('<span class="prompt">&gt;</span> <span class="cmd">', esc(substring(l, 3)), "</span>")
    } else if (grepl("^✔", l)) {
      paste0('<span class="ok">✔</span>', esc(substring(l, 2)))
    } else if (grepl("^ℹ", l)) {
      paste0('<span class="info">ℹ</span>', esc(substring(l, 2)))
    } else {
      esc(l)
    }
  }, character(1), USE.NAMES = FALSE)
  paste0(
    '<!doctype html><html><head><meta charset="utf-8">',
    '<link href="https://fonts.googleapis.com/css2?family=Ubuntu+Mono&display=swap" rel="stylesheet">',
    "<style>",
    "html,body{margin:0;background:#011627;}",
    ".bar{height:28px;background:#0b2238;display:flex;align-items:center;padding:0 12px;gap:8px;",
    "font:13px 'Ubuntu Mono',monospace;color:#cbcbcb;}",
    ".dot{width:12px;height:12px;border-radius:50%;display:inline-block;}",
    "pre{margin:0;padding:14px 18px;font:15px/20px 'Ubuntu Mono',monospace;color:#cbcbcb;white-space:pre;}",
    ".prompt{color:#ff6f3c;font-weight:700}.cmd{color:#ffd23f}.ok{color:#2ec4b6}.info{color:#ff6f3c}",
    "</style></head><body>",
    '<div class="bar"><span class="dot" style="background:#ff6f3c"></span>',
    '<span class="dot" style="background:#ffd23f"></span>',
    '<span class="dot" style="background:#2ec4b6"></span>&nbsp;Console</div>',
    "<pre>", paste(body, collapse = "\n"), "</pre></body></html>"
  )
}

# render png with headless chromium ----
render_png <- function(lines, file, width = 760) {
  html <- tempfile(fileext = ".html")
  writeLines(console_html(lines), html, useBytes = TRUE)
  height <- 28 + 28 + 20 * length(lines)
  out <- file.path(fig_dir, file)
  system2(chromium, c(
    "--headless=new", "--disable-gpu", "--hide-scrollbars",
    "--force-device-scale-factor=2", "--virtual-time-budget=3000",
    # headless chromium hides ~90px of the viewport, so render taller and crop
    paste0("--window-size=", width, ",", height + 120),
    paste0("--screenshot=", out), paste0("file://", html)
  ), stdout = FALSE, stderr = FALSE)
  img <- magick::image_crop(magick::image_read(out), paste0(width * 2, "x", height * 2, "+0+0"))
  magick::image_write(img, out)
  message("wrote ", out)
}

new_proj <- function(root, proj) fs::dir_create(proj)

shots <- list(
  "grp_setup.png" = list(code = c("grp_setup()", "fs::dir_tree()"), setup = new_proj),
  "grp_code.png" = list(code = c("grp_code()", "fs::dir_tree()"), setup = new_proj),
  "grp_data.png" = list(code = c("grp_data()", "fs::dir_tree()"), setup = new_proj),
  "grp_dev.png" = list(code = c("grp_dev()", "fs::dir_tree()"), setup = new_proj),
  "grp_report.png" = list(code = c("grp_report()", "fs::dir_tree()"), setup = new_proj),
  "grp_create.png" = list(
    code = c('grp_create("my-project", open = FALSE)', 'fs::dir_tree("my-project")')
  ),
  "grp_path.png" = list(
    code = c('grp_path(".")', 'grp_path(".", tree = TRUE)', 'grp_path("pkgs", type = "rel")'),
    setup = function(root, proj) {
      fs::dir_create(fs::path(root, c("analysis", "blog", "pkgs")))
    }
  )
)

for (nm in names(shots)) {
  s <- shots[[nm]]
  render_png(capture_console(s$code, s$setup), nm)
}
