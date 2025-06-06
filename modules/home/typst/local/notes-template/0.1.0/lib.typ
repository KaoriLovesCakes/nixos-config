#import "@preview/pigmentpedia:0.3.3": nord
#import "@preview/rubby:0.10.2": get-ruby


#let furigana = get-ruby(auto-spacing: false)

#let styling(
  primary-colour: blue,
  body-font: "Source Han Sans",
  raw-font: ("New Computer Modern Mono", "Source Han Sans"),
  title-font: "Source Han Sans",
  body,
) = {
  let secondary-colour = primary-colour.transparentize(60%)

  set text(fill: nord.snow-storm, font: body-font, size: 8pt)

  set par(leading: 0.8em, spacing: 0.8em)

  set enum(indent: 0.5em, numbering: n => text(fill: primary-colour, numbering(
    "1",
    n,
  )))

  set highlight(extent: 0.1em, fill: secondary-colour)

  set list(indent: 0.5em, marker: n => text(fill: primary-colour, "•"))

  set strike(extent: 0.1em, stroke: 0.1em + secondary-colour)

  set table(stroke: secondary-colour)

  show emph: set text(fill: primary-colour)

  show heading: set text(fill: primary-colour, font: title-font)
  show heading: set block(above: 3em, below: 1.5em)

  show link: set text(fill: primary-colour, font: raw-font, size: 10pt)
  show link: underline

  show raw: set text(fill: primary-colour, font: raw-font, size: 10pt)

  show strong: it => highlight(it.body)

  body
}

#let template(..args, body) = {
  set page(
    fill: nord.polar-night-1,
    margin: (left: 3em, right: 3em, top: 3em, bottom: 3em),
    paper: "a5",
  )

  styling(..args, body)
}
