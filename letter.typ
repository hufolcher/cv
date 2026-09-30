#import "color.typ": *
#import "contact.typ": identity

// --- Configuration: the letter file, then language and address as for the CV.
// typst compile letter.typ letter.pdf --input letter=letters/<name>.json
#let configuration = json("configuration.json")
#let language = sys.inputs.at("language", default: configuration.language)
#let address = sys.inputs.at("address", default: configuration.address)
// JSON strings skip smart quotes, so apostrophes are curled here.
#let curl(value) = if type(value) == str { value.replace("'", "’") } else {
  value.map(curl)
}
#let letter = (
  json(sys.inputs.at("letter", default: "letters/example.json"))
    .pairs()
    .map(((key, value)) => (key, curl(value)))
    .to-dict()
)
#let job-title = json("text/" + language + ".json").job_title

#let gutter = 2.2cm

// --- Page style, matching the CV
#set text(
  font: "Source Sans Pro",
  fill: grey,
  size: 11.5pt,
  lang: language,
  hyphenate: false,
)
#set par(justify: true, leading: 0.75em, spacing: 1.5em)
#set page(
  paper: "a4",
  margin: (left: 0pt, right: -1pt, top: 30pt, bottom: 26pt),
  footer: rect(outset: 3pt, fill: brand-gradient, width: 100%, height: 50pt),
)

// --- Header band, pulled up by the top margin so it starts at the page edge
#box(fill: navy, width: 100%, inset: (top: -30pt), box(
  fill: navy,
  width: 100%,
  inset: (x: gutter, top: 34pt, bottom: 20pt),
  stack(
    dir: ttb,
    spacing: 10pt,
    stack(
      dir: ltr,
      spacing: 5pt,
      text(size: 26pt, fill: white, weight: "bold", identity.first-name),
      text(size: 26pt, fill: white, identity.last-name),
    ),
    text(size: 13pt, fill: white, job-title),
    line(length: 100%, stroke: 2pt + brand-gradient),
    text(size: 10pt, fill: white, (
      identity.mail,
      "linkedin.com/in/" + identity.linkedin,
      "github.com/" + identity.github,
      address,
    ).join(h(1.2em))),
  ),
))

// --- Letter
#block(inset: (x: gutter, top: 40pt), width: 100%)[
  #align(right)[
    #text(weight: "bold", fill: blue, letter.recipient.first()) \
    #letter.recipient.slice(1).join(linebreak())
    #v(10pt)
    #letter.place_date
  ]

  #v(30pt)
  #text(weight: "bold", fill: blue, letter.subject)
  #v(18pt)

  #letter.salutation

  #for paragraph in letter.paragraphs [#paragraph #parbreak()]

  #letter.closing

  #v(24pt)
  #align(right, text(
    weight: "bold",
    fill: blue,
    identity.first-name + " " + identity.last-name,
  ))
]
