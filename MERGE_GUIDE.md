# Merge Guide

이 패키지는 **기존 코드 repository에 덮어쓰기 전에 diff를 확인하는 documentation overlay**입니다.

## 권장 순서

1. 새 branch
```bash
git checkout -b docs/github-cleanup
```

2. 패키지 파일 복사

3. 기존 README와 새 README 비교
```bash
git diff -- README.md
```

4. 실제 코드 경로 확인
```text
src/proteinanomaly/
scripts/
tests/
doc/
```

5. 내부 링크 확인

6. commit
```bash
git add .
git commit -m "docs: reorganize research documentation and validation workflow"
```

7. PR 생성 후 전원 리뷰

## 특히 확인
- 프로젝트/기업 공개 허가
- raw dataset 포함 여부
- PDBbind 재배포 여부
- 저장소 LICENSE 소유권
