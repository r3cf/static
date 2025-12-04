;;; publish.el --- R3 Commons site generator using org-mode -*- lexical-binding: t; -*-

;; Run with: emacs --batch -l publish.el -f r3/publish

(require 'ox-html)
(require 'ox-publish)

;; Disable backup files during publish
(setq make-backup-files nil)

;; Project root directory
(defvar r3/project-root (file-name-directory (or load-file-name buffer-file-name)))

;; Custom HTML head (CSS + favicon)
(defvar r3/html-head
  "<link rel=\"stylesheet\" href=\"style.css\">
<link rel=\"icon\" href=\"data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📡</text></svg>\">
<meta name=\"description\" content=\"Open tools for hard times and clear nights. Local-first tech, community-first mission.\">")

;; HTML preamble (hero + nav)
(defvar r3/html-preamble
  "<header class=\"hero\">
  <div class=\"container\">
    <img src=\"r3commons-mission-logo.png\" alt=\"R3 Commons\" class=\"hero-logo\">
    <h1>R3 COMMONS</h1>
    <p class=\"subtitle\">RADIO · ROBOTICS · RESEARCH</p>
    <p class=\"tagline\">Open tools for hard times and clear nights.</p>
    <p class=\"hero-quote\">\"The cosmos is within us. We are made of star-stuff.\" — Carl Sagan</p>
  </div>
</header>

<nav class=\"nav\">
  <div class=\"container\">
    <a href=\"#manifesto\">Manifesto</a>
    <a href=\"#mission\">Mission</a>
    <a href=\"#pillars\">Pillars</a>
    <a href=\"#projects\">Projects</a>
    <a href=\"#get-involved\">Get Involved</a>
  </div>
</nav>
<main>")

;; HTML postamble (close main + footer)
(defvar r3/html-postamble
  "</main>
<footer class=\"footer\">
  <div class=\"container\">
    <p class=\"footer-brand\">R3 Commons Foundation</p>
    <p class=\"footer-tagline\">Open tools for hard times and clear nights.</p>
    <p class=\"footer-legal\">All outputs open: CERN-OHL (hardware) · CC BY-SA (content) · Apache/MIT (software)</p>
    <p class=\"footer-inspiration\">\"Somewhere, something incredible is waiting to be known.\" — Carl Sagan</p>
  </div>
</footer>")

;; Configure org export settings
(setq org-html-doctype "html5"
      org-html-html5-fancy t
      org-html-head-include-default-style nil
      org-html-head-include-scripts nil
      org-html-validation-link nil
      org-html-self-link-headlines nil
      org-export-with-toc nil
      org-export-with-section-numbers nil
      org-export-with-author nil
      org-export-with-creator nil
      org-export-with-date nil
      org-export-time-stamp-file nil
      org-export-with-title nil
      org-export-headline-levels 4
      org-html-container-element "section"
      org-html-divs '((preamble "header" "preamble")
                      (content "main" "content")
                      (postamble "footer" "postamble")))

;; Publishing project configuration
(setq org-publish-project-alist
      `(("r3-site"
         :base-directory ,r3/project-root
         :base-extension "org"
         :publishing-directory ,r3/project-root
         :publishing-function org-html-publish-to-html
         :exclude ".*"
         :include ("content.org")
         :html-head ,r3/html-head
         :html-preamble ,r3/html-preamble
         :html-postamble ,r3/html-postamble
         :with-toc nil
         :section-numbers nil)))

(defun r3/publish ()
  "Publish the R3 Commons site."
  (interactive)
  (message "Publishing R3 Commons site...")
  (let ((org-publish-use-timestamps-flag nil))
    (org-publish "r3-site" t))
  (message "Done! Site published."))

;; Allow running from command line
(when noninteractive
  (r3/publish))

(provide 'publish)
;;; publish.el ends here
