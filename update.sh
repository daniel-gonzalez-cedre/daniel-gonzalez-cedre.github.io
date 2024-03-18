# 2024 SPRING DISCRETE MATH
cd 2024spring

  # SYLLABUS PDF
  cp -v ~/academia/pedagogy/2024-spring-discrete-math/syllabus/syllabus.pdf ./

  # LECTURE NOTE PDF
  cp -v ~/academia/pedagogy/book-discrete-math/discrete-math.pdf ./lecture-notes.pdf

  # PROBLEM SET PDFs & TeX FILES
  cp -v ~/academia/pedagogy/2024-spring-discrete-math/problem-sets/problem-set-*/problem-set-*.pdf ./problem-sets/
  cp -v ~/academia/pedagogy/2024-spring-discrete-math/problem-sets/problem-set-*/problem-set-*.tex ./tex/
  cp -v ~/academia/pedagogy/2024-spring-discrete-math/exams/exam-*.p.*/exam-*.p.*.pdf ./exams/

  # LaTeX PREAMBLES
  rm -v ./LaTeX.zip
  mkdir -v ./LaTeX
  mkdir -v ./LaTeX/preambles
  cp -vr ~/LaTeX/preambles ./LaTeX/
  cp -v ~/LaTeX/config_ps.tex ./LaTeX/config.tex
  # rm -v ./LaTeX/preambles/backup_*.tex
  # rm -v ./LaTeX/preambles/_*.tex
  rm -vr ./LaTeX/preambles/backup

  zip -vr LaTeX.zip ./LaTeX -X
  rm -rf LaTeX

cd ..

# GENERAL WEBSITE
python3 ./update.py

# git add ./spring2024/problem-sets
# git commit -a
