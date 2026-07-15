.PHONY: all html pdf clean serve

# Default target
all: html pdf

# HTML publishing
html:
	@echo "Publishing course pages..."
	emacs --batch -l ~/Documents/Fall-2026-Notes/publish.el \
	  --eval '(org-publish "notes-courses" t)'
	@echo "Publishing homepage..."
	emacs --batch -l ~/Documents/Fall-2026-Notes/publish-homepage.el
	@echo "HTML publishing complete!"

# PDF publishing
pdf:
	@echo "Publishing PDFs..."
	emacs --batch -l ~/Documents/Fall-2026-Notes/publish.el \
	  --eval '(org-publish "notes-pdf" t)'
	@echo "PDF publishing complete!"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf docs/Courses/*/index.html
	rm -rf PDFs/Courses/*/index.pdf
	rm -f docs/index.html
	@echo "Clean complete!"

# Publish and serve locally
publish: all
	@echo "Starting local server..."
	cd docs && python3 -m http.server 8000
