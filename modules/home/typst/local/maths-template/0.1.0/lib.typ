#import "@preview/thmbox:0.2.0": *


#let get-thmbox(variant) = {
  let variant-lower = lower(variant)

  let color-and-fill = (
    if variant-lower in ("axiom", "definition") {
      (red, red.transparentize(90%))
    } else if variant-lower in "conjecture" {
      (orange, orange.transparentize(90%))
    } else if variant-lower
      in ("corollary", "lemma", "proposition", "theorem") {
      (green, green.transparentize(90%))
    } else if variant-lower in ("example", "exercise", "note") {
      (blue, blue.transparentize(90%))
    } else {
      (gray, gray.transparentize(100%))
    }
  )

  thmbox.with(
    color: color-and-fill.at(0),
    fill: color-and-fill.at(1),
    variant: variant,
    sans: false,
  )
}

#let axiom = get-thmbox("Axiom")
#let conjecture = get-thmbox("Conjecture")
#let corollary = get-thmbox("Corollary")
#let definition = get-thmbox("Definition")
#let example = get-thmbox("Example")
#let exercise = get-thmbox("Exercise")
#let lemma = get-thmbox("Lemma")
#let note = get-thmbox("Note")
#let proposition = get-thmbox("Proposition")
#let theorem = get-thmbox("Theorem")

#let proof(..args, body) = get-thmbox("Proof").with(
  numbering: none,
  variant: if args.pos().len() == 1 [Proof of #args.at(0)] else [Proof],
)(body + qed())

#let styling(
  primary-colour: blue,
  font: ("New Computer Modern", "Source Han Sans"),
  raw-font: ("New Computer Modern Mono", "Source Han Sans"),
  body,
) = {
  set par(
    leading: 0.55em,
    spacing: 0.55em,
    first-line-indent: (amount: 1.8em, all: true),
    justify: true,
  )
  set text(font: font)
  show raw: set text(font: raw-font)
  show heading: set block(above: 1.4em, below: 1em)

  show link: set text(font: raw-font)

  show: thmbox-init()

  body
}

#let template(body) = {
  set page(margin: 1.75in)

  styling(body)
}

