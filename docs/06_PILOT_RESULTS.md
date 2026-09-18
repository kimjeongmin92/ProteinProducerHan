# 06. Pilot Results

> 아래 결과는 **예비검증**입니다. 전체 benchmark 결론으로 일반화하지 않습니다.

## TP53 vs AMPC

| Metric | TP53 — LIT-PCBA | AMPC — DUD-E |
|---|---:|---:|
| property bias | 0.183 | 0.284 |
| scaffold bias — rarefied | 0.952 | 0.979 |
| scaffold bias — raw | 0.985 | 0.997 |
| active scaffold coverage | 39.1% | 18.5% |
| AVE bias | 0.413 | 0.532 |

방향은 AMPC / DUD-E 쪽이 더 강한 편향을 가리켰습니다.

하지만:
- 각 dataset 1 target
- target identity가 다름
- dataset effect / target effect가 분리되지 않음

따라서 **pipeline sanity check**로만 해석합니다.

---

## Rarefaction correction이 추가된 이유

TP53 pilot:

```text
active   = 79
inactive = 4,168
```

unique scaffold:

```text
active   = 46
inactive = 1,194
```

raw Jaccard는 큰 class의 vocabulary size에 크게 영향을 받았습니다.

그러나 active scaffold 중 18/46, 약 39%가 inactive pool에도 존재했습니다.

따라서:

```text
real-data pilot
   ↓
metric failure mode 발견
   ↓
rarefaction correction 추가
   ↓
regression test
```

이라는 방법론적 개선이 이루어졌습니다.

---

## RCSB affinity reference

제안서 pilot:

| metric | TP53 actives | AMPC actives |
|---|---:|---:|
| property bias | 0.185 | 0.296 |
| scaffold bias | 0.953 | 0.950 |

여기서 scaffold 차이는 heterogeneous reference와 target-specific chemical series의 자연스러운 차이일 수 있으므로, **scaffold bias verdict로 사용하지 않습니다.**

property distribution comparison을 우선 해석합니다.
