# Project Definition

## 1. Problem

Virtual-screening benchmark에서 높은 AUROC / EF가 보고되어도, 그 성능이 실제 protein–ligand interaction 학습에서 나온 것인지 benchmark construction shortcut에서 나온 것인지 분리하기 어렵습니다.

본 프로젝트는 다음 세 편향을 target 단위로 진단합니다.

1. **Physicochemical bias**
2. **Scaffold bias**
3. **Analogue / nearest-neighbor memorization bias**

---

## 2. Research question

> **Active–negative 구성이 ligand-only 정보만으로 인위적으로 쉽게 분리되는가?**

### Sub-RQ
- RQ1. 단순 물성 분포만으로 두 class가 분리되는가?
- RQ2. scaffold vocabulary가 과도하게 분리되는가?
- RQ3. random split에서 nearest-neighbor 암기가 가능한가?
- RQ4. 저편향 설계 데이터에서 지표가 실제로 낮아지는가?
- RQ5. bias metric과 공개된 AUROC / EF1%는 연관되는가?

---

## 3. What is already implemented

현재 제안서/README 기준:

- `features.py`
- `metrics/property_bias.py`
- `metrics/scaffold_bias.py`
- `metrics/ave_bias.py`
- DUD-E / LIT-PCBA loaders
- PDBbind loader
- RCSB affinity-reference loader
- target-level diagnosis pipeline / CLI
- synthetic unit tests 15건
- TP53 / AMPC real-data pilot
- scaffold rarefaction correction

즉 현재 단계는 **기획 이전이 아니라, reference implementation 이후의 validation / scale-up 단계**입니다.

---

## 4. Project contribution

과장된 “최초” 주장은 피합니다.

권장 차별화 문장:

> **본 프로젝트는 physicochemical distribution, scaffold vocabulary, nearest-neighbor memorization을 하나의 target-level pipeline에서 함께 측정하고, class-size 보정·cross-benchmark construct validation·affinity-reference comparison까지 일관된 방식으로 검증하는 재현 가능한 진단 프레임워크를 목표로 한다.**

---

## 5. Core vs extension

### Core
- all-target batch run
- three-axis bias profile
- construct validity
- rarefaction robustness
- AVE repeat stability
- reproducible reporting

### Extension
- bias ↔ published performance
- DataSAIL leakage-aware split
- DeepCoy / MUBD generated negative evaluation
- 3D protein–ligand generalization
