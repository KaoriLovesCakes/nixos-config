#let styling(
  primary-colour: blue,
  body-font: ("SVN-Little Pea", "Tanugo-R"),
  raw-font: "Iosevka NFM",
  title-font: ("SVN-Little Pea", "Tanugo-R"),
  body,
) = {
  let secondary-colour = primary-colour.transparentize(60%)

  set text(font: body-font, size: 9pt)

  set par(leading: 0.8em, spacing: 1em)

  set heading(
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

  set enum(
    indent: 0.5em,
    numbering: n => text(fill: primary-colour, numbering("1.", n)),
  )

  set highlight(extent: 0.1em, fill: secondary-colour)

  set list(
    indent: 0.5em,
    marker: n => text(fill: primary-colour, "•"),
    tight: false,
  )

  set strike(extent: 0.1em, stroke: 0.1em + secondary-colour)

  set table(stroke: secondary-colour)

  show emph: set text(fill: primary-colour)

  show heading: set text(fill: primary-colour, font: title-font, size: 12pt)
  show heading: it => { it.body + v(1em) }

  show link: set text(fill: primary-colour)
  show link: underline

  show raw: set text(fill: primary-colour, font: raw-font)

  show strong: it => highlight(it.body)

  body
}

#let template(
  primary-colour: blue,
  body-font: ("SVN-Little Pea", "Tanugo-R"),
  raw-font: "Iosevka NFM",
  title-font: ("SVN-Little Pea", "Tanugo-R"),
  body,
) = {
  set page(
    margin: (left: 3em, right: 3em, top: 3em, bottom: 3em),
    paper: "a5",
  )

  styling(
    primary-colour: primary-colour,
    body-font: body-font,
    raw-font: raw-font,
    title-font: title-font,
    body,
  )
}
