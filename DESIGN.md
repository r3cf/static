# R3 Commons Design System

## Overview

The R3 Commons website uses a **Neo-Brutalist** design aesthetic combined with **space/sky** and **machine/tech** visual elements. The design emphasizes bold typography, hard edges, strong color blocks, and intentional rawness while incorporating inspirational themes of exploration and making.

---

## Color Palette

| Name | Hex | CSS Variable | Usage |
|------|-----|--------------|-------|
| Night Sky Indigo | `#1A1F3D` | `--color-night` | Primary color, headers, Research pillar, dark backgrounds |
| Signal Orange | `#FF8C00` | `--color-signal` | Accent/action color, CTAs, Radio pillar, highlights |
| Maker Green | `#4CAF50` | `--color-maker` | Secondary accent, Robotics pillar, success states |
| Blueprint Blue Light | `#E3E9F2` | `--color-blueprint` | Light backgrounds, technical elements |
| Blueprint Blue Dark | `#B0C4DE` | `--color-blueprint-dark` | Lines, secondary text on dark |
| Background | `#FAFBFD` | `--color-bg` | Main page background |
| Black | `#0D0D0D` | `--color-black` | Text, borders, shadows |
| Star Yellow | `#ffeaa7` | `--color-star` | Star field accents |
| Twilight | `#252B4A` | `--color-twilight` | Gradient dark backgrounds |

### Pillar Color Mapping

- **Radio** (Signals & Comms) → Signal Orange `#FF8C00`
- **Robotics** (Machines & Making) → Maker Green `#4CAF50`
- **Research** (Sky & Science) → Night Sky Indigo `#1A1F3D`

---

## Typography

### Font Stack

```css
--font-main: 'Montserrat', 'Arial Black', sans-serif;  /* Headers */
--font-body: 'Roboto', 'Arial', sans-serif;            /* Body text */
--font-mono: 'Roboto Mono', 'Courier New', monospace;  /* Code, technical */
```

### Usage

| Element | Font | Weight | Style |
|---------|------|--------|-------|
| H1 (Hero) | Montserrat | 900 | Uppercase, text-shadow |
| H2 (Section) | Montserrat | 900 | Uppercase, underline accent |
| H3 (Cards) | Montserrat | 700 | Uppercase |
| Body | Roboto | 400 | Normal |
| Lead text | Roboto | 400-600 | Larger size |
| Navigation | Montserrat | 600 | Uppercase, letter-spacing |
| Code/Tags | Roboto Mono | 500-700 | Uppercase |

### Sizing

- Hero H1: `clamp(2.5rem, 10vw, 5rem)`
- Section H2: `clamp(1.8rem, 5vw, 3rem)`
- Body: `18px` base
- Lead: `1.35rem`

---

## Neo-Brutalist Elements

### Borders

```css
--border: 3px solid #0D0D0D;
--border-thick: 5px solid #0D0D0D;
```

### Shadows

Hard drop shadows with no blur, offset black:

```css
--shadow: 6px 6px 0 #0D0D0D;
--shadow-sm: 4px 4px 0 #0D0D0D;
```

### Hover Effects

Cards shift up and left on hover, shadow grows:

```css
.card:hover {
  transform: translate(-3px, -3px);
  box-shadow: 9px 9px 0 #0D0D0D;
}
```

### Corner Brackets

Machine-style corner brackets on pillar cards (pseudo-elements):

```css
.pillar::before {
  /* Top-left bracket */
  border-width: 3px 0 0 3px;
}
.pillar::after {
  /* Bottom-right bracket */
  border-width: 0 3px 3px 0;
}
```

---

## Space & Sky Elements

### Star Field (Hero)

CSS-only twinkling stars using radial gradients:

```css
background-image:
  radial-gradient(2px 2px at 20px 30px, #ffeaa7, transparent),
  radial-gradient(1px 1px at 90px 40px, #ffeaa7, transparent),
  /* ... more stars ... */
```

Animation:
```css
@keyframes twinkle {
  0% { opacity: 0.7; }
  100% { opacity: 1; }
}
```

### Horizon Glow

Gradient at bottom of hero suggesting dawn/dusk:

```css
background: linear-gradient(to top,
  rgba(255, 140, 0, 0.15) 0%,    /* Orange glow */
  rgba(76, 175, 80, 0.08) 50%,   /* Green tint */
  transparent 100%
);
```

### Grid Pattern

Subtle technical grid on dark sections:

