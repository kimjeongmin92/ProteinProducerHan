# 07. Reproducibility Checklist

## Data
- [ ] source URL / access date
- [ ] dataset variant
- [ ] target list
- [ ] raw N
- [ ] excluded N
- [ ] file checksum

## Preprocessing
- [ ] RDKit version
- [ ] salt policy
- [ ] canonicalization
- [ ] tautomer policy
- [ ] stereo policy

## Property
- [ ] descriptor names
- [ ] units
- [ ] KS config
- [ ] Wasserstein standardization

## Scaffold
- [ ] Bemis–Murcko definition
- [ ] rarefaction repeats
- [ ] seed
- [ ] raw + corrected result retained

## AVE
- [ ] Morgan / ECFP config
- [ ] radius
- [ ] nBits
- [ ] split policy
- [ ] repeats
- [ ] mean / std

## Statistics
- [ ] unit of analysis
- [ ] N targets
- [ ] effect size
- [ ] uncertainty
- [ ] correlation ≠ causation statement

## Release
- [ ] tests pass
- [ ] raw restricted data absent
- [ ] secrets absent
- [ ] README matches code
- [ ] external code not vendored
