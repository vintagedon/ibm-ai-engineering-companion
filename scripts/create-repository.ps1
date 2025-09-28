# Create IBM AI Engineering Companion Repository Structure
# Creates all directories and stub files with -pending.md suffix

param(
    [string]$RepoPath = "ibm-ai-engineering-companion"
)

Write-Host "Creating IBM AI Engineering Companion repository structure at: $RepoPath" -ForegroundColor Green

# Create root directory
New-Item -Path $RepoPath -ItemType Directory -Force | Out-Null
Set-Location $RepoPath

# Create root files
@(
    "README-pending.md",
    "LICENSE-pending.md", 
    "requirements-pending.txt",
    ".gitignore-pending.md",
    ".env.example-pending.md"
) | ForEach-Object {
    "# Placeholder for $($_.Replace('-pending.md', '').Replace('-pending.txt', ''))" | Out-File -FilePath $_ -Encoding UTF8
}

# Create docs directory
New-Item -Path "docs" -ItemType Directory -Force | Out-Null
@(
    "docs/README-pending.md",
    "docs/environment-setup-pending.md",
    "docs/infrastructure-overview-pending.md", 
    "docs/methodology-pending.md",
    "docs/dataset-overview-pending.md",
    "docs/troubleshooting-pending.md"
) | ForEach-Object {
    "# Placeholder for docs/$($_.Split('/')[-1].Replace('-pending.md', ''))" | Out-File -FilePath $_ -Encoding UTF8
}

# Create scripts directory
New-Item -Path "scripts" -ItemType Directory -Force | Out-Null
@(
    "scripts/README-pending.md",
    "scripts/setup_environment-pending.sh",
    "scripts/database_connection_test-pending.py",
    "scripts/gpu_check-pending.py",
    "scripts/generate_exercise_template-pending.py"
) | ForEach-Object {
    "# Placeholder for scripts/$($_.Split('/')[-1].Replace('-pending.sh', '').Replace('-pending.py', '').Replace('-pending.md', ''))" | Out-File -FilePath $_ -Encoding UTF8
}

# Function to create exercise structure
function New-ExerciseStructure {
    param(
        [string]$CoursePath,
        [string]$ExerciseName,
        [string]$NotebookName
    )
    
    $ExercisePath = Join-Path $CoursePath $ExerciseName
    New-Item -Path $ExercisePath -ItemType Directory -Force | Out-Null
    
    # Create exercise files
    @(
        "$ExercisePath/README-pending.md",
        "$ExercisePath/worklog-pending.md", 
        "$ExercisePath/$NotebookName-pending.ipynb",
        "$ExercisePath/project-ideas-pending.md",
        "$ExercisePath/requirements-pending.txt"
    ) | ForEach-Object {
        "# Placeholder for $($_.Split('/')[-1].Replace('-pending.md', '').Replace('-pending.ipynb', '').Replace('-pending.txt', ''))" | Out-File -FilePath $_ -Encoding UTF8
    }
    
    # Create src directory
    New-Item -Path "$ExercisePath/src" -ItemType Directory -Force | Out-Null
    @(
        "$ExercisePath/src/data_extraction-pending.py",
        "$ExercisePath/src/model_training-pending.py",
        "$ExercisePath/src/visualization-pending.py"
    ) | ForEach-Object {
        "# Placeholder for src/$($_.Split('/')[-1].Replace('-pending.py', ''))" | Out-File -FilePath $_ -Encoding UTF8
    }
    
    # Create artifacts directory
    New-Item -Path "$ExercisePath/artifacts" -ItemType Directory -Force | Out-Null
    "# Placeholder directory for exercise artifacts (models, visualizations, metrics)" | Out-File -FilePath "$ExercisePath/artifacts/.gitkeep-pending.md" -Encoding UTF8
}

# Course 1: Machine Learning with Python
Write-Host "Creating Course 1: Machine Learning with Python..." -ForegroundColor Yellow
New-Item -Path "C01_Machine_Learning_with_Python" -ItemType Directory -Force | Out-Null
"# Placeholder for Course 1 README" | Out-File -FilePath "C01_Machine_Learning_with_Python/README-pending.md" -Encoding UTF8

