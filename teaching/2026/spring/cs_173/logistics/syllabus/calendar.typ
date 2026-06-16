#import "@local/syllabus:0.0.1": *

// #let color_problem = color.dark.yellow
// #let color_exam = color.dark.red
// #let color_final = color.dark.purple
// #let color_holiday = color.dark.aqua

#let color_problem = color.blind.blue
#let color_exam    = color.blind.orange
#let color_final   = color.blind.red
#let color_holiday = color.blind.green
#let color_admin   = color.blind.purple

#let calendar(
  month,
  leap: false,
  offset: 0,
  start: 0,
  end: 31,
  holidays: (),
  problems: (),
  exams: (),
  finals: (),
  admin: (),
) = {
  let days = {
    if month in ("January", "March", "May", "July", "August", "October", "December") {
      31
    } else if month in ("April", "June", "September", "November") {
      30
    } else if month == "February" {
      if leap { 29 } else { 28 }
    }
  }
  [
    #emph(month)
    #v(- 8.0pt)
    #text(size: 9.0pt)[
      #grid(
        stroke: (col, row) => {
          let day = (col + 1) + (row - 1)*7 - offset
          if day in holidays + problems + exams + finals { white }
        },
        fill: (col, row) => {
          let day = (col + 1) + (row - 1)*7 - offset
          if day in holidays {
            color_holiday
          } else if day in problems {
            color_problem
          } else if day in exams {
            color_exam
          } else if day in finals {
            color_final
          } else {
          }
        },
        align: horizon + center,
        columns: (auto,)*7,
        rows: 1.4em,
        inset: 5.0pt,
        gutter: 0.0em,
        ..([su], [mo], [tu], [we], [th], [fr], [sa]).map(smallcaps),
        ..range(0, offset).map(n => {}),
        ..range(1, days + 1).map(n => {
          // let day = n + offset
          let day = str(n)
          let size = 7.0pt
          let fill = black
          if n in problems + exams + finals {
            fill = white
          } else if n in holidays {
            fill = opacity(white, 100.0%)
          } else if n in admin {
            fill = opacity(color_admin, 100.0%)
          } else if n < start or end < n or calc.rem(n, 7) in (7 - offset, 7 - offset + 1).map(x => calc.rem(x, 7)) {
            fill = opacity(black, 25.0%)
          }
          return text(size: size, fill: fill)[$day$]

          // return align(horizon + center)[$day$]
          // return move(dx: 0.0pt, dy: -0.5pt, $day$)
          // return move(dx: 0.0pt, dy: -1.0pt, $day$)
        }),
      )
    ]
  ]
}

// #let ps01 = datetime(year: 2026, month: 01, day: 26)
// #let ps02 = datetime(year: 2026, month: 02, day: 02)

#{
  set figure.caption(position: top)
  figure(
    grid(
      columns: 3,
      rows: 2,
      gutter: 24.0pt,
      [
        #calendar(
          "January",
          offset: 4,
          start: 20,
          holidays: (19,),
          problems: (25,),
          exams: (),
          // admin: (),
        )
      ],
      [
        #calendar(
          "February",
          offset: 0,
          holidays: (),
          problems: (1, 8, 15, 24,),
          exams: (27,),
          // admin: (),
        )
      ],
      [
        #calendar(
          "March",
          offset: 0,
          holidays: (6, 16, 17, 18, 19, 20,),
          problems: (23,),
          exams: (),
          // admin: (10,),
        )
      ],
      [
        #calendar(
          "April",
          offset: 3,
          holidays: (10,),
          problems: (1, 12, 19, 26,),
          exams: (3,),
          // admin: (),
        )
      ],
      [
        #calendar(
          "May",
          offset: 5,
          end: 6,
          holidays: (7,),
          problems: (),
          exams: (1,),
          finals: (13,),
          // admin: (22,),
        )
      ]
    ),
    caption: [
      Dates and events of interest. \
      // #hide[Fig. 1. ]#box(width: 1.0em, height: 1.0em, stroke: color.light.black, fill: color_holiday)[
      //   #align(horizon + center)[#text(fill: white)[?]]
      // ] $:=$ Holiday \
      #hide[Fig. 1.#h(0.4em)]#box(
        // baseline: 15.0%,
        baseline: 1.5pt,
        width: 1.0em,
        height: 1.0em,
        stroke: color_problem,
        fill: color_problem
      )[
        #align(horizon + center)[#text(size: 7.0pt, fill: white)[?]]
      ] ~Problem Set due date \
      #hide[Fig. 1.#h(0.4em)]#box(
        baseline: 1.5pt,
        width: 1.0em,
        height: 1.0em,
        stroke: color_exam,
        fill: color_exam
      )[
        #align(horizon + center)[#text(size: 7.0pt, fill: white)[?]]
      ] ~Midterm Exam date \
      #hide[Fig. 1.#h(0.4em)]#box(
        baseline: 1.5pt,
        width: 1.0em,
        height: 1.0em,
        stroke: color_final,
        fill: color_final
      )[
        #align(horizon + center)[#text(size: 7.0pt, fill: white)[?]]
      ] ~Final Exam date \
      #hide[Fig. 1.#h(0.4em)]#box(
        baseline: 1.5pt,
        width: 1.0em,
        height: 1.0em,
        stroke: color_holiday,
        fill: color_holiday
      )[
        #align(horizon + center)[#text(size: 7.0pt, fill: white)[?]]
      ] ~Holiday \
      // #hide[Fig. 1. ~]#box(width: 1.0em, height: 1.0em, stroke: white, fill: white)[
      //   #align(horizon + center)[#text(fill: opacity(color.light.black, 100.0%))[?]]
      // ] ~ Holiday \
      // #hide[Fig. 1. ]#box(width: 1.0em, height: 1.0em, stroke: white, fill: white)[
      //   #align(horizon + center)[#text(fill: color_admin)[?]]
      // ] $:=$ Administrative \
    ]
  )
}
