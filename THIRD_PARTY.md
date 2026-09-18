# Third-Party Resources

외부 repository와 dataset은 각 원저작자의 license / terms를 따릅니다.

| Resource | URL | Use |
|---|---|---|
| DUD-E | https://dude.docking.org/targets | constructed-decoy primary benchmark |
| LIT-PCBA | https://drugdesign.unistra.fr/LIT-PCBA/ | full vs unbiased construct validity |
| RDKit | https://www.rdkit.org/docs/ | descriptor/scaffold/fingerprint baseline |
| SmallMolEval | https://github.com/llnl/SmallMolEval | AVE external cross-check |
| DeepCoy | https://github.com/fimrie/DeepCoy | generated-decoy selection/evaluation |
| MUBDsyn | https://github.com/taoshen99/MUBDsyn | unbiased synthetic negative generation |
| MUBD-DecoyMaker2.0 | https://github.com/jwxia2014/MUBD-DecoyMaker2.0 | decoy construction criteria |
| DataSAIL | https://github.com/kalininalab/DataSAIL | similarity-aware leakage control |
| GEMS / CleanSplit | https://github.com/camlab-ethz/GEMS | future protein-ligand split/leakage extension |

## Policy
- 외부 source code를 이 저장소에 vendoring하지 않습니다.
- 코드 차용 전 upstream LICENSE를 확인합니다.
- 비교 실험에는 upstream commit hash를 기록합니다.
- PDBbind 등 redistribution 제한 가능 데이터는 raw file을 공개하지 않습니다.
