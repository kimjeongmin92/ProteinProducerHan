# Contributing

## Issue first

실험은 Issue로 시작합니다.

좋은 예:
> `[EXP] LIT-PCBA full vs unbiased AVE comparison`

피해야 할 예:
> `AVE 개선`

## PR에 반드시 포함

1. Research question
2. Dataset / target
3. Config
4. Validation
5. Output artifact
6. Limitation

## Review

- 최소 1명 reviewer
- metric definition 변경은 Technical Lead review 필수
- screenshot만으로 merge하지 않음
- CSV / JSON / test / notebook / figure source를 남김

## Research integrity

금지:
- 결과가 마음에 들지 않아 target 교체
- 원하는 결과가 나올 때까지 seed 변경
- fingerprint/scaffold default를 기록하지 않음
- correlation을 causal effect로 표현
