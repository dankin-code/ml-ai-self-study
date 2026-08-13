# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains the source code for "Python Machine Learning by Example, Fourth Edition" published by Packt Publishing, authored by Yuxi (Hayden) Liu. The codebase consists of educational examples organized by book chapters (ch2-ch15), demonstrating various machine learning algorithms and techniques.

## Repository Structure

- **Chapter-based organization**: Each folder (`ch2/`, `ch3/`, etc.) contains code examples for that specific chapter
- **Dual format files**: Most chapters include both Jupyter notebooks (`.ipynb`) and Python scripts (`.py`) 
- **Data files**: Some chapters include sample datasets (e.g., `ch5/` contains stock price CSV files, `ch12/ch13/` contain text files)
- **No build system**: This is an educational repository without traditional build/test infrastructure

## Running Code Examples

### Python Scripts
```bash
# Navigate to specific chapter directory
cd ch2/
python ch2_part1.py

# Or run from root directory
python ch2/ch2_part1.py
```

### Jupyter Notebooks
```bash
# Start Jupyter and navigate to desired chapter
jupyter notebook
# Then open the specific .ipynb file in the browser

# Or run directly
jupyter notebook ch2/ch2_part1.ipynb
```

### Notebook Conversion
Most notebooks include a conversion cell at the end:
```python
!jupyter nbconvert --to python ch2_part1.ipynb --TemplateExporter.exclude_input_prompt=True
```

## Dependencies and Libraries

The codebase uses multiple ML/AI libraries across different chapters:

- **Core ML**: `scikit-learn`, `numpy`, `pandas`
- **Deep Learning**: `torch`, `torchtext` (chapters 12-15)
- **Visualization**: `matplotlib`, `seaborn` (implied usage)
- **Text Processing**: `torchtext`, `re`, `collections`
- **Statistical**: `scipy` (implied usage)

No requirements.txt or environment files are present. Dependencies must be installed manually based on import statements in each chapter.

## Code Architecture Patterns

### Chapter Structure
Each chapter follows a consistent pattern:
1. **Header comment block** with chapter title, author, and book information
2. **Educational sections** marked with markdown-style comments (`# #`, `# ##`)
3. **Incremental examples** building from basic implementations to scikit-learn usage
4. **From-scratch implementations** before showing library alternatives

### Implementation Approach
- **Educational focus**: Code emphasizes clarity and learning over production efficiency
- **Incremental complexity**: Examples start simple and add complexity progressively  
- **Comparative examples**: Often shows manual implementation followed by library version
- **Self-contained**: Each chapter/part can typically run independently

### Common Patterns
- Function definitions with detailed docstrings explaining parameters and return values
- Step-by-step variable assignments for educational clarity
- Print statements showing intermediate results
- Comparison between custom implementations and scikit-learn equivalents

## Key Files by Topic

- **Naive Bayes**: `ch2/` - Movie recommendation engine
- **Regression**: `ch5/` - Stock price prediction with feature engineering
- **Best Practices**: `ch10/` - Data preparation, feature selection, dimensionality reduction
- **Deep Learning/NLP**: `ch12/`-`ch15/` - Text processing with PyTorch

## Development Notes

- No testing framework is implemented
- No linting or code quality tools configured
- Code style follows standard Python conventions with educational verbosity
- Each chapter is self-contained and can be worked on independently
- Some chapters have multiple parts (e.g., `ch2_part1.py`, `ch2_part2.py`)