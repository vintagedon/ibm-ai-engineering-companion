# 🤖 IBM AI Engineering Professional Certificate Companion

> Personal companion work applying IBM certificate concepts to research datasets and infrastructure.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.9+](https://img.shields.io/badge/python-3.9+-blue.svg)](https://www.python.org/downloads/)
[![PostgreSQL 16](https://img.shields.io/badge/PostgreSQL-16-336791?logo=postgresql)](https://www.postgresql.org/)
[![pgvector](https://img.shields.io/badge/pgvector-enabled-green.svg)](https://github.com/pgvector/pgvector)
[![TensorFlow](https://img.shields.io/badge/TensorFlow-2.x-FF6F00?logo=tensorflow)](https://www.tensorflow.org/)
[![PyTorch](https://img.shields.io/badge/PyTorch-2.x-EE4C2C?logo=pytorch)](https://pytorch.org/)
[![scikit-learn](https://img.shields.io/badge/scikit--learn-1.x-F7931E?logo=scikit-learn)](https://scikit-learn.org/)
[![LangChain](https://img.shields.io/badge/LangChain-0.1.x-1C3C3C?logo=langchain)](https://langchain.com/)
[![CUDA](https://img.shields.io/badge/CUDA-RTX%20A4000-76B900?logo=nvidia)](https://developer.nvidia.com/cuda-zone)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-RKE2-326CE5?logo=kubernetes)](https://rke2.io/)
[![Milvus](https://img.shields.io/badge/Milvus-2.x-00D4AA?logo=milvus)](https://milvus.io/)
[![Neo4j](https://img.shields.io/badge/Neo4j-5.x-008CC1?logo=neo4j)](https://neo4j.com/)
[![Proxmox](https://img.shields.io/badge/Proxmox-VE-E57000?logo=proxmox)](https://www.proxmox.com/)

This repository documents my companion work to the IBM AI Engineering Professional Certificate. I'm taking the concepts from each course module and applying them to research problems using datasets and infrastructure from my ongoing projects.

As someone who works as a systems engineer for an MSP and also does citizen science in astronomy, I have access to data from both commercial analytics and scientific research domains and thought this a unique opportunity to apply the methodologies to my own research.

---

## 📖 Repository Purpose

The IBM AI Engineering Certificate covers machine learning, deep learning, and generative AI through structured coursework. This companion work extends that learning by applying each concept to problems using production datasets and infrastructure I already have running.

I'm sharing this work to document my learning process and to show how course concepts can be applied to specialized domains. Others taking similar courses might find the methodology useful for developing their own advanced applications.

### Approach

Each exercise follows this pattern:

1. Complete the IBM module (coursework, quizzes/tests, and module projects)
2. Apply those concepts to problems using my research datasets
3. Document the methodology and results comprehensively

This transforms theoretical learning into practical application with production-scale complexity, with a peek inside engineering decisions, infrastructure performance and tuning, scripting and more.

---

## 🎯 Cross-Domain Application

The exercises demonstrate how AI/ML concepts transfer across different problem domains:

**Gaming Industry Analytics:** Commercial data with business intelligence applications

- Market analysis, content classification, user behavior modeling
- Text processing, sentiment analysis, recommendation systems

**Astrophysics Research:** Scientific data requiring statistical rigor and computational efficiency

- Large-scale survey analysis, object classification, anomaly detection
- High-dimensional analysis, signal processing, hypothesis testing

**Infrastructure Integration:** Production-scale implementation patterns

- Database optimization, GPU resource management, container deployment
- Performance monitoring, scalability considerations, automation pipelines

Working across these different domains develops technical versatility and demonstrates how the same algorithms solve very different types of problems.

---

## 🛠️ Infrastructure

### Laboratory Environment

| Service Role | VM Host | Specifications | AI/ML Application |
|--------------|---------|----------------|-------------------|
| Primary Database | proj-pgsql01 | 8 vCPU, 32GB RAM, NVMe | PostgreSQL 16 for relational data |
| Vector Embeddings | proj-pgsql01 | | pgvector extension for semantic search |
| Geospatial Analysis | proj-pgsql01 | | PostGIS extension for spatial data |
| Standalone Vector DB | proj-milvus01 | 6 vCPU, 24GB RAM, NVMe | Milvus for large-scale vector operations |
| Graph Database | proj-node4j01 | 6 vCPU, 24GB RAM, NVMe | Neo4j for relationship analysis |
| Data Processing | proj-dp01 | 4 vCPU, 16GB RAM, NVMe | Analysis workloads and ETL pipelines |
| GPU Acceleration | proj-gpu01 | 8 vCPU, 32GB RAM, RTX A4000 | Deep learning training and inference |
| Container Platform | proj-k8s01-03 | 16 vCPU, 82GB RAM each | Kubernetes deployment and orchestration |

This infrastructure enables exercises that go beyond laptop-scale work into patterns used in production environments: complex database architectures, GPU optimization, container orchestration, and comprehensive monitoring.

---

## 📊 Research Datasets

### Steam Dataset 2025: Gaming Analytics Platform

- **Repository:** [steam-dataset-2025](https://github.com/vintagedon/steam-dataset-2025)
- **Scale:** 239,664 applications from comprehensive Steam catalog
- **Architecture:** Multi-modal PostgreSQL with relational, document, and vector components
- **Applications:** Market analysis, content classification, recommendation systems
- **Status:** Production complete with full analytics platform operational

### DESI Cosmic Void Galaxies: Astrophysics Research

- **Repository:** [desi-cosmic-void-galaxies](https://github.com/Proxmox-Astronomy-Lab/desi-cosmic-void-galaxies)
- **Scale:** 6.4M galaxy records from DESI DR1 astronomical survey
- **Research Focus:** Environmental effects on galaxy evolution in cosmic voids
- **Applications:** Statistical analysis, classification, large-scale structure studies
- **Status:** Active development with database validation complete

### Dataset Access

Both datasets come from my ongoing research projects. The repository contains:

- Complete methodology and implementation code for each exercise
- Static notebooks with embedded results and analysis
- Infrastructure utilization data and performance metrics
- Comprehensive documentation of research decisions

The value is in demonstrating systematic methodology for applying AI/ML concepts to specialized domains using production infrastructure.

---

## 📋 Exercise Overview

### Development Timeline

| Course Module | Focus Area | Exercises | Status | Completion Target |
|---------------|------------|-----------|--------|------------------|
| **C01** | Machine Learning Foundations | 3 exercises | PENDING | Course + 1 week |
| **C02** | Deep Learning & Keras | 3 exercises | PENDING | Course + 1 week |
| **C03** | Advanced Keras & TensorFlow | 3 exercises | PENDING | Course + 1 week |
| **C04-C11** | Specialized Applications | 24 exercises | PENDING | Sequential |
| **C12** | AI Agents & RAG | 3 exercises | PENDING | Course + 1 week |
| **C13** | Production Deployment | 3 exercises | PENDING | Course + 1 week |

### Example Applications

**C1.E1: Steam Market Analysis with Regression** (PENDING)

- IBM Foundation: Linear regression and model evaluation techniques
- My Application: Multi-table database joins, complex feature engineering, commercial success prediction
- Infrastructure: PostgreSQL optimization, query performance analysis

**C3.E1: Game Genre Classification via Computer Vision** (PENDING)

- IBM Foundation: Convolutional neural network fundamentals
- My Application: Steam header image analysis, custom CNN architecture, data augmentation
- Infrastructure: GPU utilization optimization, training performance monitoring

**C13.E3: Production Model Deployment Pipeline** (PENDING)

- IBM Foundation: Model serving and deployment concepts
- My Application: Docker containerization, Kubernetes orchestration, monitoring integration
- Infrastructure: Complete MLOps pipeline from training to production

---

## 📂 Repository Structure

```markdown
ibm-ai-engineering-companion/
├── README.md
├── LICENSE
├── requirements.txt
├── .gitignore
│
├── docs/                                   # Setup guides and methodology
│   ├── environment-setup.md               # Infrastructure configuration
│   ├── methodology.md                     # Development approach
│   └── dataset-overview.md                # Research data descriptions
│
├── C01_Machine_Learning_with_Python/      # PENDING
│   ├── E1_Steam_Review_Score_Regression/  # PENDING
│   │   ├── README.md                      # Exercise context and results
│   │   ├── worklog.md                     # Development process
│   │   ├── steam_regression.ipynb         # Static analysis notebook
│   │   ├── project-ideas.md               # Alternative dataset applications
│   │   ├── src/                           # Modular implementation
│   │   └── artifacts/                     # Models and performance data
│   ├── E2_DESI_Object_Classification/     # PENDING
│   └── E3_Steam_Genre_Clustering/         # PENDING
│
├── C02_Intro_to_Deep_Learning_Keras/      # PENDING
├── C03_Deep_Learning_Keras_TensorFlow/    # PENDING
├── ... (C04-C11)                          # PENDING
├── C12_AI_Agents_RAG_LangChain/           # PENDING
│
├── C13_Project_GenAI_Applications/        # PENDING
│   └── E3_Deploy_Game_Description_Generator/
│       ├── app/                           # Flask application code
│       ├── Dockerfile                     # Container specification
│       ├── k8s/                           # Kubernetes manifests
│       └── artifacts/deployment_screenshots/ # Infrastructure evidence
│
└── scripts/                               # Infrastructure utilities
    ├── setup_environment.sh              # Environment automation
    ├── database_connection_test.py        # Connectivity validation
    └── gpu_check.py                      # Hardware verification
```

---

## ⚙️ Methodology

### Development Framework

Each exercise applies systematic methodology:

- **Request:** Define the learning objective from IBM content and choose appropriate research problem
- **Analyze:** Design technical approach integrating course concepts with domain requirements
- **Verify:** Validate approach against research standards and infrastructure constraints
- **Generate:** Implement solution with production-scale considerations
- **Validate:** Evaluate results and document performance characteristics
- **Reflect:** Document insights and improvement opportunities

### Documentation Standards

- **Complete methodology:** Decision rationale and alternative approaches considered
- **Infrastructure evidence:** GPU utilization data, database performance metrics, deployment validation
- **Reproducible process:** Comprehensive code documentation and environment specifications
- **Cross-domain insights:** Comparative analysis between gaming analytics and astrophysics applications

---

## 🚀 Using This Work

### For Certificate Students

While you cannot reproduce these exact exercises with my datasets currently (they ARE slated for release), you can:

- Adapt the methodology to your available data
- Use the database schema designs as templates
- Apply the infrastructure patterns to your own projects
- Reference the documentation standards for your portfolio

### For Technical Review

Each exercise includes:

- **README.md:** Problem context, technical approach, and results summary
- **worklog.md:** Complete development process with decisions and iterations
- **Static notebooks:** Pre-executed code with embedded visualizations and explanations
- **Infrastructure evidence:** Screenshots and metrics from GPU utilization, query performance, deployment status

### For Learning Inspiration

The progression from basic ML concepts to enterprise deployment demonstrates how certificate knowledge can be extended into production-ready capabilities using available infrastructure and datasets.

---

## 🤝 Contributing

This is personal learning work, but contributions that advance the methodology are welcome:

- **Documentation improvements:** Better explanations of technical approaches
- **Methodology enhancements:** Improved frameworks for applying coursework to complex problems
- **Alternative implementations:** Different approaches to similar problems using available datasets

---

## 📄 License & Citation

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

If this methodology proves useful for your own work:

```bibtex
@misc{ibm_ai_companion_2025,
  title={IBM AI Engineering Professional Certificate Companion: Research Applications},
  author={Donald Fountain},
  year={2025},
  url={https://github.com/vintagedon/ibm-ai-engineering-companion},
  note={Methodology for applying AI/ML coursework to specialized research domains}
}
```

**Author:** Donald Fountain  
**ORCID:** [0009-0008-7695-4093](https://orcid.org/0009-0008-7695-4093)  
**Professional Context:** Systems Engineer (Managed Services) & Citizen Scientist  
**Research Focus:** Cross-domain AI applications using production infrastructure

---

## 🔗 Related Work

- [Steam Dataset 2025](https://github.com/vintagedon/steam-dataset-2025) - Multi-modal gaming analytics platform
- [DESI Cosmic Void Galaxies](https://github.com/Proxmox-Astronomy-Lab/desi-cosmic-void-galaxies) - Large-scale astronomical survey analysis

---

*Documentation of systematic methodology applying IBM AI Engineering concepts to research domains through production infrastructure.*