```css
background-image:
  linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px),
  linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px);
background-size: 50px 50px;
```

---

## Machine & Tech Elements

### Signal Indicator

Blinking dot in hero subtitle:

```css
.hero .subtitle::before {
  content: '';
  width: 8px;
  height: 8px;
  background: #FF8C00;
  border-radius: 50%;
  box-shadow: 0 0 8px #FF8C00;
  animation: blink 1.5s ease-in-out infinite;
}
```

### Terminal-Style Navigation

Command prompt style with `>` prefix on hover:

```css
.nav a::before {
  content: '>';
  font-family: monospace;
  opacity: 0;
}
.nav a:hover::before {
  opacity: 1;
}
```

### Terminal Prompt

`$` prefix on principles:

```css
.principle::before {
  content: '$';
  font-family: monospace;
  color: #FF8C00;
}
```

### Status Badges

"ACTIVE" indicator on project cards:

```css
.project::before {
  content: 'ACTIVE';
  font-family: monospace;
  font-size: 0.6rem;
  background: #4CAF50;
}
```

### Code-Style Tags

Comment prefix on taglines:

```css
.tag::before {
  content: '//';
  color: #FF8C00;
}
```

---

## Layout

### Container

```css
--max-width: 1200px;
--spacing: 2rem;

.container {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 0 var(--spacing);
}
```

### Sections

- Centered content with flexbox
- Horizontal padding for edge spacing
- Thick black bottom border between sections
- Alternating backgrounds (`--color-bg` / `--color-blueprint`)

### Grids

Responsive auto-fit grids:

```css
.pillars-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
  gap: 2rem;
}
```

---

## Component Styles

### Pillar Cards

- Thick black border with colored left accent (8px)
- Gradient background tinted to pillar color
- Corner bracket decorations
- Hover lift effect
- Left-aligned content

### Project Cards

- Top color bar (8px)
- "ACTIVE" status badge
- Smaller shadow than pillars
- Left-aligned content

### Involvement Cards

- Full background color (Orange, Green, Blueprint)
- High contrast text
- Hover lift with light shadow

### Licenses Box

Terminal-style dark box:

```css
.licenses {
  background: #1A1F3D;
  color: #E3E9F2;
  border: 2px solid #FF8C00;
  font-family: monospace;
}
```

---

## Special Sections

### Manifesto

- Orange gradient background (`#FF8C00` → `#FF9F40`)
- Large decorative quotation mark (12rem, opacity 0.1)
- Bold lead text

### Get Involved

- Night sky gradient background
- Grid pattern overlay
- Bright colored cards for CTAs

### Footer

- Black background
- Three-color top stripe (Orange | Green | Indigo)
- Centered content
- Signal orange tagline

---

## Responsive Behavior

### Breakpoint: 768px

```css
@media (max-width: 768px) {
  --spacing: 1.25rem;

  /* Single column grids */
  .pillars-grid,
  .projects-grid {
    grid-template-columns: 1fr;
  }

  /* Smaller shadows */
  .pillar { box-shadow: var(--shadow-sm); }

  /* Centered nav */
  .nav .container { justify-content: center; }
}
```

---

## Selection Style

```css
::selection {
  background: #FF8C00;
  color: #0D0D0D;
}
```

---

## Logo

File: `r3commons-mission-logo.png`

Placement: Hero section, centered, 120px width (80px on mobile)

---

## Design Principles

1. **Bold & Unapologetic** - Thick borders, hard shadows, strong colors
2. **Centered & Balanced** - Content flows from center, grids provide structure
3. **Technical but Human** - Machine aesthetics (brackets, terminals) balanced with inspirational sky themes
4. **Three-Pillar Identity** - Orange/Green/Indigo consistently represent Radio/Robotics/Research
5. **Readable Cards** - Left-aligned text in cards for easy scanning
6. **No Rounded Corners** - Everything sharp and rectangular
7. **Intentional Contrast** - Dark sections (hero, get-involved) alternate with light sections

---

## Deployment: Cloudflare Pages

Cloudflare Pages is a free static site hosting platform with global CDN, automatic HTTPS, and Git integration. This project uses a "pre-build" approach—you build locally and commit the generated HTML.

### Prerequisites

Before starting, ensure you have:

