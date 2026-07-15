(require 'org)
(require 'ox)
(require 'ox-publish)

;; Don't use Org's built-in CSS
(setq org-html-head-include-default-style nil)
(setq org-html-head-include-scripts nil)

;; Use our stylesheet
(setq org-html-head
      "<link rel=\"stylesheet\" href=\"../css/style.css\" />")

;; Define publishing projects
(setq org-publish-project-alist
      '(
        ;; Course pages: publish Courses/**/*.org
        ("notes-courses"
         :base-directory "~/Documents/Fall-2026-Notes/Courses"
         :publishing-directory "~/Documents/Fall-2026-Notes/docs/Courses"
         :base-extension "org"
         :publishing-function org-html-publish-to-html
         :recursive t)

        ;; PDF publishing
        ("notes-pdf"
         :base-directory "~/Documents/Fall-2026-Notes"
         :publishing-directory "~/Documents/Fall-2026-Notes/PDFs"
         :base-extension "org"
         :publishing-function org-latex-publish-to-pdf
         :recursive t
         :exclude "README\\.org")

        ;; CSS publishing
        ("notes-css"
         :base-directory "~/Documents/Fall-2026-Notes/docs/css"
         :publishing-directory "~/Documents/Fall-2026-Notes/docs/css"
         :base-extension "css"
         :publishing-function org-publish-attachment)

        ;; Combined project
        ("notes" :components ("notes-courses" "notes-pdf" "notes-css"))
      ))

;; Export settings
(setq org-export-with-toc t)
(setq org-export-with-section-numbers t)
(setq org-export-with-author "Anirudh Amudhan")
(setq org-export-with-date t)

;; PDF export settings with LaTeX packages for chemistry/biology
(setq org-latex-pdf-process
      '("pdflatex -interaction=nonstopmode -output-directory=%o %f"
        "pdflatex -interaction=nonstopmode -output-directory=%o %f"))

;; LaTeX class with chemistry/biology packages
(setq org-latex-classes
      '(("article"
         "\\documentclass[11pt]{article}
\\usepackage{mhchem}
\\usepackage{chemfig}
\\usepackage{tikz}
\\usepackage{amsmath}
\\usepackage{graphicx}
\\usepackage{hyperref}
\\usepackage[margin=1in]{geometry}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

;; Set default LaTeX class
(setq org-latex-default-class "article")

(message "Publishing projects configured!")
