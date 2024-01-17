cp -v ~/academia/pedagogy/2024-spring-discrete-math/syllabus/syllabus.pdf ./

cp -v ~/academia/pedagogy/book-discrete-math/discrete-math.pdf ./lecture-notes.pdf
cp -v ~/academia/pedagogy/2024-spring-discrete-math/problem-sets/problem-set-*/problem-set-*.pdf ./problem-sets/

cp -v ~/academia/pedagogy/2024-spring-discrete-math/problem-sets/problem-set-*/problem-set-*.tex ./tex/

cp -vr ~/LaTeX/preambles ./LaTeX/
cp -v ~/LaTeX/templates/tufte_problem-set/config.tex ./LaTeX/
rm -v ./LaTeX/preambles/backup_*.tex
zip -vr LaTeX.zip ./LaTeX -X

rm -rf LaTeX
