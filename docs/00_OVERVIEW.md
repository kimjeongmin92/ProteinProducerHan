# 00. Research Overview

## 전체 흐름

```text
Benchmark construction
        ↓
Active / negative sets
        ↓
┌───────────────────────────────┐
│ 1. Property distribution     │
│ 2. Scaffold vocabulary       │
│ 3. Chemical-space neighbors  │
└───────────────────────────────┘
        ↓
Target-level bias profile
        ↓
Construct validity / robustness
        ↓
DUD-E ↔ LIT-PCBA comparison
        ↓
Published performance relation
        ↓
Reusable diagnostic framework
```

## 큰 그림

### Why
높은 benchmark score가 과학적 일반화를 의미하는지 확인하기 위해.

### What
세 가지 서로 다른 shortcut availability를 정량화.

### How
RDKit + scipy + target-level statistics + repeated split.

### Where
DUD-E / LIT-PCBA / RCSB-PDBbind-like affinity reference.

### Who
가상 스크리닝 benchmark를 구축·사용·평가하는 연구자.

### When
모델 학습 전 benchmark audit, 모델 평가 후 성능 해석, 생성 negative QC 단계.

## 핵심 원칙

> **성능을 평가하기 전에, 성능이 쉽게 만들어질 수 있는 데이터 구조가 있는지 먼저 본다.**
