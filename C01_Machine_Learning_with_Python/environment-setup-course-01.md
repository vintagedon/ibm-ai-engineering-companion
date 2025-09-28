# Environment Setup - Course 1: Machine Learning with Python

This document provides environment setup for the first three exercises (C01.E1-E3) covering machine learning fundamentals. Each course will have its own requirements file as dependencies evolve.

---

## Python Environment Requirements

### requirements.txt for Course 1

```txt
# Core Data Science Stack
numpy>=1.24.0
pandas>=2.0.0
scikit-learn>=1.3.0

# Database Connectivity
psycopg2-binary>=2.9.0
sqlalchemy>=2.0.0

# Visualization and Analysis
matplotlib>=3.7.0
seaborn>=0.12.0
plotly>=5.15.0

# Machine Learning Extensions
scipy>=1.10.0
statsmodels>=0.14.0

# Text Processing (for clustering exercise)
nltk>=3.8.0
scikit-learn[text]

# Environment and Configuration
python-dotenv>=1.0.0

# Jupyter Development
jupyter>=1.0.0
ipykernel>=6.25.0

# Utilities
tqdm>=4.65.0
```

---

## Dependency Explanations

### Core Data Science Stack

- **numpy**: Fundamental package for numerical computing, matrix operations for ML algorithms
- **pandas**: Data manipulation and analysis, essential for PostgreSQL query results processing
- **scikit-learn**: Primary ML library for regression, classification, and clustering algorithms

### Database Integration

- **psycopg2-binary**: PostgreSQL adapter for Python, enables connection to proj-pgsql01
- **sqlalchemy**: SQL toolkit providing ORM and core database abstraction

### Visualization Libraries

- **matplotlib**: Basic plotting for model evaluation and data exploration
- **seaborn**: Statistical visualization, particularly useful for correlation analysis
- **plotly**: Interactive visualizations for infrastructure monitoring charts

### Statistical Analysis

- **scipy**: Scientific computing functions, statistical tests for model validation
- **statsmodels**: Advanced statistical modeling and hypothesis testing

### Text Processing

- **nltk**: Natural Language Toolkit for Steam game description clustering (C01.E3)
- **scikit-learn[text]**: Text vectorization and TF-IDF functionality

### Development Tools

- **python-dotenv**: Environment variable management for database credentials
- **jupyter**: Interactive development environment for exploratory analysis
- **tqdm**: Progress bars for long-running data processing operations

---

## Infrastructure Setup

### Database Connection Configuration

Create `.env` file in project root:

```bash
# PostgreSQL Configuration
DB_HOST=10.25.20.8  # proj-pgsql01
DB_PORT=5432
DB_NAME_STEAM=steam_db
DB_NAME_DESI=desi_db
DB_USER=your_username
DB_PASSWORD=your_password

# Optional: Connection pooling
DB_POOL_SIZE=5
DB_MAX_OVERFLOW=10
```

### Environment Verification Script

```python
# verify_environment.py
import sys
import importlib.util

def check_package(package_name, min_version=None):
    """Check if package is installed and optionally verify version."""
    try:
        spec = importlib.util.find_spec(package_name)
        if spec is None:
            return False, "Not installed"
        
        module = importlib.import_module(package_name)
        if hasattr(module, '__version__'):
            version = module.__version__
            if min_version and version < min_version:
                return False, f"Version {version} < {min_version}"
            return True, f"Version {version}"
        return True, "Installed"
    except ImportError:
        return False, "Import failed"

# Core requirements check
requirements = [
    ('numpy', '1.24.0'),
    ('pandas', '2.0.0'),
    ('sklearn', '1.3.0'),
    ('psycopg2', None),
    ('sqlalchemy', '2.0.0'),
    ('matplotlib', '3.7.0'),
    ('seaborn', '0.12.0')
]

print("Environment Verification for Course 1:")
print("-" * 40)

all_good = True
for package, min_ver in requirements:
    installed, info = check_package(package, min_ver)
    status = "✓" if installed else "✗"
    print(f"{status} {package:15} {info}")
    if not installed:
        all_good = False

print("-" * 40)
print(f"Environment Status: {'READY' if all_good else 'NEEDS ATTENTION'}")
```

---

## Course-Specific Notes

### C01.E1: Steam Review Score Regression

- Heavy PostgreSQL usage requiring robust connection handling
- Statistical analysis with scipy for model evaluation
- Visualization for prediction vs actual comparisons

### C01.E2: DESI Object Classification  

- Large dataset processing requiring memory-efficient pandas operations
- Scikit-learn classification algorithms and evaluation metrics
- Statistical validation for scientific-grade results

### C01.E3: Steam Genre Clustering

- NLTK for text preprocessing of game descriptions
- TF-IDF vectorization through scikit-learn
- Dimensionality reduction for cluster visualization

---

## Installation Instructions

### Option 1: Virtual Environment

```bash
# Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install requirements
pip install -r requirements.txt

# Verify installation
python verify_environment.py
```

### Option 2: Conda Environment

```bash
# Create conda environment
conda create -n ibm-ai-c01 python=3.9

# Activate environment
conda activate ibm-ai-c01

# Install requirements
pip install -r requirements.txt
```

---

## Next Courses

Environment setup documents for subsequent courses will be provided as exercises are developed:

- **Course 2**: Deep learning dependencies (TensorFlow/Keras, GPU support)
- **Course 3**: Advanced frameworks (custom layers, computer vision libraries)
- **Course 12-13**: Production deployment (Docker, Kubernetes, LangChain)

Each course builds upon the previous environment while adding specialized dependencies for new concepts and infrastructure integration patterns.
