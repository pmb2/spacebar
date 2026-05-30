# FOSS Recon Ecosystem Gap Analysis - Research Report

**Generated**: 2026-05-30
**Project**: Spacebar reconnaissance platform research

---

## Area 1: AI/LLM-Driven Security Orchestration

### Key Projects Found

#### PentestGPT (GreyDGL/PentestGPT)
- **GitHub**: github.com/GreyDGL/PentestGPT
- **Stars**: 13,367 | **Forks**: 2,305 | **License**: MIT
- **Last Updated**: 2026-05-30 (very active)
- **Status**: ACTIVE - 73 open issues, not archived
- **Language**: Python
- **Description**: Automated Penetration Testing Agentic Framework Powered by Large Language Models
- **Gap**: Strong framework but focused on guided conversation-style pentesting, not automated recon orchestration. No built-in knowledge graph or passive CVE matching.

#### AutoPentest-DRL (crond-jaist/AutoPentest-DRL)
- **Stars**: 431 | **License**: BSD-3-Clause
- **Last Pushed**: 2022-02-15 (INACTIVE - no updates in 4+ years)
- **Gap**: Academic proof-of-concept, not production-ready.

#### HackerGPT (hackergpt.ai)
- **No public FOSS repository found** - commercial web service
- **Gap**: No self-hostable FOSS alternative exists

#### LLM-Based Security Automation via MCP
- **HexStrike AI** (0x4m4/hexstrike-ai): **9,004 stars** - MIT, active. 150+ cybersecurity tools wrapped as MCP server for AI agents. Most popular MCP security tool.
- **pentest-ai** (0xSteph/pentest-ai): **560 stars** - MIT, active. 205 wrapped tools, 17 specialist agents, 60 SPA-aware OWASP probes. CLI + MCP, BYO LLM.
- **MCP Security Hub** (FuzzingLabs/mcp-security-hub): **559 stars** - MIT, active. Nmap, Ghidra, Nuclei, SQLMap, Hashcat via MCP.
- **PentestGPT-MCP** (yuhano/PentestGPT-MCP): **17 stars** - Early-stage MCP-based pentesting agent.
- **MCP for Security** (cyproxio/mcp-for-security): **612 stars** - MIT, but **ARCHIVED**.

### Overall Gap Assessment (Area 1) - HIGH
No FOSS project combines LLM orchestration with:
- Persistent knowledge graph storage
- Passive/slow-roll scanning
- Automated recon scheduling
- CVE correlation in a single pipeline
Most solutions are either conversation-based assistants or simple tool wrappers.

---

## Area 2: Knowledge Graphs for Infrastructure + Vulnerability Mapping

### Key Projects Found

#### BloodHound CE (SpecterOps/BloodHound)
- **Stars**: 3,071 | **License**: Apache-2.0 | **Status**: ACTIVE (2026-05-30)
- **Description**: Six Degrees of Domain Admin - graph-based AD attack path analysis
- **Gap**: AD-specific only. No FOSS equivalent for general infrastructure mapping or cloud asset graph analysis.

#### Recon-ng (lanmaster53/recon-ng)
- **Stars**: 5,637 | **License**: GPL-3.0 | **Status**: ACTIVE (2026-05-30)
- **Description**: Open Source Intelligence gathering tool with module/transform framework
- **Gap**: Module-based but no graph database backend. Results are flat files, not queryable graphs. No native Neo4j/KuzuDB integration.

#### Maltego Alternatives
- **No FOSS Maltego alternative with graph-based visualization found**
- Casefile is part of Maltego (proprietary)
- Recon-ng transforms are text-based, not graph-based

#### Other Graph-Based Security Tools (all under 5 stars, experimental)
- **SecurityGraphAI** (laipan0331) - Neo4j+GraphRAG for CVEs
- **SecureGraph** (Mohammed-Saif-07) - CVEs to attack paths via Neo4j
- **w3bhound** (Cy-S3c) - BloodHound-inspired but inactive
- **Spectra-LangGraph** (infantesromeroadrian) - LangGraph-powered recon with Neo4j

#### Graph Database Projects for Security
- **KuzuDB** (kuzudb/kuzu): 3,940 stars - MIT, but **ARCHIVED**. Embedded property graph DB with Cypher - ideal for local deployment but no longer maintained as FOSS.
- **DuckDB**: No security-specific graph analysis tools found. Used as analytical DB but has no native graph/cypher query layer.

