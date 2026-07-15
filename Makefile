.PHONY: all html pdf clean serve

# Default target
all: html pdf

# HTML publishing
html:
	@echo "Publishing HTML..."
	emacs --batch -l ~/Documents/Fall-2026-Notes/publish.el \
	  --eval '(org-publish "notes-html" t)'
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

# Start Emacs server for publishing
serve:
	emacs --daemon &
	@echo "Emacs server started!"

# Publish and serve locally
publish: all
	@echo "Starting local server..."
	cd docs && python3 -m http.server 8000
