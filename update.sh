cd teaching

  # PRINCIPLES OF COMPUTING

  # DISCRETE MATH
  # cd 2024spring
    # # SYLLABUS PDF
      # cp -v ~/academia/pedagogy/2024_spring_discrete-math/syllabus/syllabus.pdf ./

    # # LECTURE NOTE PDF
      # cp -v ~/academia/pedagogy/book_discrete-math/discrete-math.pdf ./lecture-notes.pdf

    # # PROBLEM SET PDFs & TeX FILES
      # cp -v ~/academia/pedagogy/2024_spring_discrete-math/problem-sets/problem-set-*/problem-set-*.pdf ./problem-sets/
      # cp -v ~/academia/pedagogy/2024_spring_discrete-math/problem-sets/problem-set-*/problem-set-*.tex ./tex/
      # cp -v ~/academia/pedagogy/2024_spring_discrete-math/exams/exam-*.p.*/exam-*.p.*.pdf ./exams/
  # cd ..

  # LaTeX PREAMBLES
    # mkdir -v ./LaTeX
    # mkdir -v ./LaTeX/preambles
    # cp -vr ~/LaTeX/preambles ./LaTeX/
    # cp -v ~/LaTeX/config_students.tex ./LaTeX/config.tex
    # rm -vr ./LaTeX/preambles/backup

  # LaTeX CLEANUP
    # rm -v ./LaTeX.zip
    # zip -vr LaTeX.zip ./LaTeX -X
    # rm -rf LaTeX

cd ..

# GENERAL WEBSITE
python3 ./update.py

# git commit -a