#### GraphQL-Based Asset Management
- **No FOSS GraphQL-based security asset management tools found**
- Commercial: JupiterOne uses GraphQL. No FOSS equivalent.

### Overall Gap Assessment (Area 2) - CRITICAL
No production-ready FOSS project provides a graph-based infrastructure knowledge graph that:
- Ingests recon data (domains, IPs, ports, certs, DNS, WHOIS)
- Stores in Neo4j/KuzuDB/DuckDB with proper schema
- Runs graph queries for attack path analysis
- Correlates with CVE/vulnerability data
- Has a Maltego-like visual exploration interface

---

## Area 3: Slow-Roll / Organic Traffic Recon Tools

### Key Projects Found

#### Gobuster (OJ/gobuster)
- **Stars**: 13,755 | **License**: Apache-2.0 | **Status**: ACTIVE (2026-05-22)
- **Description**: Directory/File, DNS, VHost busting tool
- **Gap**: No built-in jitter/random timing. Has thread control for basic rate limiting but no organic traffic simulation.

#### FFUF (ffuf/ffuf)
- **Stars**: 16,158 | **License**: MIT | **Status**: ACTIVE (2026-05-30)
- **Description**: Fast web fuzzer written in Go
- **Gap**: Designed for speed, not stealth. Has rate flag but no jitter or organic request patterns. No random User-Agent rotation.

#### Caido (caido/caido)
- **Stars**: 2,344 | **Status**: ACTIVE (2026-05-29)
- **Description**: FOSS Burp Suite alternative - web proxy
- **Gap**: Partially closed-source (releases repo only). Community edition has limited rate-limiting.

#### ZAP (zaproxy/zaproxy)
- **Stars**: 15,200 | **License**: Apache-2.0 | **Status**: ACTIVE (2026-05-28)
- **Description**: The ZAP by Checkmarx - web application scanner
- **Gap**: Rate limiting via spider settings but no randomized jitter or stealth mode.

#### ExRecon (ExRecon/exrecon)
- **Stars**: 21 | **License**: MIT | **Status**: ACTIVE (2026-05-13)
- **Description**: TOR-routed Nmap automation with firewall evasion
- **Gap**: Nmap-only. Not a general slow-roll recon framework.

#### Nmap Stealth Tools
- Various small repos (all under 10 stars)
- **Gap**: No comprehensive tool combining jitter, randomized timing, organic patterns, and multi-tool orchestration.

### Overall Gap Assessment (Area 3) - CRITICAL
No FOSS tool for slow-roll/organic-traffic recon exists. Current tools optimize for speed. A dedicated slow-roll recon framework with random intervals, browser-like behavior, and realistic timing is completely missing.

---

## Area 4: Passive CVE Matching Without Active Scanning

### Key Projects Found

#### WPScan (wpscanteam/wpscan)
- **Stars**: 9,604 | **Status**: ACTIVE (2026-05-28)
- **Description**: WordPress security scanner - version to CVE matching
- **Gap**: WordPress-only. No general-purpose version-to-CVE matcher.

#### Retire.js (RetireJS/retire.js)
- **Stars**: 4,133 | **License**: Apache-2.0 | **Status**: ACTIVE (2026-05-26)
- **Description**: Scanner for JS libraries with known vulnerabilities. Generates SBOM.
- **Gap**: JS-library-only. No generic version-extraction to CVE matching.

#### nvdlib (vehemont/nvdlib)
- **Stars**: 114 | **License**: MIT | **Status**: ACTIVE (2026-03-31)
- **Description**: Python wrapper for NVD CVE/CPE API
- **Gap**: Low-level API wrapper only. No version comparison, CPE mapping, or banner parsing.

#### OSV Check (Hermes Agent built-in)
- Located at tools/osv_check.py
- Checks MCP packages for MAL-* advisories via Google OSV API
- **Gap**: MCP package malware only, not general CVE matching

#### Banner Grabbing to CVE Tools
- Multiple repos found, all under 5 stars, student projects
- **Gap**: Not production quality, no maintenance

### Overall Gap Assessment (Area 4) - HIGH
No production-grade FOSS tool provides:
- Automated banner/version extraction from service fingerprints
- CPE generation from version strings
- NVD/OSV API correlation
- Library/service-agnostic passive CVE matching

