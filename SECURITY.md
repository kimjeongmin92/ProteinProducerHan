# Security and Data Handling

## Do not commit
- API key / token / credential
- private company material
- restricted PDBbind files
- raw benchmark archives if redistribution terms are unclear
- personal paths / identifiers

## Recommended
`.env`는 local에서만 사용하고 Git에서 제외합니다.

## Data rule
GitHub에는 다음만 남깁니다.
- loader
- manifest
- checksum
- access instructions
- small synthetic fixture

Raw data는 저장소에 포함하지 않습니다.
