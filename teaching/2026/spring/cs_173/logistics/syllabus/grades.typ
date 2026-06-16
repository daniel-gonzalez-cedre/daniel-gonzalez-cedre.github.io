#import "@local/colors:0.0.1": color

#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

// #let color_problem = color.dark.yellow
// #let color_exam = color.dark.red
// #let color_final = color.dark.purple
// #let color_holiday = color.dark.aqua

#let color_problem = color.blind.blue
#let color_exam    = color.blind.orange
#let color_final   = color.blind.red
#let color_holiday = color.blind.green
#let color_admin   = color.blind.purple

#let data_assignments = (
  // (smallcaps[Problem Sets] + linebreak() + "(" + smallcaps[lowest two dropped] + ")", 40),
  // (emph[max] + "(" + smallcaps[Midterm 1] + ", " + linebreak() + h(2.0em) + smallcaps[Midterm 2] + ")",    20),
  // (emph[max] + "(" + smallcaps[Final Exam] + ", " + linebreak() + h(3.0em) + emph[min] + "(" + smallcaps[Midterm 1] + "," + linebreak() + h(5.55em) + smallcaps[Midterm 2] + ")" + ")",    20),
  // (smallcaps[Final Exam],        20)
  (smallcaps[Problem Sets], 50),
  (smallcaps[Exam] + " 1",    10),
  (smallcaps[Exam] + " 2",    10),
  (smallcaps[Exam] + " 3",    10),
  (smallcaps[Final],        20)
)

#scale(
  x: 90.0%,
  y: 90.0%,
  reflow: true,
  cetz.canvas({
    let color_palette = (color_problem, color_exam, color_exam, color_exam, color_final)
    cetz-plot.chart.piechart(
      data_assignments,
      value-key: 1,
      label-key: 0,
      inner-radius: 1.5,
      radius: 4,
      // start: 90.0deg + 60.0deg,
      // stop: 450.0deg + 60.0deg,
      stroke: none,
      slice-style: color_palette,
      outset: 4,
      inner-label: (content: (value, label) => {
        align(center)[
          #text(fill: color.white)[#label \ #value / 100]
        ]
      }, radius: 100.0%),
      outer-label: (content: (value, label) => ""),
      legend: (label: none)
    )
  })
)