---

## Area 5: Hermes Agent Integration Patterns

### MCP Server Architecture
Hermes Agent (v0.15.1) has a built-in MCP client (tools/mcp_tool.py) connecting to external MCP servers via:
- **Stdio transport** (command + args)
- **Streamable HTTP** (url + headers)
- **SSE transport** (transport: sse)
- Configuration in ~/.hermes/config.yaml under mcp_servers key
- Per-server timeouts, environment filtering, auto-reconnection, thread-safe

**Compatible MCP Security Tools:**
1. **HexStrike AI** (9,004 stars) - 150+ security tools wrapped as MCP server
2. **pentest-ai** (560 stars) - 205 tools, 17 specialist agents, 60 SPA probes
3. **MCP Security Hub** (559 stars) - Nmap, Ghidra, Nuclei, SQLMap, Hashcat
4. **PentestGPT-MCP** (17 stars) - MCP-based pentesting agent

### Cron Job System
Full cron system at cron/jobs.py + cron/scheduler.py:
- Jobs in ~/.hermes/cron/jobs.json, cron expressions via croniter
- Runs agents autonomously with skill-loading
- Security: cronjob/messaging/clarify toolsets always disabled
- File-based locking, per-job output with timestamps
- Prompt injection scanning on assembled prompts

### Skill System
- Skills at ~/.hermes/skills/ (built-in: find-skills, skybridge)
- Community skills hub, prompt injection scanning (skills_guard.py)
- Provenance tracking and AST auditing

### Hermes as MCP Provider
- hermes mcp serve exposes 9+ MCP tools
- conversations_list, messages_send, events_poll, etc.
- Enables Claude Code, Cursor, Codex to interact with Hermes

### Integration Patterns
1. **MCP Server Pattern**: Wire security tools as MCP servers
2. **Cron Job Pattern**: Schedule recon via cron jobs
3. **Delegation Pattern**: Parallel sub-agent recon via delegate_task
4. **Skill Pattern**: Package recon workflows as skills with SKILL.md
5. **Plugin Pattern**: Extend toolsets via tools/registry.py

### Current Gaps in Hermes for Recon
1. No pre-built recon MCP servers configured
2. No security-specific skills shipped
3. No knowledge graph storage integration
4. No pre-built recon cron job templates
5. No visual/graph-based output for recon results

---

# Summary Matrix

| Area | Severity | Key Missing Capability | Best FOSS Candidates |
|------|----------|----------------------|---------------------|
| AI Orchestration | **HIGH** | Unified LLM orchestrator with persistent state | PentestGPT (13k), HexStrike (9k), pentest-ai (560) |
| Knowledge Graphs | **CRITICAL** | FOSS infra KG with Neo4j/Kuzu/GraphQL | Recon-ng (5.6k) flat files; KuzuDB archived |
| Slow-Roll Traffic | **CRITICAL** | Jitter/random-timing WAF-evasion framework | ExRecon (21) Nmap-only; no general solution |
| Passive CVE Matching | **HIGH** | General version-to-CVE matcher | WPScan (9.6k) WP; Retire.js (4.1k) JS; nvdlib (114) |
| Hermes Integration | **MEDIUM** | Pre-built recon skills/MCP/cron jobs | MCP Security Hub (559), pentest-ai (560) |

---

# Recommended Focus Areas for Recon Platform

1. **AI Orchestration Layer**: Build a unified LLM orchestration layer coordinating all recon phases with persistent state via knowledge graph.

2. **Knowledge Graph Backend**: Implement infrastructure mapping using KuzuDB or Neo4j with automated ingestion of DNS, WHOIS, certs, port scans; attack path analysis queries; CVE correlation via graph traversal; visual exploration.

3. **Slow-Roll Scanning Engine**: Develop dedicated slow-roll recon with random jitter (gaussian distribution), realistic browser-like timing, User-Agent rotation, organic traffic pattern simulation, and WAF/IDS evasion as first-class features.

4. **Passive CVE Matcher**: Create general service-to-CPE-to-CVE correlator with banner/version extraction, automated CPE generation, NVD API + OSV API correlation, library-agnostic matching.

5. **Hermes Integration Pack**: Package as installable Hermes skills (SKILL.md), MCP server wrappers, pre-configured cron job templates for recurring recon, delegation patterns for parallel sub-agent recon.
