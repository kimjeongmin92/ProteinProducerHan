# ProteinAnomalyDetection

**Virtual-screening benchmark bias diagnostics for DUD-E and LIT-PCBA**

이 저장소는 가상 스크리닝 벤치마크의 **artificial enrichment**를 진단합니다.  
핵심 질문은 하나입니다.

> **모델이 실제 결합 정보를 학습하지 않아도, 데이터셋의 물성·골격·화학공간 구조만으로 높은 점수를 낼 수 있는가?**

현재 구현은 target 단위로 세 가지 편향을 계산합니다.

| Metric | 핵심 질문 | 구현 |
|---|---|---|
| **Property bias** | 단순 물성만으로 active/negative가 분리되는가? | `metrics/property_bias.py` |
| **Scaffold bias** | 두 클래스의 Bemis–Murcko scaffold vocabulary가 분리되는가? | `metrics/scaffold_bias.py` |
| **AVE bias** | nearest-neighbor 암기만으로 random split에서 label을 맞힐 수 있는가? | `metrics/ave_bias.py` |

```text
Dataset construction
        ↓
Property / Scaffold / Neighborhood bias
        ↓
Shortcut / memorization
        ↓
Artificial enrichment
        ↓
Benchmark validity diagnosis
```

---

## 1. Project scope

### Core
- DUD-E / LIT-PCBA target-level diagnosis
- property-distribution bias
- rarefaction-corrected scaffold bias
- AVE nearest-neighbor memorization bias
- target-level CSV / JSON reporting
- construct-validity and robustness tests

### Extension
- LIT-PCBA full vs unbiased comparison
- bias score ↔ published AUROC / EF1% analysis
- RCSB/PDBbind affinity-reference comparison
- generated-decoy / hard-negative quality control

프로젝트의 범위와 차별화는 [`PROJECT.md`](PROJECT.md)에 정리되어 있습니다.

---

## 2. Method summary

### Property bias

사용 descriptor:
`MW`, `logP`, `TPSA`, `HBD`, `HBA`, `Rotatable Bonds`, `Formal Charge`, `Aromatic Ring Count`

각 descriptor에서 active와 negative의 분포 차이를 계산합니다.

\[
D_{KS}=\sup_x |F_A(x)-F_N(x)|
\]

- 주 지표: **Kolmogorov–Smirnov statistic**
- 보조 지표: **standardized Wasserstein distance**

---

### Scaffold bias

각 molecule에서 **Bemis–Murcko scaffold**를 추출합니다.

초기 raw Jaccard는 class-size imbalance에 민감했기 때문에, 현재 구현은 큰 클래스에서 작은 클래스 크기만큼 반복 subsampling하는 **rarefaction correction**을 사용합니다.

\[
B_{scaffold}=1-\mathbb{E}[J(S_A,S_N^{sub})]
\]

함께 보고:
- raw Jaccard
- rarefied Jaccard
- active scaffold coverage
- scaffold concentration / entropy

---

### AVE bias

ECFP4 / Morgan fingerprint 기반 nearest-neighbor separability를 측정합니다.

기본 설정:

```text
radius = 2
nBits  = 2048
similarity = Tanimoto
```

\[
AVE=(NN_{AA}-NN_{AI})+(NN_{II}-NN_{IA})
\]

반복 random split의 평균과 표준편차를 함께 보고합니다.

---

## 3. Repository map

현재 코드베이스 기준 핵심 구조:

```text
src/proteinanomaly/
├── features.py
├── pipeline.py
├── metrics/
│   ├── property_bias.py
│   ├── scaffold_bias.py
│   └── ave_bias.py
├── datasets/
│   ├── dude.py
│   ├── litpcba.py
│   ├── pdbbind.py
│   └── rcsb_affinity.py
└── ...

scripts/
├── run_diagnosis.py
├── fetch_rcsb_binding_reference.py
└── compare_actives_to_reference.py

tests/
doc/
```

이 패키지는 기존 소스코드를 덮어쓰기 위한 코드가 아니라, **GitHub 공개·협업·재현성 문서를 정리한 overlay**입니다.

---

## 4. Setup

```bash
python -m venv .venv
```

Windows PowerShell:

```powershell
.venv\Scripts\Activate.ps1
```

Git Bash:

```bash
source .venv/Scripts/activate
```

Install:

