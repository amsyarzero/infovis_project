# Information Visualisation Project

## Tasks
- [x] Review dataset
- [x] Generate 2 indepth hypotheses
- [x] Generate appropriate graphs
- [x] Write R code
- [x] Write report
- [x] Record video
- [x] Submit

## Name
- [Report](https://docs.google.com/document/d/1_bCFwLMUsr4_0gIWAK7IcDgJnPzRSl2dSOpRh_5fFsM/edit?usp=sharing): `20208039_Mohd-Razali_Muhammad-Danial-Amsyar_report.pdf`
- Codes: `20208039_Mohd-Razali_Muhammad-Danial-Amsyar_codes.zip`
- Video: `20208039_Mohd-Razali_Muhammad-Danial-Amsyar_video.mp4`

## Hypotheses
1. Do males have more amount of patients afflicted with Alzheimer's than females?
2. Do age, years of education, socioeconomic status, and brain volume affect dementia?

## Graphs
1. Grouped bar chart, mini pie charts
    - Bar chart: `M/F` vs. amount of patients, grouped by `Group`
    - Pie charts: Percentage of `M/F` against amount of patients, separated by `Group`
2. Scatter plot
    - `Age`, `EDUC`, `SES`, `nWBV` vs. `MMSE`, `CDR`, `eTIV`

## Dataset variables overview
| Term | Meaning | Variable type | Value |
| --- | --- | --- | --- |
| Group | Patient group | Nominal | Demented/nondemented |
| M/F | Patient gender | Nominal | M/F |
| Age | Patient age | Ratio | Age |
| EDUC | Years of education | Ratio | Year |
| SES | Socioeconomic status | Ratio | 1 (low) - 5 (high) |
| MMSE | Mini Mental State Examination | Ratio | 0 - 30 |
| CDR | Clinical Dementia Rating | Interval | 0/0.5/1/2/3 |
| eTIV | Estimated total intracranial volume | Ratio | Volume of void spaces in brain |
| nWBV | Normalize whole brain volume | Interval | Volume of spaces in brain excluding void |
| ASF | Atlas Scaling Factor | Interval | Standardized total intracranial volume |
