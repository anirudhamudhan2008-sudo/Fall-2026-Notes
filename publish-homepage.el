(require 'org)
(require 'ox-html)

(setq org-html-head-include-default-style nil)
(setq org-html-head-include-scripts nil)
(setq org-html-head
      "<link rel=\"stylesheet\" href=\"css/style.css\" />")

(find-file "~/Documents/Fall-2026-Notes/README.org")
(let ((out (org-html-export-to-html)))
  (copy-file out "~/Documents/Fall-2026-Notes/docs/index.html" t))

(message "Homepage published!")
