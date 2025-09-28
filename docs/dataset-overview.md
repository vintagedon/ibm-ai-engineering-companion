# Dataset Overview

This document provides technical details about the research datasets used throughout the IBM AI Engineering companion exercises.

---

## Steam Dataset 2025: Gaming Analytics Platform

### Repository & Documentation

- **Repository:** [steam-dataset-2025](https://github.com/vintagedon/steam-dataset-2025)
- **Academic Documentation:** [Dataset Card](https://github.com/vintagedon/steam-dataset-2025/blob/main/paper/dataset-card.md)
- **Technical Architecture:** [Multi-Modal Database Design](https://github.com/vintagedon/steam-dataset-2025/blob/main/docs/methodologies/multi-modal-db-architecture.md)

### Dataset Characteristics

- **Scale:** 239,664 applications from comprehensive Steam catalog
- **Data Sources:** Exclusively official Steam Web APIs
- **Collection Method:** Systematic API-pure methodology with rate limiting
- **Coverage:** 90.6% of accessible Steam catalog with documented gap analysis

### Database Architecture

- **Primary Storage:** PostgreSQL 16 with normalized relational schema
- **Document Storage:** JSONB for flexible Steam API response preservation
- **Vector Search:** pgvector extension with 1024-dimensional embeddings
- **Semantic Analysis:** BAAI/bge-m3 embeddings for multilingual content

### Content Distribution

| Content Type | Count | Applications |
|--------------|-------|-------------|
| Core Games | 150,279 | Primary gaming applications for ML classification |
| DLC Content | 53,792 | Relationship analysis and recommendation systems |
| Software | ~15,000 | Market segmentation and category analysis |
| Demos/Videos | ~13,000 | Content lifecycle and engagement studies |

### Technical Applications

- **Market Intelligence:** Publisher networks, genre evolution, pricing strategies
- **Content Classification:** Multi-class genre prediction, success forecasting
- **Recommendation Systems:** Content-based and collaborative filtering approaches
- **Natural Language Processing:** Review sentiment, description analysis, tag classification
- **Graph Analysis:** Developer relationships, collaboration networks

### Infrastructure Integration

- **Database Host:** proj-pgsql01 (8 vCPU, 32GB RAM)
- **Query Performance:** <500ms average response time for complex analytical queries
- **Vector Operations:** Semantic search across 1M+ text descriptions
- **Data Completeness:** 98.7% successful API resolution rate

---

## DESI Cosmic Void Galaxies: Astrophysics Research

### Repository & Documentation

- **Repository:** [desi-cosmic-void-galaxies](https://github.com/Proxmox-Astronomy-Lab/desi-cosmic-void-galaxies)
- **Scientific Focus:** Environmental effects on galaxy evolution in cosmic voids
- **Implementation Roadmap:** [12-week development timeline](https://github.com/Proxmox-Astronomy-Lab/desi-cosmic-void-galaxies/blob/main/ROADMAP.md)

### Dataset Characteristics

- **Scale:** 6.4M galaxy records from DESI DR1 astronomical survey
- **Data Sources:** DESI Value-Added Catalogs (FastSpecFit, DESIVAST)
- **Total Volume:** 27.6GB of processed astronomical data
- **Validation Status:** Stage 1 database integrity validation complete (100% pass rate)

### Scientific Data Components

- **Galaxy Properties:** Stellar masses, star formation rates, redshifts from FastSpecFit VAC
- **Cosmic Voids:** 10,752 void positions and radii from DESIVAST catalog
- **Environmental Classification:** Binary void/wall assignment through 3D spatial analysis
- **Coordinate Systems:** Celestial coordinates (RA/DEC) and comoving distances

### Research Applications

- **Statistical Analysis:** Galaxy stellar mass function comparisons across environments
- **Classification Problems:** Star vs. galaxy vs. quasar object classification
- **Anomaly Detection:** Spectral outliers and unusual object identification
- **Large-Scale Structure:** Environmental dependence of galaxy properties
- **Time Series Analysis:** Redshift evolution and cosmic time dependencies

### Technical Characteristics

- **Data Types:** High-precision floating point spectral measurements
- **Coordinate Ranges:** RA (0-360°), DEC (-19.46° to 79.27°), z (0.001-6.4)
- **Statistical Requirements:** Rigorous significance testing and error analysis
- **Computational Scale:** Requires efficient algorithms for million-object datasets

### Infrastructure Integration

- **Database Host:** proj-pgsql01 (8 vCPU, 32GB RAM)
- **Processing Platform:** proj-dp01 (4 vCPU, 16GB RAM) for analysis workflows
- **Validation Framework:** Multi-stage data quality assurance pipeline
- **Performance:** Sub-10-second validation runtime for 6.4M records

---

## Cross-Domain Comparison

### Data Characteristics

| Aspect | Steam Dataset | DESI Dataset |
|--------|---------------|--------------|
| **Domain** | Commercial/Entertainment | Scientific Research |
| **Scale** | 239K applications | 6.4M galaxy records |
| **Data Types** | Mixed: text, numerical, categorical | Primarily numerical with high precision |
| **Structure** | Complex relational with unstructured text | Tabular with standardized measurements |
| **Quality Requirements** | Business intelligence standards | Scientific validation standards |
| **Update Frequency** | Dynamic (daily API changes) | Static (survey data release) |

### ML Application Patterns

| ML Technique | Steam Applications | DESI Applications |
|--------------|-------------------|------------------|
| **Classification** | Genre prediction, success forecasting | Object classification, environment assignment |
| **Regression** | Price prediction, rating estimation | Physical property estimation, redshift prediction |
| **Clustering** | Market segmentation, genre discovery | Galaxy population analysis, void identification |
| **NLP** | Review sentiment, description analysis | Minimal (metadata only) |
| **Anomaly Detection** | Fraud detection, outlier games | Unusual objects, spectral anomalies |
| **Recommendation** | Content-based game suggestions | Similar object identification |

### Infrastructure Considerations

- **Steam Dataset:** Emphasis on text processing, semantic search, complex joins
- **DESI Dataset:** Focus on numerical precision, statistical rigor, computational efficiency
- **Both:** Require PostgreSQL optimization, monitoring, and performance analysis

---

## Exercise Integration Strategy

### Data Selection Principles

Each IBM AI Engineering exercise selects the most appropriate dataset based on:

- **Algorithm Suitability:** Matching data characteristics to learning objectives
- **Complexity Progression:** Building from simple to complex applications
- **Domain Contrast:** Demonstrating versatility across different problem types
- **Infrastructure Utilization:** Showcasing different aspects of the technology stack

### Complementary Applications

- **Steam exercises** emphasize business intelligence, user behavior, and content analysis
- **DESI exercises** focus on scientific rigor, statistical analysis, and precision measurement
- **Combined exercises** demonstrate cross-domain methodology transfer and comparative analysis

### Technical Documentation

Each exercise includes:

- Dataset subset selection criteria and sampling methodology
- Data preprocessing and feature engineering decisions
- Infrastructure utilization patterns and performance metrics
- Cross-domain insights and methodology transfer analysis
-