```bash
pip install -e .
```

Test:

```bash
pytest
```

---

## 5. Usage

DUD-E:

```bash
python scripts/run_diagnosis.py \
  --dataset dude \
  --root data/raw/dude \
  --out results/dude_bias.csv
```

LIT-PCBA:

```bash
python scripts/run_diagnosis.py \
  --dataset litpcba \
  --root data/raw/litpcba \
  --out results/litpcba_bias.csv
```

RCSB affinity reference:

```bash
python scripts/fetch_rcsb_binding_reference.py \
  --limit 300 \
  --out data/raw/rcsb_affinity/reference.csv
```

```bash
python scripts/compare_actives_to_reference.py \
  --dataset dude \
  --root data/raw/dude \
  --target ampc \
  --reference data/raw/rcsb_affinity/reference.csv
```

---

## 6. Pilot status

현재 제안서의 예비검증:

| Metric | TP53 — LIT-PCBA | AMPC — DUD-E |
|---|---:|---:|
| property bias | 0.183 | 0.284 |
| scaffold bias — rarefied | 0.952 | 0.979 |
| active scaffold coverage | 39.1% | 18.5% |
| AVE bias | 0.413 | 0.532 |

이 값들은 **1 target vs 1 target의 pilot sanity check**이며, benchmark 전체에 대한 통계적 결론이 아닙니다.

세부 해석: [`docs/06_PILOT_RESULTS.md`](docs/06_PILOT_RESULTS.md)

---

## 7. Documentation

| 문서 | 내용 |
|---|---|
| [`PROJECT.md`](PROJECT.md) | 문제정의·범위·차별화 |
| [`docs/00_OVERVIEW.md`](docs/00_OVERVIEW.md) | 전체 연구 흐름 |
| [`docs/01_METHODS.md`](docs/01_METHODS.md) | 세 지표의 정의·수식·해석 |
| [`docs/02_DATASETS.md`](docs/02_DATASETS.md) | DUD-E / LIT-PCBA / PDBbind / RCSB |
| [`docs/03_VALIDATION.md`](docs/03_VALIDATION.md) | construct validity·robustness·통계 |
| [`docs/04_LITERATURE_RESOURCES.md`](docs/04_LITERATURE_RESOURCES.md) | 핵심 논문·외부 GitHub |
| [`docs/05_ROADMAP_ROLES.md`](docs/05_ROADMAP_ROLES.md) | 7주 로드맵·4인 역할 |
| [`docs/06_PILOT_RESULTS.md`](docs/06_PILOT_RESULTS.md) | 예비결과·방법론 수정 |
| [`docs/07_REPRODUCIBILITY.md`](docs/07_REPRODUCIBILITY.md) | 재현성 체크리스트 |

---

## 8. External references

외부 repository는 이 저장소에 복사하지 않습니다.

```bash
bash scripts/bootstrap_external_refs.sh
```

로컬 `external/`에만 clone되며 Git에서는 무시됩니다.

주요 reference:
- DeepCoy
- SmallMolEval
- MUBDsyn
- MUBD-DecoyMaker2.0
- DataSAIL
- GEMS / CleanSplit

세부 연결: [`docs/04_LITERATURE_RESOURCES.md`](docs/04_LITERATURE_RESOURCES.md)

---

## 9. Research principles

1. **Target-level first** — 전체 평균 전에 target별 이질성을 본다.
2. **No cherry-picking** — 예상과 다른 target도 유지한다.
3. **Metric is not a verdict** — 하나의 편향 지표로 benchmark 전체를 단정하지 않는다.
4. **Reproducibility first** — seed, config, dataset version, sample N을 남긴다.
5. **Core before stretch** — 진단지표 검증 전에 생성모델 확장으로 넘어가지 않는다.

---

## 10. Data & license

Raw DUD-E / LIT-PCBA / PDBbind 파일은 저장소에 포함하지 않습니다.

- 데이터 안내: [`data/README.md`](data/README.md)
- 외부자료 및 라이선스: [`THIRD_PARTY.md`](THIRD_PARTY.md)
- 공개 전 점검: [`GITHUB_UPLOAD_CHECKLIST.md`](GITHUB_UPLOAD_CHECKLIST.md)

> 저장소 자체의 LICENSE는 프로젝트/기업 소유권 확인 후 확정하는 것을 권장합니다.
