---
title: Review of Interpretability and Stability in Soft Sensors
date: 2026-01-12
layout: post
importance: 1
category: Soft Sensors, Machine Learning
tags: Interpretability
toc: sidebar: left
---

# Short note about the review paper "Comprehensive Analysis on Machine Learning Approaches for Interpretable and Stable Soft Sensors"

Recently, an interesting review paper on soft sensors was published.

## Overview

Soft sensors are essential in industrial process monitoring for estimating difficult-to-measure quality variables. While data-driven models (especially deep learning) have improved accuracy, they often face two critical challenges: they operate as "black boxes" lacking transparency, and they suffer from instability under shifting industrial conditions.

This post summarizes a recent 2025 review paper published in IEEE Transactions on Instrumentation and Measurement, which provides a comprehensive analysis of methodologies to enhance both the interpretability and stability of these systems.

## The Core Challenges

### Interpretability

- Operators and engineers need to understand the decision-making process of a model to trust it, especially in high-stakes applications.
- There is often a trade-off: simple models (e.g., linear regression) are interpretable but less accurate, while complex models (e.g., deep neural networks) are accurate but opaque.

### Stability

- Industrial environments are dynamic; models assume a consistent data distribution, but real-world data often shifts (data drift).
- Models based solely on correlations may fail when environmental conditions change, whereas causal relationships tend to remain stable.

## Solutions and Methodologies

### Enhancing Interpretability

The paper categorizes Interpretable Machine Learning (IML) into two main dimensions:

- **Intrinsic vs. Post-hoc**: Intrinsic models are inherently transparent (e.g., Decision Trees), while post-hoc methods explain complex models after training.
- **Global vs. Local**: Global methods explain the model's overall behavior, while local methods explain specific individual predictions.

Prominent post-hoc methods reviewed include LIME (Local Interpretable Model-agnostic Explanations) and SHAP (Shapley Additive Explanations), which provide instance-specific insights and feature attributions.

### Ensuring Stability via Causal ML

To address stability, the authors emphasize Causal Machine Learning. Unlike traditional correlation-based learning, causal methods identify directional cause-and-effect relationships.

- **Causal Discovery**: Techniques to identify causal structures from observational data, categorized into constraint-based, score-based, and causal function-based algorithms.
- **Benefits**: By focusing on causal features, soft sensors become robust to environmental changes and distribution shifts.

## Open-Source Resources

The paper highlights several open-source libraries that practitioners can use to implement these techniques.

### Summary of Recommended Tools

| Domain | Tool | Description | Source |
|--------|------|-------------|--------|
| **Interpretability** | InterpretML | Microsoft's toolkit integrating glass-box models (e.g., EBM) and post-hoc explanations like SHAP/LIME | [GitHub](https://github.com/interpretml/interpret) |
| | Alibi | Python library for diverse explanation methods including counterfactuals and contrastive explanations | [GitHub](https://github.com/SeldonIO/alibi) |
| | Captum | Library specifically for interpreting PyTorch models, featuring Integrated Gradients and DeepLIFT | [GitHub](https://github.com/pytorch/captum) |
| | AIX360 | IBM's toolkit providing comprehensive algorithms for data, model, and prediction explanations, plus fairness detection | [GitHub](https://github.com/Trusted-AI/AIX360) |
| | DALEX | Tools for visualizing and understanding complex models (available in R and Python) | [GitHub](https://github.com/ModelOriented/DALEX) |
| | Eli5 | Simplifies debugging and explanation of classifiers; compatible with scikit-learn | [GitHub](https://github.com/TeamHG-Memex/eli5) |
| | Fairlearn | Focuses on assessing and mitigating fairness issues in machine learning models | [GitHub](https://github.com/fairlearn/fairlearn) |
| **Causal ML** | DoWhy | Microsoft's library for principled causal inference, combining causal graphs with statistical estimation | [GitHub](https://github.com/py-why/dowhy) |
| | CausalML | Uber's package for estimating heterogeneous treatment effects and uplift modeling | [GitHub](https://github.com/uber/causalml) |
| | EconML | Microsoft's library bridging econometrics and ML for heterogeneous treatment effects (e.g., Causal Forests) | [GitHub](https://github.com/py-why/EconML) |
| | CausalNex | QuantumBlack's library combining causal discovery with probabilistic modeling and visualization | [GitHub](https://github.com/quantumblacklabs/causalnex) |
| | Tigramite | Specialized library for causal discovery in time-series data | [GitHub](https://github.com/jakobrunge/tigramite) |
| | Causal Discovery Toolbox | Comprehensive suite of algorithms (constraint-based, score-based, functional) for various data types | [GitHub](https://github.com/FenTechSolutions/CausalDiscoveryToolbox) |
| | CausalPy | User-friendly API for causal analysis, effect estimation, and counterfactual reasoning | [GitHub](https://github.com/pyro-ppl/causalpyro) |

## Reference

L. Cao et al., "Comprehensive Analysis on Machine Learning Approaches for Interpretable and Stable Soft Sensors," IEEE Transactions on Instrumentation and Measurement, 2026.
