# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is Dima Bykhovsky's academic homepage at `bykhov.github.io`, built with the [al-folio](https://github.com/alshedivat/al-folio) Jekyll theme. It's a personal academic site for an EE faculty member at SCE College, featuring teaching materials, publications, blog posts, and course content.

**Deployment:** Pushing to `master` automatically triggers a GitHub Actions workflow that builds and deploys to the `gh-pages` branch (served at `bykhov.github.io`).

## Architecture

### Content Organization

- **`_pages/`** — Static pages (about, cv, teaching, projects, blog, etc.). Each `.md` file maps to a route via `permalink` in front matter.
- **`_teaching/`** — Course collection entries, one `.md` per course. Cards appear on `/teaching/` page, categorized by `category:` front matter (`current`, `students`, `previous`) and sorted by `importance:`.
- **`_news/`** — Short announcements shown on the homepage.
- **`_posts/`** — Blog posts (standard Jekyll convention).
- **`_projects/`** — Project cards shown on the `/projects/` page.
- **`_bibliography/papers.bib`** — BibTeX file powering the publications page via `jekyll-scholar`.
- **`_data/`** — YAML data files: `coauthors.yml` (co-author links in publications), `repositories.yml` (GitHub repos/users for repositories page), `cv.yml` (CV data), `venues.yml` (publication venue abbreviations).
- **`assets/`** — Images, PDFs, JSON (including `resume.json`), and other static files.
- **`suppl/`** — Supplementary course materials (lecture notes, PDFs).

### Key Configuration (`_config.yml`)

- Site identity: `first_name`, `last_name`, `email`, `url`, social usernames
- `scholar:` section controls publication author highlighting (`last_name: [Bykhovsky]`)
- Collections `teaching`, `news`, `projects` are defined here
- Many features toggled via `enable_*` flags (dark mode, math, masonry, etc.)
- `display_tags` controls which blog tags appear on the front page

### Teaching Course Pages

Each file in `_teaching/` has front matter:
```yaml
layout: page
title: Course Name
description: Short description
importance: 1          # lower = higher priority
category: current      # current | students | previous
toc:
  sidebar: left        # optional TOC sidebar
```

Course content (lecture notes, recordings, assignments) lives directly in the `.md` body as Markdown.

### Publications

Edit `_bibliography/papers.bib` to add/update publications. The publications page is auto-generated. Custom BibTeX fields like `pdf`, `code`, `html`, `abstract`, `bibtex_show`, `selected` control display buttons and behavior.

### Theming

- Theme color: `_sass/_themes.scss` (change `--global-theme-color`)
- Color variables: `_sass/variables.scss`