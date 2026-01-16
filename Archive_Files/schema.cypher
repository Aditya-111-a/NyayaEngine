// ===== Constraints (Uniqueness) =====
CREATE CONSTRAINT act_id_unique IF NOT EXISTS
FOR (a:Act) REQUIRE a.act_id IS UNIQUE;

CREATE CONSTRAINT section_id_unique IF NOT EXISTS
FOR (s:Section) REQUIRE s.section_id IS UNIQUE;

CREATE CONSTRAINT rule_id_unique IF NOT EXISTS
FOR (r:Rule) REQUIRE r.rule_id IS UNIQUE;

CREATE CONSTRAINT fact_id_unique IF NOT EXISTS
FOR (f:Fact) REQUIRE f.fact_id IS UNIQUE;

CREATE CONSTRAINT cond_id_unique IF NOT EXISTS
FOR (c:Condition) REQUIRE c.cond_id IS UNIQUE;

CREATE CONSTRAINT remedy_id_unique IF NOT EXISTS
FOR (re:Remedy) REQUIRE re.remedy_id IS UNIQUE;

CREATE CONSTRAINT action_id_unique IF NOT EXISTS
FOR (ac:Action) REQUIRE ac.action_id IS UNIQUE;

CREATE CONSTRAINT case_id_unique IF NOT EXISTS
FOR (k:Case) REQUIRE k.case_id IS UNIQUE;

// CaseFact: unique by (case_id + fact_id)
CREATE CONSTRAINT case_fact_unique IF NOT EXISTS
FOR (cf:CaseFact) REQUIRE (cf.case_id, cf.fact_id) IS UNIQUE;

// FiredRule: unique by (case_id + rule_id)
CREATE CONSTRAINT fired_rule_unique IF NOT EXISTS
FOR (fr:FiredRule) REQUIRE (fr.case_id, fr.rule_id) IS UNIQUE;


// ===== Indexes (Search performance) =====
CREATE INDEX rule_enabled_idx IF NOT EXISTS
FOR (r:Rule) ON (r.enabled);

CREATE INDEX rule_priority_idx IF NOT EXISTS
FOR (r:Rule) ON (r.priority);

CREATE INDEX section_no_idx IF NOT EXISTS
FOR (s:Section) ON (s.section_no);

CREATE INDEX fact_name_idx IF NOT EXISTS
FOR (f:Fact) ON (f.name);

