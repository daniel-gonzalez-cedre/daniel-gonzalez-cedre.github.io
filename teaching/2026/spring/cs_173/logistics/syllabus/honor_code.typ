#import "@local/syllabus:0.0.1": *

#let sc = smallcaps
#figure(
  table(
    stroke: none,
    columns: 5,
    align: (col, row) => {
      if col == 0 {
        right
      } else {
        center
      }
    },
    fill: (col, row) => {
      if col == 1 and row == 1 {
        green
      } else if col == 2 and row == 1 {
        green
      } else if col == 3 and row == 1 {
        red
      } else if col == 4 and row == 1 {
        orange
      } else if col == 1 and row == 2 {
        red
      } else if col == 2 and row == 2 {
        yellow
      } else if col == 3 and row == 2 {
        red
      } else if col == 4 and row == 2 {
        red
      }
    },
    // align: (col, row) => {
    //   if col == 0 { left } else { center }
    // },
    // smallcaps[Lectures],    smallcaps[MWF], [4:00pm -- 4:50pm], [151 Loomis Laboratory],
    // smallcaps[Recitation],  smallcaps[TBD], smallcaps[TBD],     smallcaps[TBD],
    // table.hline(stroke: (dash: "dotted")),
    [~],            sc[colleagues],                    sc[resources],                  sc[solutions],                    sc[llm],
    sc[consulting], text(fill: white, sc[allowed]),    text(fill: white, sc[allowed]), text(fill: white, sc[forbidden]), text(fill: white, sc[discouraged]),
    sc[copying],    text(fill: white, sc[forbidden]),  text(fill: white, sc[cite]),    text(fill: white, sc[forbidden]), text(fill: white, sc[forbidden]),
  ),
  caption: [
    The rules of engagement.
  ]
)