New-ExerciseStructure "C01_Machine_Learning_with_Python" "E1_Steam_Review_Score_Regression" "steam_regression"
New-ExerciseStructure "C01_Machine_Learning_with_Python" "E2_DESI_Object_Classification" "desi_classification" 
New-ExerciseStructure "C01_Machine_Learning_with_Python" "E3_Steam_Genre_Clustering" "steam_clustering"

# Course 2: Deep Learning with Keras
Write-Host "Creating Course 2: Deep Learning with Keras..." -ForegroundColor Yellow
New-Item -Path "C02_Intro_to_Deep_Learning_Keras" -ItemType Directory -Force | Out-Null
"# Placeholder for Course 2 README" | Out-File -FilePath "C02_Intro_to_Deep_Learning_Keras/README-pending.md" -Encoding UTF8

New-ExerciseStructure "C02_Intro_to_Deep_Learning_Keras" "E1_Steam_Price_Prediction_DNN" "steam_dnn_regression"
New-ExerciseStructure "C02_Intro_to_Deep_Learning_Keras" "E2_DESI_Quasar_Detection" "desi_quasar_classifier"
New-ExerciseStructure "C02_Intro_to_Deep_Learning_Keras" "E3_Steam_Era_Classification" "steam_era_classifier"

# Course 3: Advanced Deep Learning
Write-Host "Creating Course 3: Deep Learning with Keras and TensorFlow..." -ForegroundColor Yellow
New-Item -Path "C03_Deep_Learning_Keras_TensorFlow" -ItemType Directory -Force | Out-Null
"# Placeholder for Course 3 README" | Out-File -FilePath "C03_Deep_Learning_Keras_TensorFlow/README-pending.md" -Encoding UTF8

New-ExerciseStructure "C03_Deep_Learning_Keras_TensorFlow" "E1_Steam_Image_Genre_CNN" "steam_image_cnn"
New-ExerciseStructure "C03_Deep_Learning_Keras_TensorFlow" "E2_DESI_Spectral_Anomaly_Autoencoder" "desi_autoencoder_anomaly"
New-ExerciseStructure "C03_Deep_Learning_Keras_TensorFlow" "E3_Custom_Attention_Layer" "custom_attention_layer"

# Course 12: AI Agents and RAG
Write-Host "Creating Course 12: AI Agents, RAG, and LangChain..." -ForegroundColor Yellow
New-Item -Path "C12_AI_Agents_RAG_LangChain" -ItemType Directory -Force | Out-Null
"# Placeholder for Course 12 README" | Out-File -FilePath "C12_AI_Agents_RAG_LangChain/README-pending.md" -Encoding UTF8

New-ExerciseStructure "C12_AI_Agents_RAG_LangChain" "E1_Steam_Recommender_LangChain" "steam_recommender"
New-ExerciseStructure "C12_AI_Agents_RAG_LangChain" "E2_DESI_RAG_Query_System" "desi_rag_system"
New-ExerciseStructure "C12_AI_Agents_RAG_LangChain" "E3_LangChain_Agent_Tools" "langchain_agent"

# Course 13: Capstone Project
Write-Host "Creating Course 13: Project - GenAI Applications..." -ForegroundColor Yellow
New-Item -Path "C13_Project_GenAI_Applications" -ItemType Directory -Force | Out-Null
"# Placeholder for Course 13 README" | Out-File -FilePath "C13_Project_GenAI_Applications/README-pending.md" -Encoding UTF8

# Exercise 1: Fine-tuning
New-ExerciseStructure "C13_Project_GenAI_Applications" "E1_Fine_Tune_Game_Descriptions" "fine_tuning"

# Exercise 2: RAG Bot with Gradio
$E2Path = "C13_Project_GenAI_Applications/E2_Game_QA_Bot_RAG_Gradio"
New-ExerciseStructure "C13_Project_GenAI_Applications" "E2_Game_QA_Bot_RAG_Gradio" "rag_bot"

