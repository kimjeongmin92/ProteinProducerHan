# 03. Validation Plan

## V1. Synthetic unit tests
의도적으로 matched / separated molecule set을 만들어 지표 방향성 검증.

## V2. Scaffold imbalance robustness
raw Jaccard와 rarefied Jaccard를 class ratio 변화에 따라 비교.

## V3. AVE repeat stability
5 / 10 / 20 / 50회 반복에서 평균·표준편차 수렴 확인.

## V4. LIT-PCBA full vs unbiased
동일 target에서:

\[
AVE_{unbiased}<AVE_{full}
\]

방향이 재현되는지 확인.

## V5. External AVE cross-check
SmallMolEval과 fingerprint/split 조건을 맞춰 AVE 구현을 교차검증.

## V6. DUD-E vs LIT-PCBA
target-level distribution을 비교.

주의:
두 dataset의 target 구성 자체가 다르면 dataset effect와 target effect가 섞일 수 있습니다.

## V7. Bias ↔ published performance
target별 bias metric과 공개 AUROC / EF1%의 Pearson / Spearman correlation.

> 상관은 인과를 의미하지 않습니다.

## V8. Case study
high / low / disagreement target에서:
- property distribution
- scaffold drivers
- chemical-space visualization
- nearest-neighbor examples
- limitation

## 최소 보고 항목
- N targets
- N molecules
- dataset variant
- fingerprint/scaffold config
- seed
- repeats
- effect size
- uncertainty
