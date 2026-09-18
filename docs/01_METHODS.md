# 01. Methods

## 1. Property bias

### Input
active set \(A\), negative set \(N\)

### Descriptor
- MW
- logP
- TPSA
- HBD / HBA
- Rotatable Bonds
- Formal Charge
- Aromatic Ring Count

### KS statistic

\[
D_{KS}=\sup_x|F_A(x)-F_N(x)|
\]

의미:
두 경험적 누적분포가 가장 크게 벌어지는 지점의 차이.

### Wasserstein
어떤 descriptor가 분포 이동을 주도하는지 보조적으로 확인.

### 해석
높은 property bias는 **ligand-only 물성 shortcut이 존재할 가능성**을 뜻합니다.

---

## 2. Scaffold bias

### Representation
RDKit Bemis–Murcko scaffold

### Raw overlap

\[
J(A,N)=\frac{|S_A\cap S_N|}{|S_A\cup S_N|}
\]

### 문제
class size가 크게 다르면 큰 클래스가 더 많은 unique scaffold를 포함하므로 raw Jaccard가 왜곡될 수 있습니다.

### Rarefaction

```text
larger class
   ↓ sample to smaller-class molecule count
extract scaffold set
   ↓
Jaccard
   ↓ repeat 200×
mean
```

\[
Bias_{scaffold}=1-\overline{J}_{rarefied}
\]

같이 보고:
- raw Jaccard
- rarefied Jaccard
- active scaffold coverage
- scaffold entropy / concentration

---

## 3. AVE bias

### Fingerprint
Morgan / ECFP4

```text
radius = 2
nBits  = 2048
```

### Tanimoto

\[
T(A,B)=\frac{|A\cap B|}{|A\cup B|}
\]

### Four terms
- \(NN_{AA}\): test active → train active
- \(NN_{AI}\): test active → train inactive
- \(NN_{II}\): test inactive → train inactive
- \(NN_{IA}\): test inactive → train active

\[
AVE=(NN_{AA}-NN_{AI})+(NN_{II}-NN_{IA})
\]

random split을 반복하고 평균·표준편차를 보고합니다.

### 해석
AVE가 클수록 label이 local chemical neighborhood에 강하게 연결되어, **nearest-neighbor memorization으로도 benchmark를 맞히기 쉬움**을 의미합니다.

---

## 4. Reporting unit

기본 단위는 **target**입니다.

```text
dataset
target
n_active
n_negative
property_bias
scaffold_bias
ave_bias
config
seed/repeats
```

전체 평균은 target-level distribution을 먼저 확인한 뒤에만 사용합니다.
