{
  config,
  lib,
  ...
}: {
  autoCmd =
    [
      {
        callback = lib.nixvim.mkRaw ''
          function()
            vim.ui.open(vim.fn.expand("%:p"))
          end
        '';
        event = ["BufRead"];
        pattern = ["*.pdf"];
      }
    ]
    ++ lib.optionals (config.plugins.snacks.enable && (builtins.hasAttr "terminal" config.plugins.snacks.settings)) [
      {
        callback = lib.nixvim.mkRaw ''
          function()
            vim.keymap.set("n", "<LocalLeader>c", function()
              local cmd = string.format("typst watch %s --open", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)))
              Snacks.terminal.toggle(cmd)
            end, { buffer = true, desc = "Compile and watch", noremap = true })
          end
        '';
        event = ["BufRead"];
        pattern = ["*.typ"];
      }

      {
        callback = lib.nixvim.mkRaw ''
          function()
            vim.keymap.set("n", "<LocalLeader>c", function()
              local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t:r")
              local filename_md = string.format("%s.md", filename)
              local filename_typ = string.format(".%s.typ", filename)
              local filename_pdf = string.format("%s.pdf", filename)

              local file = io.open(filename_typ, "w")
              file:write(string.format([[
          #import "@preview/cmarker:0.1.2"
          #import "@preview/mitex:0.2.4": mitex

          #let primary-colour = blue
          #let body-font = ("SVN-Little Pea", "Tanugo-R")
          #let raw-font = "Iosevka NFM"
          #let title-font = ("SVN-Little Pea", "Tanugo-R")

          #let secondary-colour = primary-colour.transparentize(60%%)

          #set page(
            margin: (left: 3em, right: 3em, top: 3em, bottom: 3em),
            paper: "a5",
          )

          #set text(font: body-font, size: 9pt)

          #set par(leading: 0.8em, spacing: 1em)

          #set heading(
            numbering: (..numbers) => {
              let level = numbers.pos().len()
              if (level == 1) {
                return none
              } else if (level == 2) {
                return numbering("I.", numbers.pos().at(level - 1))
              } else {
                return none
              }
            },
          )

          #set enum(
            indent: 0.5em,
            numbering: n => text(fill: primary-colour, numbering(n, "1.")),
          )

          #set list(indent: 0.5em, marker: n => text("•", fill: primary-colour), tight: false)

          #set strike(extent: 0.1em, stroke: 0.1em + secondary-colour)

          #set table(
            stroke: (x, y) => (
              bottom: none,
              left: secondary-colour,
              right: secondary-colour,
              top: none,
            ),
          )

          #show emph: text.with(fill: primary-colour)

          #show heading: set text(fill: primary-colour, font: title-font)

          #show heading.where(level: 1): it => {
            context {
              let elems = query(selector(heading).before(here()))
              if elems.len() > 1 { v(3em) }
            }
            text(it, font: title-font, size: 12pt) + v(1em)
          }

          #show link: it => underline(offset: 0.2em, text(it, fill: primary-colour))

          #show raw: it => text(it, fill: primary-colour, font: raw-font)

          #show strong: it => highlight(it, extent: 0.1em, fill: secondary-colour)

          #cmarker.render(
            blockquote: it => {
              list(
                marker: [],
                box(
                  inset: 0.5em,
                  stroke: (left: primary-colour),
                  width: 100%%,
                  it,
                ),
              )
            },
            math: mitex,
            scope: (image: (path, alt: none) => image(path, alt: alt)),
            read("%s"),
          )]], filename_md))
              file:close()

              local cmd = string.format("typst watch %s %s --open",
                vim.fn.shellescape(filename_typ),
                vim.fn.shellescape(filename_pdf)
              )
              Snacks.terminal.toggle(cmd)
            end, { buffer = true, desc = "Compile and watch", noremap = true })
          end
        '';
        event = ["BufRead"];
        pattern = ["*.md"];
      }
    ];
}
