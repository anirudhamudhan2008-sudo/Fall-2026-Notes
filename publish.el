(require 'org)
(require 'ox)
(require 'ox-publish)
(require 'ox-latex)

(org-publish "notes-html" t)
(org-publish "notes-pdf" t)

(message "Finished publishing notes!")
