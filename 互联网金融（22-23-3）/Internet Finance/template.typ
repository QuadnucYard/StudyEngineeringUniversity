// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(
    margin: (left: 5mm, right: 5mm, top: 8mm, bottom: 10mm),
    numbering: "1",
    number-align: center,
  )
  set text(font: "Linux Libertine", lang: "en", size: 10pt)

  // Set paragraph spacing.
  show par: set block(above: 0.5em, below: 0.5em)
  show heading: set block(above: 0.6em, below: 0.6em)
  show terms: set block(above: 0.7em, below: 0.7em)
  
  set heading(numbering: "1.1")

  // Set run-in subheadings, starting at level 4.
  show heading: it => {
    if it.level > 4 {
      parbreak()
      text(11pt, style: "italic", weight: "regular", it.body + ".")
    } else {
      it
    }
  }

  set par(leading: 0.4em)

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
  ]

  // Main body.
  set par(justify: true)
  show: columns.with(2, gutter: 1em)

  set terms(hanging-indent: 1em)

  show figure: it => align(center)[
    #it.body
    #if it.caption != none [
      #text(9pt, [#it.supplement
      #it.counter.display(it.numbering).
      #it.caption])
    ]
]

  body
}

#let chapter(content) = {
  counter(heading).update(0)
  par(text(size: 14pt, weight: "extrabold",content))
}

#let verbose = false;