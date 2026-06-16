#import "@local/colors:0.0.1": color

#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

#let palette = (
  color.blind.blue,
  color.blind.green,
  color.blind.yellow,
  color.blind.orange,
  color.blind.red
)

#cetz.canvas({
  let length  = 30
  let height  = 0.8
  let A       = (1 - 0.93)*length
  let A_minus = (1 - 0.90)*length
  let B_plus  = (1 - 0.87)*length
  let B       = (1 - 0.83)*length
  let B_minus = (1 - 0.80)*length
  let C_plus  = (1 - 0.77)*length
  let C       = (1 - 0.73)*length
  let C_minus = (1 - 0.70)*length
  let D       = (1 - 0.60)*length
  let F       = (1 - 0.50)*length
  cetz.draw.rect((0.0,     0.0), (A,       height), stroke: color.white, fill: palette.at(0), name: "A")
  cetz.draw.rect((A,       0.0), (A_minus, height), stroke: color.white, fill: palette.at(0), name: "A-")
  cetz.draw.rect((A_minus, 0.0), (B_plus,  height), stroke: color.white, fill: palette.at(1), name: "B+")
  cetz.draw.rect((B_plus,  0.0), (B,       height), stroke: color.white, fill: palette.at(1), name: "B")
  cetz.draw.rect((B,       0.0), (B_minus, height), stroke: color.white, fill: palette.at(1), name: "B-")
  cetz.draw.rect((B_minus, 0.0), (C_plus,  height), stroke: color.white, fill: palette.at(2), name: "C+")
  cetz.draw.rect((C_plus,  0.0), (C,       height), stroke: color.white, fill: palette.at(2), name: "C")
  cetz.draw.rect((C,       0.0), (C_minus, height), stroke: color.white, fill: palette.at(2), name: "C-")
  cetz.draw.rect((C_minus, 0.0), (D,       height), stroke: color.white, fill: palette.at(3), name: "D")
  cetz.draw.rect((D,       0.0), (F,       height), stroke: color.white, fill: palette.at(4), name: "F")
  cetz.draw.content("A",  text(fill: color.white, smallcaps[A]))
  cetz.draw.content("A-", text(fill: color.white, smallcaps[A-]))
  cetz.draw.content("B+", text(fill: color.white, smallcaps[B+]))
  cetz.draw.content("B",  text(fill: color.white, smallcaps[B]))
  cetz.draw.content("B-", text(fill: color.white, smallcaps[B-]))
  cetz.draw.content("C+", text(fill: color.white, smallcaps[C+]))
  cetz.draw.content("C",  text(fill: color.white, smallcaps[C]))
  cetz.draw.content("C-", text(fill: color.white, smallcaps[C-]))
  cetz.draw.content("D",  text(fill: color.white, smallcaps[D]))
  cetz.draw.content("F",  text(fill: color.white, smallcaps[F]))
  cetz.draw.content((A,       height + 0.25), text(size: 7.0pt)[93])
  cetz.draw.content((A_minus, height + 0.25), text(size: 7.0pt)[90])
  cetz.draw.content((B_plus,  height + 0.25), text(size: 7.0pt)[87])
  cetz.draw.content((B,       height + 0.25), text(size: 7.0pt)[83])
  cetz.draw.content((B_minus, height + 0.25), text(size: 7.0pt)[80])
  cetz.draw.content((C_plus,  height + 0.25), text(size: 7.0pt)[77])
  cetz.draw.content((C,       height + 0.25), text(size: 7.0pt)[73])
  cetz.draw.content((C_minus, height + 0.25), text(size: 7.0pt)[60])
  cetz.draw.content((D,       height + 0.25), text(size: 7.0pt)[50])
  // cetz.draw.content((F,       height + 0.25), text(size: 7.0pt)[0])
})
