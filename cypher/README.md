# Cypher Seed Scripts (Neo4j)

This folder contains all Cypher scripts used to build and seed the Neo4j database for the
Consumer Complaint Rule Engine (CPA India).

## Folder Structure

### `cypher/corpus/`
Authoritative corpus seeding scripts.
Includes:
- schema for Document/Chapter/Section corpus layer
- CPA 2019 sections
- E-Commerce Rules 2020 (stored as Section nodes)
- Jurisdiction rules (Consumer Protection Jurisdiction Rules 2021)
- vector schema/index scripts for embeddings

Expected usage:
1) Run schema scripts (constraints/indexes)
2) Run corpus seeds (documents/chapters/sections)
3) Run embeddings indexing scripts (if using vector guidance)

---

### `cypher/rules/`
Authoritative rule graph seeding scripts.
Includes:
- Fact nodes (with ui metadata)
- Rule packs (e-commerce delivery/defect/refund/platform payments/warranty+ads)
- Remedies and Actions seed scripts
- Patch scripts for types, UI, keys

Expected usage:
1) Seed remedies/actions
2) Seed rule packs
3) Run patch scripts if required
4) Validate graph

---

### `cypher/issues/`
Optional issue layer (keyword/topic mapping).
Used for:
- issue categories
- keyword mapping
- issue-to-sections guidance layer

This layer is non-decisional and can be used for:
- UI guidance
- search
- complaint categorization

---

### `cypher/_archive_root_old/`
Archived older scripts that previously existed at repo root:
- schema.cypher
- sections.cypher
- facts.cypher
- rules_mvp.cypher
- remedies_actions.cypher
- seed_min.cypher

These files are NOT part of the active seeding pipeline.
They are kept only for reference/backward compatibility.

---

## Notes
- The deterministic core uses Neo4j rule graph traversal to decide:
  fired rules, remedies, actions, and citations.
- LLM is only used at the boundary (complaint validity + fact extraction).
- Vector search is non-decisional guidance only.
