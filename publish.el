(require 'org)
(require 'ox)
(require 'ox-publish)

(setq org-html-head
      "<link rel=\"stylesheet\" href=\"../../css/style.css\">")

(org-publish "notes-html" t)

(message "Finished publishing website!")
