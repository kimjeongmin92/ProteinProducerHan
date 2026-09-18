# 04. Literature and External Resources

## 문헌의 역할

| Literature | 프로젝트에서의 의미 |
|---|---|
| Mysinger et al. 2012 | DUD-E decoy construction의 출발점 |
| Wallach & Heifets 2018 | AVE / memorization bias |
| Chen et al. 2019 | DUD-E ligand-only shortcut 실증 |
| Sieg et al. 2019 | 단일 bias metric의 한계 |
| Tran-Nguyen et al. 2020 | lower-bias LIT-PCBA comparison |
| Bemis & Murcko 1996 | scaffold representation |
| Rogers & Hahn 2010 | ECFP representation |
| Liu et al. 2017 | PDBbind/CASF evaluation philosophy |

## 외부 GitHub / Dataset

| Priority | Resource | 확인할 이유 |
|---|---|---|
| P0 | [DUD-E](https://dude.docking.org/targets) | constructed-decoy primary benchmark |
| P0 | [LIT-PCBA](https://drugdesign.unistra.fr/LIT-PCBA/) | full vs unbiased construct validity |
| P0 | [RDKit](https://www.rdkit.org/docs/) | descriptor/scaffold/fingerprint baseline |
| P0 | [SmallMolEval](https://github.com/llnl/SmallMolEval) | AVE external cross-check |
| P1 | [DeepCoy](https://github.com/fimrie/DeepCoy) | generated-decoy selection/evaluation |
| P1 | [MUBDsyn](https://github.com/taoshen99/MUBDsyn) | unbiased synthetic negative generation |
| P1 | [MUBD-DecoyMaker2.0](https://github.com/jwxia2014/MUBD-DecoyMaker2.0) | decoy construction criteria |
| P1 | [DataSAIL](https://github.com/kalininalab/DataSAIL) | similarity-aware leakage control |
| P2 | [GEMS / CleanSplit](https://github.com/camlab-ethz/GEMS) | future protein-ligand split/leakage extension |

## 권장 순서

```text
1. RDKit / official datasets
2. SmallMolEval
3. LIT-PCBA full vs unbiased
4. DeepCoy
5. MUBD family
6. DataSAIL
7. CleanSplit / 3D extension
```

## 원칙

- 외부 repository source는 우리 `src/`에 그대로 복사하지 않음
- clone은 `external/` 로컬 폴더에만 수행
- 비교 실험 시 upstream commit hash 기록
- 구현을 차용할 경우 license 확인