1. **GitHub Account** — Your repository needs to be on GitHub (or GitLab)
2. **Cloudflare Account** — Free tier at [dash.cloudflare.com](https://dash.cloudflare.com)
3. **Emacs** — For building from org-mode source
   - macOS: `brew install emacs`
   - Ubuntu: `sudo apt install emacs-nox`
4. **Python 3** — For local preview server (usually pre-installed)

### Project Structure

```
r3commons_site/
├── index.html              # Generated HTML (commit this!)
├── style.css               # Stylesheet
├── content.org             # Source content (edit this)
├── publish.el              # Emacs export config
├── build.sh                # Build script
├── 404.html                # Custom error page
├── r3commons-mission-logo.png
├── _headers                # Cloudflare security headers
├── _redirects              # Redirect rules
├── robots.txt              # SEO config
└── DESIGN.md               # This file
```

---

### Step 1: Push Your Repository to GitHub

If not already on GitHub:

```bash
# Initialize git (if needed)
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial R3 Commons site"

# Create repo on GitHub, then:
git remote add origin https://github.com/YOUR_USERNAME/r3commons_site.git
git branch -M main
git push -u origin main
```

---

### Step 2: Build the Site Locally

Before deploying, build the HTML from org-mode source:

```bash
# Make build script executable (first time only)
chmod +x build.sh

# Build the site
./build.sh
```

**What this does:**
1. Runs Emacs in batch mode to export `content.org` → HTML
2. Applies Python post-processing to inject footer and clean up structure
3. Outputs final `index.html`

**Verify locally before deploying:**

```bash
python3 -m http.server 8000
```

Open http://localhost:8000 in your browser. Check that:
- All sections display correctly
- Navigation links work
- Logo appears in hero
- Styles load properly

---

### Step 3: Commit Generated Files

```bash
# Stage all site files
git add index.html style.css 404.html _headers _redirects robots.txt r3commons-mission-logo.png

# Commit
git commit -m "Build site for deployment"

# Push to GitHub
git push
```

**Important:** You must commit `index.html` (the generated file), not just `content.org`. Cloudflare serves files directly—no build happens on their servers.

---

### Step 4: Create Cloudflare Account

1. Go to [dash.cloudflare.com](https://dash.cloudflare.com)
2. Click **Sign Up** (or log in if you have an account)
3. Verify your email address
4. You'll land on the Cloudflare dashboard

**Note:** Free tier includes unlimited sites, bandwidth, and requests for Pages.

---

### Step 5: Connect GitHub to Cloudflare

1. In Cloudflare dashboard, click **Workers & Pages** in the left sidebar
2. Click the blue **Create** button
3. Select the **Pages** tab
4. Click **Connect to Git**

**First-time GitHub connection:**

5. Click **Connect GitHub**
6. A popup opens—sign in to GitHub if prompted
7. Click **Authorize Cloudflare Pages**
8. Choose which repositories Cloudflare can access:
   - **All repositories** — Easiest option
   - **Only select repositories** — Choose `r3commons_site`
9. Click **Install & Authorize**

---

### Step 6: Select Repository and Branch

After authorization, you'll see a list of your repositories:

1. Find and click **r3commons_site** (or your repo name)
2. Click **Begin setup**

**Configure project:**

| Field | Value |
|-------|-------|
| Project name | `r3commons` (or any name—becomes your `*.pages.dev` subdomain) |
| Production branch | `main` |

---

### Step 7: Configure Build Settings

This is the key step. Since we pre-build locally, tell Cloudflare to serve files as-is:

**Framework preset:** Select `None`

**Build settings:**

| Setting | Value |
|---------|-------|
| Build command | *(leave completely empty)* |
| Build output directory | `/` |
| Root directory | *(leave empty)* |

**Environment variables:** None needed

Click **Save and Deploy**

---

### Step 8: Wait for Deployment

Cloudflare will:
1. Clone your repository
2. Skip build (since no build command)
3. Deploy all files to their global CDN

This takes 30-60 seconds. You'll see:
- "Initializing build environment"
- "Cloning git repository"
- "Build skipped"
- "Deploying to Cloudflare's global network"
- **"Success"** with a green checkmark

---

### Step 9: Access Your Site

After deployment succeeds:

1. Click **Continue to project**
2. Find your site URL: `https://r3commons.pages.dev` (or your chosen project name)
3. Click the URL to open your live site

**Your site is now live on Cloudflare's global CDN with:**
- Automatic HTTPS
- Global edge caching
- DDoS protection
- Unlimited bandwidth

---

### Step 10: Configure Custom Domain (Optional)

To use your own domain (e.g., `r3commons.org`):

**If domain is NOT on Cloudflare DNS:**

1. Go to your Pages project → **Custom domains** tab
2. Click **Set up a custom domain**
3. Enter your domain: `r3commons.org`
4. Cloudflare shows DNS records to add at your registrar:
   ```
   Type: CNAME
   Name: @ (or r3commons.org)
   Target: r3commons.pages.dev
   ```
5. Add these records at your domain registrar (GoDaddy, Namecheap, etc.)
6. Wait for DNS propagation (can take up to 48 hours, usually faster)
7. Cloudflare automatically provisions SSL certificate

**If domain IS on Cloudflare DNS (recommended):**

1. Go to your Pages project → **Custom domains** tab
2. Click **Set up a custom domain**
3. Enter your domain: `r3commons.org`
4. Cloudflare automatically adds DNS records
5. SSL certificate provisions in ~15 minutes

**Add www subdomain:**
- Repeat for `www.r3commons.org`
- Or add a redirect in `_redirects`:
  ```
  https://www.r3commons.org/* https://r3commons.org/:splat 301
  ```

---

### Step 11: Verify Security Headers

The `_headers` file in your repo configures HTTP headers:

```
/*
  X-Frame-Options: DENY
  X-Content-Type-Options: nosniff
  Referrer-Policy: strict-origin-when-cross-origin
  Permissions-Policy: geolocation=(), microphone=(), camera=()
```

**Test your headers:**

1. Go to https://securityheaders.com
2. Enter your site URL
3. You should see A or A+ grade

**What these headers do:**
- `X-Frame-Options: DENY` — Prevents clickjacking (site can't be embedded in iframes)
- `X-Content-Type-Options: nosniff` — Prevents MIME-type sniffing attacks
- `Referrer-Policy` — Controls what info is sent when clicking links
- `Permissions-Policy` — Disables access to camera, microphone, geolocation

---

### Step 12: Enable Web Analytics (Optional)

Cloudflare offers free, privacy-focused analytics:

1. In Cloudflare dashboard, go to **Analytics & Logs** → **Web Analytics**
2. Click **Add a site**
3. Enter your domain
4. Choose **Automatic setup** (for Pages projects, this is automatic)
5. View traffic data in the Web Analytics dashboard

No cookies, no personal data collection, GDPR compliant.

---

## Deployment Architecture

```
┌─────────────────┐     ┌──────────────┐     ┌─────────────────┐
│  Your Computer  │────▶│    GitHub    │────▶│ Cloudflare CDN  │
│                 │push │              │auto │                 │
│  content.org    │     │ index.html   │────▶│  Edge Servers   │
│  build.sh       │     │ style.css    │     │  (worldwide)    │
│       ↓         │     │ 404.html     │     │                 │
│  index.html     │     │ _headers     │     │  r3commons.org  │
└─────────────────┘     └──────────────┘     └─────────────────┘
```

**Flow:**
1. Edit `content.org` locally
2. Run `./build.sh` to generate `index.html`
3. Commit and push to GitHub
4. Cloudflare auto-detects push, deploys in ~30 seconds
5. Site updates globally on CDN edge servers

---

## Updating Content

### Workflow

1. **Edit** `content.org` in your text editor or Emacs
2. **Build** with `./build.sh`
3. **Preview** with `python3 -m http.server 8000`
4. **Commit & Push** to deploy

```bash
# Quick deploy
./build.sh && git add -A && git commit -m "Update content" && git push
```

Cloudflare Pages auto-deploys on push (typically < 1 minute).

### Editing Tips

- Section headings in `content.org` use `* Heading` with `CUSTOM_ID` properties
- HTML grids use `#+BEGIN_EXPORT html` blocks
- Rebuild after any change to see updates

---

## Troubleshooting

### Build fails with "emacs not found"

Install Emacs:
- **macOS:** `brew install emacs`
- **Ubuntu:** `sudo apt install emacs-nox`
- **Windows:** Use WSL or download from gnu.org

### Styles not updating

Hard refresh browser: `Cmd+Shift+R` (Mac) or `Ctrl+Shift+R` (Windows/Linux)

### 404 page not showing

Cloudflare Pages automatically serves `404.html` for missing routes. Ensure the file is committed.

### Changes not deploying

1. Check Cloudflare Pages dashboard for build status
2. Verify `index.html` was committed (not just `content.org`)
3. Clear Cloudflare cache: **Caching** → **Purge Everything**
