(require 'org)
(require 'ox)
(require 'ox-publish)

(org-publish "notes-html" t)

(message "Finished publishing website!")
