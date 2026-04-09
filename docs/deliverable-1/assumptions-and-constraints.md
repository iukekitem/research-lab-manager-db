# Assumptions and Constraints

This document lists **explicit assumptions** and **real‑world constraints**
identified during Deliverable 1 that cannot be fully enforced using standard
EER notation alone.

These constraints are essential for guiding the relational design and
application‑level logic in later phases of the project.

---

## Mentorship Constraints

- A mentee may have **only one mentor** at any given time
- A lab member **cannot mentor themselves**
- **Students cannot mentor faculty members**

These constraints reflect the hierarchical nature of mentorship in an academic
research environment.

---

## Equipment and Device Usage Constraints

- A device may be used by **no more than three lab members simultaneously**
- Device availability depends on its current status (e.g., available, in use,
  retired)

The maximum simultaneous usage constraint cannot be directly represented in
EER diagrams and must be enforced using database logic or application checks.

---

## Project Participation Constraints

- Every lab member must be assigned to **at least one project**
- Each project must have **exactly one faculty leader**
- Weekly hours worked by members must be non‑negative

---

## Publication Constraints

- Every publication must have **at least one author**
- Publication dates are tracked at the **month and year** level
- A DOI is optional and may not exist for all publications

---

## Implementation Notes

Some constraints listed above will be enforced during:
- Relational schema design (keys and foreign keys)
- SQL constraints where possible
- Application‑level logic for rules not supported by SQL alone
``
