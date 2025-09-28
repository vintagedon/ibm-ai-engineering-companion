# 📊 Steam Review Score Regression

Applying linear regression concepts to predict game review scores using production-scale gaming data.

---

## 📚 What We Learned from IBM Course 1

### Linear Regression Fundamentals

Linear regression finds the best straight line through data points to make predictions about new data. The IBM coursework taught us that regression algorithms work by minimizing the distance between predicted values and actual values, creating a mathematical relationship between input features (like price) and target variables (like review scores).

We learned about key concepts including:

- **Model Training:** Using historical data to find the optimal line equation
- **Feature Selection:** Choosing which variables help predict the target
- **Model Evaluation:** Using metrics like R² and RMSE to measure prediction accuracy
- **Overfitting Prevention:** Ridge regression adds penalties to prevent overly complex models

The course examples used clean datasets like housing prices or simple business metrics. The algorithms learned to predict continuous numerical outcomes based on input features.

### Why This Matters

Linear regression is foundational because it's interpretable - you can understand exactly how each feature influences the prediction. In business contexts, this interpretability is often more valuable than complex algorithms that act like black boxes.

---

## 🎯 How We Apply This to Real-World Data

### The Gaming Industry Challenge

Can we predict whether a game will be well-received based on characteristics we can measure before or at launch? This is a real business problem - game publishers spend millions on development and marketing, and understanding what drives positive reviews helps guide investment decisions.

Using the Steam dataset (239,664 games), we're applying linear regression to predict review scores based on:

- **Price point:** Does pricing strategy affect player satisfaction?
- **Developer experience:** Do experienced developers create better-reviewed games?
- **Content volume:** Do more achievements or DLC correlate with positive reviews?
- **Platform availability:** Does multi-platform release impact reception?

### Real-World Complexity

Unlike IBM's clean examples, this data presents realistic challenges:

- **Multiple tables:** Game information is spread across games, developers, DLC, and achievements tables
- **Missing data:** Not all games have complete information
- **Scale:** 150,000+ games require optimized database queries
- **Feature engineering:** We must create meaningful variables from raw data

### Production Implementation

The exercise demonstrates enterprise patterns:

- **Database optimization:** Complex SQL joins on proj-pgsql01 (8 vCPU, 32GB RAM)
- **Performance monitoring:** Query execution time and resource utilization
- **Model comparison:** Linear vs Ridge regression for handling correlated features
- **Reproducible pipelines:** Modular code structure for production deployment

---

## 🛠️ Technical Implementation

### Database Integration Challenge

Unlike IBM's CSV examples, we extract features through multi-table SQL queries:

```sql
SELECT 
    g.name,
    g.positive_ratings::float / NULLIF(g.positive_ratings + g.negative_ratings, 0) as review_score,
    g.price,
    COALESCE(dev.games_count, 1) as developer_experience,
    COUNT(DISTINCT dlc.id) as dlc_count
FROM games g
LEFT JOIN developers dev ON g.developer = dev.name
LEFT JOIN dlc ON dlc.steam_id = g.steam_id
WHERE g.positive_ratings + g.negative_ratings >= 50
GROUP BY g.id, dev.games_count
```

### Regression Model Application

Applying IBM's linear regression concepts to gaming data:

```python
from sklearn.linear_model import LinearRegression, Ridge
from sklearn.model_selection import train_test_split
from sklearn.metrics import r2_score, mean_squared_error

# Train models using IBM coursework techniques
linear_model = LinearRegression()
ridge_model = Ridge(alpha=1.0)

# Evaluate using metrics from course material
linear_r2 = r2_score(y_test, linear_predictions)
ridge_r2 = r2_score(y_test, ridge_predictions)
```

---

## 📋 Exercise Structure

```markdown
E1_Steam_Review_Score_Regression/
├── 📄 README.md                    # This project guide
├── 📄 worklog.md                   # Development decisions and database optimization
├── 📄 steam_regression.ipynb       # Complete analysis applying IBM concepts
├── 📄 project-ideas.md             # Alternative datasets for similar analysis
├── 📁 src/                         # Production-ready implementation
│   ├── 📄 data_extraction.py       # PostgreSQL feature engineering
│   ├── 📄 model_training.py        # Linear and Ridge regression models
│   └── 📄 visualization.py         # Model evaluation plots
├── 📁 artifacts/                   # Results demonstrating real-world application
│   ├── 📄 ridge_model.pkl          # Best performing model
│   ├── 📄 prediction_accuracy.png  # Actual vs predicted visualization
│   ├── 📄 feature_importance.png   # Variable impact analysis
│   └── 📄 model_metrics.json       # R², RMSE, performance measurements
└── 📄 requirements.txt             # Course 1 Python dependencies
```

---

## 🎯 Success Criteria

**IBM Concepts Applied:**

- ✅ Linear regression implementation using scikit-learn
- ✅ Model evaluation with R² and RMSE metrics
- ✅ Feature scaling and preprocessing techniques
- ✅ Ridge regression for multicollinearity handling

**Real-World Extensions:**

- ✅ Multi-table database feature engineering
- ✅ Production-scale data processing (150K+ records)
- ✅ Infrastructure performance optimization
- ✅ Business-relevant model interpretation

**Expected Outcomes:**

- **Model Performance:** R² between 0.3-0.5 (reasonable for review prediction)
- **Key Insights:** Developer experience and pricing strategy as primary predictors
- **Database Performance:** Feature extraction completing in under 2 minutes
- **Business Value:** Actionable insights for game development investment decisions

---

*Exercise applying IBM Course 1 linear regression concepts to production gaming analytics data*
