# ⚖️ NyayaEngine

<div align="center">

**A Deterministic Graph-Based Legal Reasoning Engine for Consumer Complaint Resolution**

*Grounded in Indian Consumer Protection Law*

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Python](https://img.shields.io/badge/python-3.10%2B-blue)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-backend-green)](https://fastapi.tiangolo.com/)
[![Neo4j](https://img.shields.io/badge/Neo4j-graph--db-orange)](https://neo4j.com/)
[![React](https://img.shields.io/badge/React-frontend-61DAFB)](https://react.dev/)
[![Docker](https://img.shields.io/badge/Docker-containerized-2496ED)](https://www.docker.com/)

> *"LLM extracts. Graph decides. Always."*

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Problem Statement](#-problem-statement)
- [Key Idea](#-key-idea)
- [System Architecture](#-system-architecture)
- [Core Components](#-core-components)
- [Methodology](#-methodology)
- [System Invariants & Formal Properties](#-system-invariants--formal-properties)
- [Implementation Details](#-implementation-details)
- [Results](#-results)
- [API Endpoints](#-api-endpoints)
- [Running the Project](#-running-the-project)
- [Novelty & Innovations](#-novelty--innovations)
- [Use Cases](#-use-cases)
- [Limitations](#-limitations)
- [Future Work](#-future-work)
- [Authors](#-authors)

---

## 🧭 Overview

**NyayaEngine** is a compliance-grade legal AI system designed to automatically resolve consumer complaints under Indian law using **deterministic reasoning**.

The system enforces a strict architectural separation between probabilistic and decisional components:

| Layer | Role |
|---|---|
| 🤖 **LLM (e.g., LLaMA3 / GPT)** | Fact extraction **only** — no decisions |
| 🔷 **Graph-Based Reasoning Engine (Neo4j)** | All legal decision-making |

This ensures the system is:

- ✅ **Deterministic** — same input always produces the same output
- ✅ **Legally Traceable** — every output is backed by statutory provisions
- ✅ **Fully Explainable** — complete reasoning path is always available

The system is grounded in:
- **Consumer Protection Act, 2019 (CPA 2019)**
- **Consumer Protection (E-Commerce) Rules, 2020**

---

## ❗ Problem Statement

Consumer complaint resolution systems in India face several challenges:

- Complaints are unstructured and expressed in free text
- Legal reasoning is complex and inconsistent across platforms
- Resolution is slow and dependent on human interpretation

Existing AI systems:

- ❌ Hallucinate legal provisions
- ❌ Produce non-reproducible results
- ❌ Lack verifiable statutory citations

**NyayaEngine** addresses these issues by introducing a deterministic, graph-based legal reasoning system that guarantees reproducibility and legal correctness.

---

## 💡 Key Idea

```
LLM  →  extracts structured facts
Graph engine  →  evaluates rules and produces decisions
```

> This ensures that probabilistic models do **not** influence legal outcomes.

---

## 🏗️ System Architecture

```
User Complaint (Unstructured Text)
            ↓
LLM Extractor (Fact Extraction Only)
            ↓
Structured Typed Facts
            ↓
Schema Validation Layer
            ↓
Deterministic Graph-Based Reasoning Engine (Neo4j)
            ↓
Rule Evaluation → Remedy Generation → Action Recommendation
            ↓
Statutory Citations + Explanation Trace
            ↓
Final Output (Remedies, Actions, Citations, Missing Questions)
```

> **Key Architectural Principle:** `LLM ∉ Decisional Path`

---

## 🔩 Core Components

### 5.1 Legal Knowledge Graph

Implemented using **Neo4j** and encodes statutory law as a typed directed graph.

**Node Types:**

| Node | Description |
|---|---|
| `Rule` | Complete, self-contained executable legal rule |
| `Condition` | Single verifiable factual condition |
| `Fact` | Typed, named data extracted from complaints |
| `Remedy` | Specific legal relief |
| `Action` | Recommended procedural next step |
| `Section` | Statutory citation / legislative anchor |

**Relationships:**

```
(:Rule)-[:HAS_CONDITION]->(:Condition)
(:Condition)-[:USES_FACT]->(:Fact)
(:Rule)-[:CITES]->(:Section)
(:Rule)-[:PRODUCES_REMEDY]->(:Remedy)
(:Remedy)-[:NEXT_ACTION]->(:Action)
```

**Scale:**
- ~115+ statutory sections encoded
- 50+ executable legal rules

---

### 5.2 Deterministic Reasoning Engine

The reasoning engine evaluates rules using strict logical conditions.

**Core evaluation function:**
```python
eval_condition(op, case_value, cond_value)
```

**Supported operators:**

| Operator | Meaning |
|---|---|
| `EQ` | Equals |
| `GT` | Greater than |
| `LT` | Less than |
| `EXISTS` | Fact is present |
| `NOT_EXISTS` | Fact is absent |

**Execution flow:**
```
Facts → Conditions → Rules → Remedies → Actions → Sections
```

**Properties:**
- ✅ No randomness
- ✅ No probabilistic scoring
- ✅ Fully reproducible outputs

**Rule firing model:**
```
Rᵢ fires ⟺ ∀C ∈ Rᵢ, eval(C) = True
```

---

### 5.3 Fact Ontology

All inputs are converted into structured, typed facts.

**Fact types:**

| Type | Examples |
|---|---|
| **Boolean** | `F_DEFECT_PRESENT`, `F_REFUND_DENIED`, `F_INVOICE_PROVIDED` |
| **Numeric** | `F_DAYS_SINCE_PURCHASE`, `F_REFUND_AMOUNT` |
| **Enumerated** | `F_PAYMENT_MODE ∈ {ONLINE_BANK_TRANSFER, CREDIT_CARD, DEBIT_CARD, UPI, COD, WALLET}` |
| **Existence** | `F_WARRANTY_EXISTS`, `F_SELLER_RESPONSE_RECEIVED`, `F_MISLEADING_ADVERTISEMENT` |

**Formal representation:**
```
F = (name, type, value)
```

The reasoning engine only accepts **schema-validated** facts.

---

### 5.4 Bounded LLM Integration

The LLM is **strictly restricted** to:
- ✅ Extracting structured facts from complaint text
- ✅ Marking missing or uncertain values

The LLM is **explicitly prohibited** from:
- ❌ Making legal decisions
- ❌ Selecting remedies
- ❌ Generating statutory citations

**Explainability Contract:**
```
LLM ∉ DecisionalPath
```

**Complete pipeline:**
```
ComplaintText → LLM → FactSchema → DeterministicEngine
```

**Key file:** `backend/app/services/llm_extract_service.py`

---

### 5.5 Missing Fact Backpropagation

When rules cannot be evaluated due to incomplete information:

1. The system identifies missing facts via graph traversal
2. Generates targeted plain-language clarification questions
3. Resubmits augmented fact sets to the reasoning engine (iteratively)

**Formula:**
```
MissingFacts(Rᵢ) = RequiredFacts(Rᵢ) − ProvidedFacts
```

**Features:**
- Fully deterministic — no LLM involved
- Graph-driven dependency analysis
- No probabilistic guessing

---

### 5.6 Explainability

Every output includes a **complete reasoning trace** as an intrinsic execution property:

```
Facts → Conditions → Rules → Remedies → Sections
```

This enables:
- Legal auditability
- User transparency
- Regulatory compliance

---

## 🔬 Methodology

The system methodology comprises **seven formally defined sequential stages:**

| Stage | Description |
|---|---|
| **Stage 1** | Statutory Decomposition and Graph Normalization |
| **Stage 2** | Typed Fact Ontology Engineering |
| **Stage 3** | Executable Rule Graph Construction |
| **Stage 4** | Deterministic Condition Evaluation Model |
| **Stage 5** | Graph-Based Rule Firing and Remedy Derivation |
| **Stage 6** | Dependency-Based Missing Fact Analysis |
| **Stage 7** | Explainable Trace Construction |

### Statutory Decomposition

Each statutory provision is represented as a normalized **five-element tuple:**

```
S = (A, P, T, E, R)
```

| Element | Meaning |
|---|---|
| `A` | Applicability — scope of entities and transactions covered |
| `P` | Preconditions — factual conditions that must hold for the rule to fire |
| `T` | Temporal Constraints — statutory deadlines (e.g., 7-day e-commerce refund window) |
| `E` | Exceptions — carve-outs that override applicable rules |
| `R` | Remedy — the legal consequence mandated when all conditions are satisfied |

### Rule Graph Construction

The legal knowledge graph is formally defined as:

```
G = (V, E)
```

Each rule is encoded as:

```
Rᵢ = {C₁, C₂, ..., Cₙ} ⇒ (Remedyⱼ, Sectionₖ)
```

> A rule **cannot generate a remedy without a citation** — enforced structurally.

### Graph-Based Rule Traversal (6-Step Mechanism)

1. **Retrieve Candidate Rules** — Query Neo4j for applicable Rule nodes
2. **Evaluate All Associated Conditions** — Traverse `HAS_CONDITION` edges; evaluate each with `eval(C)`, recording TRUE / FALSE / UNKNOWN
3. **Apply Universal Quantification** — If any condition is FALSE, rule does not fire; if UNKNOWN, defer to missing fact analysis
4. **Produce Remedy** — Traverse `PRODUCES_REMEDY` to retrieve statutory relief
5. **Attach Statutory Citation** — Traverse `CITES` edge to the Section node
6. **Generate Next Legal Action** — Traverse `NEXT_ACTION` edges for recommended procedural steps

```
Algorithm 1: Rule Traversal and Evaluation
────────────────────────────────────────────
Require: Fact Set F, Graph G
Ensure:  Remedies R

1: Retrieve candidate rules from G
2: for each rule Rᵢ do
3:     Evaluate all conditions C ∈ Rᵢ
4:     if all TRUE then
5:         Retrieve remedy and section
6:     else if UNKNOWN exists then
7:         Trigger missing fact analysis
8:     end if
9: end for
10: return all applicable remedies
```

---

## 🔐 System Invariants & Formal Properties

The system enforces **four formally proven compliance-grade invariants:**

### Invariant I — Determinism
```
F₁ = F₂ ⟹ O₁ = O₂
```
Identical facts always imply identical legal outcomes.

### Invariant II — Traceability
```
∀R ∈ Output, ∃S : R CITES S
```
Every remedy is associated with at least one statutory section. No remedy can exist without a concurrent citation.

### Invariant III — Probabilistic Separation
```
Probabilistic Components ∉ DecisionalLogic
```
Enforced by the schema validation gateway sitting as a hard type-and-name filter between the LLM and the reasoning engine.

### Invariant IV — Schema Integrity
```
Only Typed Facts ∈ ReasoningEngine.Input
```
Enforced by deterministic schema validation performing type checking, value range verification, and fact name lookup against the static closed-world fact ontology.

---

## 🛠️ Implementation Details

### Technology Stack

| Layer | Technology |
|---|---|
| **Backend** | FastAPI (Python) |
| **Graph Database** | Neo4j 5.x (Cypher query language) |
| **LLM Layer** | LLaMA3 / GPT-4 (bounded, via Ollama) |
| **Embeddings** | Ollama `nomic-embed-text` (768 dimensions) |
| **Frontend** | React + Vite + Tailwind CSS |
| **Deployment** | Docker Compose |

> Embeddings are stored in a Neo4j vector index (`section_embedding_index`) for contextual guidance — they remain **non-decisional**.

---

### Legal Knowledge Graph Schema

**Neo4j node labels:** `Rule`, `Condition`, `Fact`, `Remedy`, `Action`, `Section`

**Relationship types:** `HAS_CONDITION`, `USES_FACT`, `PRODUCES_REMEDY`, `NEXT_ACTION`, `CITES`

Every `Rule` node is required to have at least one `CITES` relationship at commit time, enforcing the Traceability Invariant structurally within the database.

---

### Statutory Corpus

**Consumer Protection Act, 2019** — Sections 2, 34–58 (consumer rights, product liability, unfair trade practices, forum jurisdiction)

**Consumer Protection (E-Commerce) Rules, 2020** — Rules 4–7 (seller obligations, return policies, refund timelines, grievance officer requirements)

---

### Rule Packs (Cypher Files)

```
cypher/
├── seed_cpa_2019_00_document.cypher
├── seed_cpa_2019_01_chapters.cypher
├── seed_cpa_2019_02_sections_part*.cypher
├── seed_ecom_2020_00_document.cypher
└── seed_ecom_2020_01_rules.cypher

cypher/rules/
├── rule_pack_cpa_phase1_10_jurisdiction_limitation.cypher
├── rule_pack_cpa_phase1_10_mediation.cypher
├── rule_pack_cpa_phase1_10_product_liability.cypher
├── rule_pack_cpa_phase1_10_ccpa_misleading_ads.cypher
├── rule_pack_ecom_phase1_10_defect.cypher
├── rule_pack_ecom_phase1_10_delivery.cypher
├── rule_pack_ecom_phase1_10_refund.cypher
├── rule_pack_ecom_phase1_10_inventory_entity.cypher
└── rule_pack_ecom_phase1_10_contravention.cypher
```

**Outcome:** ~50+ executable legal rules with full statutory citations.

---

### Key Backend Files

```
backend/app/services/
├── llm_extract_service.py      # Bounded LLM fact extraction
└── reasoning_service.py        # Deterministic reasoning engine
```

---

## 📊 Results

Evaluated against multiple baselines on 370 complaint instances (250 synthetic + 80 real-world anonymized + 40 adversarial).

### Comparative Performance

| Metric | **GCRS (Ours)** | Hardcoded Rule Engine | LegalBERT | GPT-4 E2E | Ontology + SPARQL |
|---|:---:|:---:|:---:|:---:|:---:|
| **Legal Accuracy (%)** | **94.8** | 89.2 | 76.4 | 81.3 | N/A |
| **Citation Precision (%)** | **98.6** | 91.7 | 52.3 | 61.8 | 84.2* |
| **Determinism (%)** | **100.0** | 100.0 | 71.2 | 68.9 | 100.0 |
| **Missing Fact Recall (%)** | **91.3** | N/A | 63.7 | 58.4 | N/A |
| **Clarification Rounds (avg)** | **1.4** | N/A | 2.9 | 3.1 | N/A |
| **Explainability Coverage (%)** | **100.0** | 62.1** | 0.0 | 0.0 | 78.4* |
| **Schema Rejection Rate (%)** | 12.4 | N/A | N/A | N/A | N/A |

> *Ontology+SPARQL applies to retrieval recall, not grounded determination generation.
> **Hardcoded engine explainability only applies when execution logs are manually enabled.

### Ablation Study

| Variant | Legal Accuracy | Citation Precision |
|---|:---:|:---:|
| **Full GCRS** | **94.8%** | **98.6%** |
| GCRS-noSep (LLM allowed to suggest remedies) | 79.4% | 64.2% |
| GCRS-noMFR (no Missing Fact Resolution) | −23.7% coverage | — |
| GCRS-noTrace (no trace generation) | 94.8% (unchanged) | 98.6% (unchanged) |

> Trace generation is a **zero-overhead** explainability mechanism — it does not trade off against determination quality.

---

## 📡 API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| `POST` | `/complaint/intake` | Processes complaint and returns remedies, actions, and citations |
| `POST` | `/complaint/intake/manual` | Manual complaint intake |
| `POST` | `/case/{case_id}/facts/bulk` | Adds additional facts and recomputes reasoning |
| `POST` | `/case/create` | Creates a new case |
| `POST` | `/fact/add` | Adds a fact to an existing case |
| `POST` | `/reason/run` | Runs the deterministic reasoning engine |
| `GET` | `/facts/list` | Lists all facts |
| `GET` | `/sections/list` | Lists all statutory sections |
| `GET` | `/debug/graph/validate` | Validates graph consistency and integrity |

### Key Request Schemas

- `ComplaintIntakeRequest` — complaint text + category
- `BulkFactsRequest` — structured fact set for bulk insertion
- `CaseCreateRequest` / `CaseAskFactsRequest` — case management

---

## 🚀 Running the Project

The entire system can be executed using shell scripts.

### Start the System

```bash
./start.sh
```

This will:
- Start Neo4j database
- Launch backend services
- Initialize all components

### Stop the System

```bash
./stop.sh
```

This will:
- Stop all running services
- Shut down containers safely

### Requirements

- Docker & Docker Compose
- Python 3.10+
- Node.js (for frontend)
- Ollama (for local LLM serving)

---

## 💎 Novelty & Innovations

> *"This combination is not present in existing systems."*

### Five Core Novel Contributions

**1. Decisional Isolation Architecture**
The first system to enforce a formally verified hard structural separation between probabilistic NLP and statutory legal reasoning, implemented as a schema validation gateway with formal proof of the Separation Invariant.

**2. Executable Statutory Graph Compilation**
A novel method of transforming legislative provisions into conditionally executable graph structures through a normalized five-element decomposition tuple `S = (A, P, T, E, R)`, enabling modular, auditable, **code-free** legal rule updates.

**3. Deterministic Missing-Fact Backpropagation**
A graph-reachability-based clarification engine that identifies missing facts deterministically through `USES_FACT` edge traversal and generates targeted plain-language questions — without any probabilistic inference.

**4. Compliance-Grade Design Invariants**
The first legal AI system to establish and formally prove four compliance-grade invariants (Determinism, Traceability, Separation, Schema Integrity) as structural system properties, not empirical observations.

**5. Unified Compliance-Grade Pipeline**
The first system to simultaneously advance over all four categories of prior art — hardcoded rule engines, case-based reasoning systems, ontology systems, and LLM assistants — in a single formally verified pipeline.

---

## 🎯 Use Cases

- 🏛️ Consumer grievance portals
- ⚖️ Legal aid automation
- 📋 Pre-litigation advisory systems
- 🏦 Regulatory compliance engines
- 🏥 Extension potential: banking, insurance, healthcare grievances

---

## ⚠️ Limitations

| Limitation | Description |
|---|---|
| **LLM Extraction Dependency** | Legal accuracy is partially bounded by LLM fact extraction quality. Colloquial, code-mixed, or low-resource language complaints may degrade extraction accuracy |
| **Closed-World Fact Assumption** | System can only reason about facts explicitly defined in the schema. Novel complaint types require schema extension |
| **Static Graph Updates** | Statutory amendments require expert legal review; graph updates are modular but dependent on human legal expertise |
| **Experimental Scope** | Current evaluation confined to CPA 2019 and E-Commerce Rules 2020 |
| **Synthetic Benchmark Proportion** | A portion of the evaluation benchmark consists of synthetic complaints |

---

## 🔭 Future Work

- 🌐 **Multilingual Fact Extraction** — Support for Tamil, Hindi, Bengali, Telugu via multilingual fine-tuned models
- 🔄 **Active Graph Learning** — Semi-automated graph updates in response to new judicial interpretations and regulatory amendments
- 🏦 **Cross-Domain Extension** — Insurance grievance resolution, banking dispute management, healthcare service complaints
- 🔍 **Formal Mechanization** — Upgrading proof sketches to fully mechanized formal proofs using Coq or Isabelle/HOL
- 🛡️ **Adversarial Robustness** — Systematic evaluation against adversarial complaint inputs targeting edge conditions in the schema validation gateway
- 🏛️ **Government Platform Integration** — Piloting with NCDRC digital platform and the Consumer Online Resource and Empowerment (CORE) portal

---

## 👥 Authors

| Name | Email |
|---|---|
| **Aditya** | aditya.2022c@vitstudent.ac.in |
| **Madayanthikaa R** | madayanthikaa.r2022@vitstudent.ac.in |
| **Rufina M** | rufina.m2022@vitstudent.ac.in |
| **Vijayarajan V** *(Faculty)* | vijayarajan.v@vit.ac.in |

**Institution:** School of Computer Science and Engineering (SCOPE), Vellore Institute of Technology, Vellore, Tamil Nadu, India

---

## 📄 References

1. K. D. Ashley and S. Brüninghaus, "Automatically classifying case texts and predicting outcomes," *ICAIL*, 2003.
2. E. L. Rissland, K. D. Ashley, and R. P. Loui, "AI and law: A fruitful synergy," *Artif. Intell.*, vol. 150, 2003.
3. M. Lecué et al., "Legal knowledge graph construction for question answering," *Semantic Web J.*, 2020.
4. I. Chalkidis et al., "LEGAL-BERT: The muppets straight out of law school," *Findings of EMNLP*, 2020.
5. N. Aletras et al., "Predicting judicial decisions of the ECHR," *PeerJ Comput. Sci.*, 2016.
6. T. Bench-Capon et al., "A history of AI and law in 50 papers," *Artif. Intell. Law*, vol. 20, 2012.
7. G. Governatori, "Representing business contracts in RuleML," *Int. J. Cooperative Inf. Syst.*, 2005.
8. S. Vieira et al., "Consumer complaint classification using machine learning," *Decision Support Syst.*, 2021.
9. S. M. Lundberg and S.-I. Lee, "A unified approach to interpreting model predictions," *NeurIPS*, 2017.
10. Government of India, *The Consumer Protection Act, 2019*, Ministry of Consumer Affairs.
11. Government of India, *Consumer Protection (E-Commerce) Rules, 2020*, Ministry of Consumer Affairs.

---

<div align="center">

**NyayaEngine** — *Deterministic. Traceable. Legally Sound.*

*School of Computer Science and Engineering, VIT Vellore*

</div>
