# Deliverable 2 – Relational Database Design

## Goals of Phase 2

The goal of Deliverable 2 was to transform the **conceptual EER model**
developed in Deliverable 1 into a **logical relational schema** suitable for
implementation in a relational database system.

This phase focused on:
- Mapping entities, relationships, and specializations to relational tables
- Identifying primary keys and foreign keys
- Preserving integrity constraints defined in the conceptual design
- Producing SQL Data Definition Language (DDL) statements to create the schema

The resulting relational design serves as the foundation for database
population and application development in Deliverable 3.

---

## Revisions to the Conceptual Model

No revisions were made to the original EER diagram developed in Deliverable 1.
The conceptual schema was found to be complete and accurate, allowing the
mapping process to proceed directly from the initial design.

---

## EER to Relational Mapping Strategy

The mapping from the EER model to the relational schema followed standard
EER‑to‑Relational design rules:

### Specialization Mapping (Lab Members)

The **multiple‑table strategy** was used for the Lab Member specialization:

- `LabMembers` stores attributes common to all members
- `Student`, `Faculty`, and `Collaborator` tables store role‑specific attributes
- Each subclass table uses `MemberID` as both a **primary key** and
  **foreign key** referencing `LabMembers`

This approach enforces strong type separation and prevents invalid attribute
assignments between member roles.

---

### Mapping Many‑to‑Many Relationships

The following many‑to‑many relationships were mapped to **separate relation
tables**:

- **WorksOn** (Lab Members ↔ Projects)
  - Records role and weekly involvement hours
- **Author** (Lab Members ↔ Publications)
  - Records authorship relationships

Composite uniqueness constraints were applied to prevent duplicate
member‑project or member‑publication associations.

---

### Weak Entity Mapping (Equipment and Devices)

- `Equipment` represents equipment categories or models
- `Devices` represents physical units of equipment

Devices were modeled as dependent on Equipment. The relational design supports
identification of devices within the context of their associated equipment,
mirroring the weak‑entity relationship defined in the conceptual model.

---

### Recursive Relationship Mapping (Mentorship)

Mentorship was implemented using a **self‑referencing table**:

- Both mentor and mentee reference the `LabMembers` table
- Start and end dates are recorded
- Constraints prevent self‑mentoring and multiple mentors per mentee

This design preserves the recursive relationship while remaining compatible
with relational database constraints.

---

## Relational Schema Overview

The final relational schema includes the following table groups:

- **Core Entities**
  - LabMembers
  - ResearchProjects
  - Grants
  - Equipment
  - Devices
  - Publications

- **Relationship Tables**
  - WorksOn
  - Author
  - Mentorship
  - Uses

Each table includes clearly defined primary keys and foreign keys to enforce
referential integrity across the system.

---

## SQL Table Creation (DDL)

SQL `CREATE TABLE` statements were developed for all relations defined in the
schema. These include:
- Primary key constraints
- Foreign key constraints with appropriate delete rules
- Unique constraints for many‑to‑many relationships
- Domain constraints where applicable

All tables were designed to be created without integrity violations when
executed in the correct dependency order.

---

## Design Justifications

Key design decisions made during this phase include:

- **Subclass Tables for Lab Members:** Ensures only valid attributes apply to
  each member type
- **Separate Relationship Tables:** Maintains normalization and prevents data
  duplication
- **Recursive Mentorship Table:** Enables mentorship tracking without creating
  redundant entities
- **Equipment vs. Devices Separation:** Allows precise tracking of individual
  physical resources

---

## Challenges Encountered

Several challenges were addressed during this phase:

- Managing recursive foreign keys in the Mentorship table
- Determining correct table creation order due to foreign key dependencies
- Enforcing uniqueness in many‑to‑many relationships
- Representing conceptual constraints that require application‑level
  enforcement

These challenges were resolved through careful schema design and constraint