# Add app directory for E2
New-Item -Path "$E2Path/app" -ItemType Directory -Force | Out-Null
@(
    "$E2Path/app/main-pending.py",
    "$E2Path/app/requirements-pending.txt"
) | ForEach-Object {
    "# Placeholder for app/$($_.Split('/')[-1].Replace('-pending.py', '').Replace('-pending.txt', ''))" | Out-File -FilePath $_ -Encoding UTF8
}

New-Item -Path "$E2Path/app/templates" -ItemType Directory -Force | Out-Null
"# Placeholder directory for HTML templates" | Out-File -FilePath "$E2Path/app/templates/.gitkeep-pending.md" -Encoding UTF8

# Exercise 3: Deployment Pipeline  
$E3Path = "C13_Project_GenAI_Applications/E3_Deploy_Game_Description_Generator"
New-ExerciseStructure "C13_Project_GenAI_Applications" "E3_Deploy_Game_Description_Generator" "deployment"

# Add deployment-specific directories for E3
New-Item -Path "$E3Path/app" -ItemType Directory -Force | Out-Null
@(
    "$E3Path/app/main-pending.py",
    "$E3Path/app/model-pending.pkl", 
    "$E3Path/app/requirements-pending.txt"
) | ForEach-Object {
    "# Placeholder for app/$($_.Split('/')[-1].Replace('-pending.py', '').Replace('-pending.pkl', '').Replace('-pending.txt', ''))" | Out-File -FilePath $_ -Encoding UTF8
}

"# Placeholder for Dockerfile" | Out-File -FilePath "$E3Path/Dockerfile-pending.md" -Encoding UTF8

New-Item -Path "$E3Path/k8s" -ItemType Directory -Force | Out-Null
@(
    "$E3Path/k8s/deployment-pending.yaml",
    "$E3Path/k8s/service-pending.yaml"
) | ForEach-Object {
    "# Placeholder for k8s/$($_.Split('/')[-1].Replace('-pending.yaml', ''))" | Out-File -FilePath $_ -Encoding UTF8
}

# Add specialized artifacts directories for E3
New-Item -Path "$E3Path/artifacts/deployment_screenshots" -ItemType Directory -Force | Out-Null
New-Item -Path "$E3Path/artifacts/performance_monitoring" -ItemType Directory -Force | Out-Null
"# Placeholder directory for deployment evidence (kubectl outputs, screenshots)" | Out-File -FilePath "$E3Path/artifacts/deployment_screenshots/.gitkeep-pending.md" -Encoding UTF8
"# Placeholder directory for service metrics and monitoring data" | Out-File -FilePath "$E3Path/artifacts/performance_monitoring/.gitkeep-pending.md" -Encoding UTF8

# Create placeholder courses for C04-C11 (abbreviated)
Write-Host "Creating placeholder structure for Courses 4-11..." -ForegroundColor Yellow
4..11 | ForEach-Object {
    $courseName = "C{0:D2}_Course_Placeholder" -f $_
    New-Item -Path $courseName -ItemType Directory -Force | Out-Null
    "# Placeholder for Course $_ - Structure will follow same pattern as C01-C03" | Out-File -FilePath "$courseName/README-pending.md" -Encoding UTF8
}

Write-Host "`nRepository structure created successfully!" -ForegroundColor Green
Write-Host "Location: $(Get-Location)" -ForegroundColor Cyan
Write-Host "`nNext steps:" -ForegroundColor White
Write-Host "1. Review generated structure" -ForegroundColor Gray
Write-Host "2. Initialize git repository: git init" -ForegroundColor Gray  
Write-Host "3. Begin with Course 1 exercises after completing IBM Module 1" -ForegroundColor Gray
Write-Host "4. Remove -pending suffixes and populate content as you progress" -ForegroundColor Gray

# Display structure summary
Write-Host "`nStructure Summary:" -ForegroundColor White
Write-Host "- Root files: 5" -ForegroundColor Gray
Write-Host "- Documentation files: 6" -ForegroundColor Gray  
Write-Host "- Utility scripts: 5" -ForegroundColor Gray
Write-Host "- Course directories: 13" -ForegroundColor Gray
Write-Host "- Fully structured exercises: 12" -ForegroundColor Gray
Write-Host "- Total files created: $((Get-ChildItem -Recurse -File).Count)" -ForegroundColor Gray