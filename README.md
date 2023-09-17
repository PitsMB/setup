## Setup

#### Resume creator
To create resume from tex format to PDF
```bash
docker build -t latex .
docker run --rm -i -v "$PWD":/data latex pdflatex mark_balagtas_resume.tex
```