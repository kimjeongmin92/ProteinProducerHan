# 02. Datasets

| Dataset | Positive | Negative/reference | Project role |
|---|---|---|---|
| DUD-E | active | algorithmic decoy | bias-suspected benchmark |
| LIT-PCBA | HTS active | HTS inactive | lower-bias comparison |
| LIT-PCBA unbiased | active | AVE-reduced inactive subset | construct-validity check |
| PDBbind | measured complexes | affinity values | real-binder reference |
| RCSB affinity | curated complexes | affinity values | public PDBbind-like reference |

## DUD-E
Official: https://dude.docking.org/

Typical:
```text
data/raw/dude/<target>/
├── actives_final.ism
└── decoys_final.ism
```

## LIT-PCBA
Official: https://drugdesign.unistra.fr/LIT-PCBA/

Typical:
```text
data/raw/litpcba/<target>/
├── actives.smi
└── inactives.smi
```

Full / unbiased variant는 source distribution에 맞춰 별도 manifest로 관리합니다.

## PDBbind / RCSB

PDBbind는 계정 기반 배포이므로 raw file은 공개 저장소에 재배포하지 않습니다.

현재 프로젝트에는 `datasets/rcsb_affinity.py`가 있으며, 공개 RCSB API 기반 affinity reference를 같은 `MoleculeSet` 계열 interface로 적재합니다.

### 해석 주의
heterogeneous multi-target affinity reference와 특정 target의 scaffold가 다르다는 사실 자체를 benchmark bias로 해석하지 않습니다.

이 비교에서는 **property distribution**을 주로 해석하고 scaffold는 참고값으로 제한합니다.
