#!/bin/bash
# R3 Commons Site Builder
# Converts content.org to index.html using Emacs org-mode

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "🔧 Building R3 Commons site..."

# Check if emacs is available
if ! command -v emacs &> /dev/null; then
    echo "❌ Error: Emacs is required but not installed."
    exit 1
fi

# Check if content.org exists
if [ ! -f "content.org" ]; then
    echo "❌ Error: content.org not found."
    echo "   Create content.org with your site content."
    exit 1
fi

# Clear org publish cache to force rebuild
rm -rf ~/.org-timestamps/

# Run Emacs in batch mode to publish
emacs --batch \
    --eval "(require 'org)" \
    --eval "(require 'ox-html)" \
    -l publish.el \
    -f r3/publish \
    2>&1 | grep -v "^Loading"

# Check if content.html was generated
if [ ! -f "content.html" ]; then
    echo "❌ Build failed: content.html not generated"
    exit 1
fi

# Post-process the HTML to fix structure
python3 << 'PYTHON_SCRIPT'
import re

with open('content.html', 'r') as f:
    html = f.read()

# Remove org-generated timestamp comment
html = re.sub(r'<!-- \d{4}-\d{2}-\d{2} \w+ \d{2}:\d{2} -->\n?', '', html)

# Remove meta generator tag
html = re.sub(r'<meta name="generator" content="Org Mode" />\n?', '', html)

# Fix the preamble wrapper - remove the wrapper div
html = re.sub(
    r'<header id="preamble" class="status">(.*?)</header>\s*<main id="content" class="content">',
    r'\1',
    html,
    flags=re.DOTALL
)

# Fix the postamble - it should just be the footer content
html = re.sub(
    r'<footer id="postamble" class="status">\s*</main>',
    '</main>',
    html,
    flags=re.DOTALL
)

# Add favicon and description meta tags
html = html.replace(
    '<link rel="stylesheet" href="style.css">',
    '''<link rel="stylesheet" href="style.css">
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📡</text></svg>">
<meta name="description" content="Open tools for hard times and clear nights. Local-first tech, community-first mission.">'''
)

# Clean up outline container IDs
html = re.sub(r'id="outline-container-(\w+)"', r'id="\1-section"', html)
html = re.sub(r'class="outline-2 ', r'class="', html)
html = re.sub(r'class="outline-text-2"', r'', html)
html = re.sub(r'<div\s+id="text-\w+">', r'<div class="section-content">', html)

# Add the footer before closing body
footer = '''
<footer class="footer">
  <div class="container">
    <p class="footer-brand">R3 Commons Foundation</p>
    <p class="footer-tagline">Open tools for hard times and clear nights.</p>
    <p class="footer-legal">All outputs open: CERN-OHL (hardware) · CC BY-SA (content) · Apache/MIT (software)</p>
    <p class="footer-inspiration">"Somewhere, something incredible is waiting to be known." — Carl Sagan</p>
  </div>
</footer>
'''

html = html.replace('</body>', footer + '</body>')

with open('content.html', 'w') as f:
    f.write(html)

print("   HTML post-processing complete")
PYTHON_SCRIPT

mv content.html index.html
echo "✅ Site built successfully!"
echo "   Output: index.html"
echo ""
echo "📡 Preview locally:"
echo "   python3 -m http.server 8000"
