(require 'org)
(require 'ox)
(require 'ox-publish)

;; Don't use Org's built-in CSS
(setq org-html-head-include-default-style nil)
(setq org-html-head-include-scripts nil)

;; Use our stylesheet
(setq org-html-head
      "<link rel=\"stylesheet\" href=\"/Fall-2026-Notes/css/style.css\" />")

(org-publish "notes-html" t)

(message "Finished publishing website!")
