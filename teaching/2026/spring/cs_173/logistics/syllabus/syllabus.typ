#import "@local/syllabus:0.0.1": *

#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

#import "@preview/metalogo:1.2.0": LaTeX

// #import cetz.draw: content, line, rect

#show: syllabus.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  code: "CS173",
  semester: "Spring 2026",
)

#abstract[
  This course is an introduction to the study of _computation._
  The objective is to cultivate the mathematical maturity and frame-of-mind characteristic of a computer scientist.
  This involves fluency in the first-order logic, an understanding of axiomatic deductive argumentation, a cultivation of the ability to write proofs, and deep knowledge of fundamental topics like set theory, arithmetic, induction, recursively defined structures, and the relative cardinalities of finite and infinite sets.
]

= Schedule
Lectures will be held on Mondays, Wednesdays, and Fridays from 4:00 #smallcaps[pm] to 4:50 #smallcaps[pm] in 151 Loomis Laboratory.#marginalis[Lectures will be recorded and then linked to from the course website.]

// == Calendar
#include "calendar.typ"

= Resources

== Website
The course website can be found at #hyperlink("https://cs173.tech", "cs173.tech").
It contains all of the information relevant to the course, including lecture notes, problem sets, solutions, staff contacts, office hours, this syllabus, and more.#marginalis[
  There is no required textbook for this class.
  The instructor is preparing lecture notes, which will be continually updated as the semester progresses and published on the course website.
]

== Slack
The course Slack server, located at #hyperlink("https://uiuc-cs173.slack.com", "uiuc-cs173.slack.com"), will be the primary medium for announcements, questions, discussions, and all other basic communication between staff and students.

// We will use Slack as the primary medium of communication between students and staff, and we encourage students to use it to communicate with each other.

= Grading

#fullwidth[
  #figure(
    include "rubric.typ",
    caption: [
      The scale for determining letter grades.
      Final grades are rounded up to the next integer.
    ]
  )
]
#v(- 2.0em)
#{
  set figure.caption(position: top)
  figure(
    include "grades.typ",
    caption: [
      Breakdown of grades by type.
      // The lowest two problem sets are dropped.
      // If the final exam score is greater than either midterm score, the lower midterm score will be replaced by the final exam score.
    ]
  )
}

= Assignments

== Problem Sets
There will be roughly 10 graded problem sets#marginalis[... in addition to the first problem set #mono[ps00], which will be ungraded...] throughout the semester.
Problem sets will be assigned weekly and due on Sundays at 11:59 #smallcaps[pm] unless there was an exam the preceding week.
The lowest 2 out of the 10 graded problem sets will be dropped when computing overall grades.
Late work will not be accepted.#marginalis[If you have an extenuating circumstance, please contact the instructor.]

Problem sets will be submitted through #hyperlink("https://www.gradescope.com/courses/1231759", "Gradescope").
You may choose to handwrite#marginalis[
  Make sure your handwriting is professional and your work is well-organized.
] or typeset#marginalis[
  #text(fill: color.blind.blue)[#link("https://www.overleaf.com/", [#LaTeX])]
  and
  #hyperlink("https://typst.app/", "Typst")
  are the standard tools for typesetting academic documents.
] your submission.
Submitted assignments _*must*_ have questions assigned to pages.
Submissions that fail to assign questions to pages _will be penalized_ for the inconvenience to our graders.

Work that is illegible, unorganized, or otherwise unprofessional will be penalized at the sole discretion of the grader.
We aim to return your graded feedback within one week of the submission deadline.

// === Regrades

== Midterm Exams
There will be three midterm exams spaced throughout the semester.
All midterm exams will be administered in class during the regularly-scheduled class time.
You are allowed one sheet#marginalis[
  standard #mono[8.5x11] or #mono[A4] size
]#marginalis[
  front-and-back
] of _handwritten_#marginalis[
  Printed, digital, and typeset notes are _not allowed;_ notes must be physically written on paper by hand.
] notes for midterm exams.
// ; two sheets will be allowed for the final exam.

== Final Exam
There will be a cumulative final exam on the #displaydate(datetime(year: 2026, month: 05, day: 13), year: false).
The final will be administered between the hours of 1:30 #smallcaps[pm] and 4:30 #smallcaps[pm].
The location of the final exam has not yet been determined.
You are allowed two sheets#marginalis[
  standard #mono[8.5x11] or #mono[A4] size
]#marginalis[
  front-and-back
] of _handwritten_#marginalis[
  Printed, digital, and typeset notes are _not allowed;_ notes must be physically written on paper by hand.
] notes for the final exam.

If the numerical score#marginalis[
  measured out of 100 points
] of the final exam is greater than the lowest numerical score#marginalis[
  measured out of 100 points
] of any of the individual midterm exams, then the score from the final exam will replace the lowest midterm score.#marginalis[
  In the case of a tie, the final score will only replace one midterm score.
]

= Honor Code
#include "honor_code.typ"

#linebreak()

See the #hyperlink("https://studentcode.illinois.edu/article1/part4/1-401", "student code") for general university guidelines and detailed information on #hyperlink("https://studentcode.illinois.edu/article1/part4/1-402", "academic integrity") for students.

// You are encouraged to collaborate with your classmates and seek help from course staff 

// = Accommodations

// == Regrade Requests
// If you feel that an error has been made 

