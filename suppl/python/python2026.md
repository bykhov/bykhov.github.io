---
layout: default
toc:
  sidebar: left
mermaid:
  enabled: true
  zoomable: true
---

## Python course, 2026
* This page is used for supplementary course information and materials (TA resources).

---

### Meetings
#### Week 1 (12/03) 
* Course introduction
* [Github Skill](https://learn.github.com/skills) 
  * [Introduction to GitHub](https://github.com/skills/introduction-to-github)
  * [Communicate using Markdown](https://github.com/skills/communicate-using-markdown)
```mermaid
graph LR
    subgraph main["סביבת עבודה"]
        lang["שפת תכנות"]
        ide["סביבת פיתוח תוכנה<br/>IDE<br/>• Visual Studio Code<br/>(Cursor, Antigravity, ...)<br/>• JetBrains: PyCharm,<br/>Dataspell"]
        libs["ספריות נלוות"]
        collab["עבודה משותפת<br/>Github<br/>Markdown"]

        lang <--> ide
        lang <--> libs
        libs <--> collab
        ide <--> collab
    end

    ai["AI tools<br/>• Github Copilot<br/>• Gemini CLI"]
    anaconda["כלי ניהול גרסות של<br/>ספריות<br/>Anaconda"]
    colab["Colab קצת מהכל"]

    lang --> ai
    ide <-.-> ai
    anaconda --> lang
    anaconda --> libs
    colab <--> collab

    style ai fill:#a8c4f0,stroke:#333
    style anaconda fill:#e0e0e0,stroke:#333
    style colab fill:#7ecfa0,stroke:#333
    style main fill:#fde8a0,stroke:#f0c040,stroke-width:2px
```

---

### Project
The project will be presented at the end of the course 11/06. More details will be provided during the course.
* [Guidelines](/suppl/python/ta2026/Python_Project.pdf)

---

### [Recommended resources](/suppl/python/python_resources2026)

---

### [Old Recordings](/suppl/python/recordings)

---