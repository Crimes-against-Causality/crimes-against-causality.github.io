---
number: 2
slug: hospital-hit-list
title: "The Hospital Hit List"
detective: "Wilbert Wright"
difficulty: 3
topics: [Public health, Hospital quality, Aggregation]
fallacies: [Simpson's paradox, Confounding]
summary: "A newspaper ranks hospitals by survival rate and names the deadliest. But every condition tells the opposite story."
---

# The Hospital Hit List

## The crime scene

**The Metropolitan Ledger**, 14 March — *"City's Worst Hospital Exposed"*

> *"Elysium Medical Centre has been failing its patients. New data obtained by The Ledger reveals that just 83.0% of patients admitted to Elysium survive their stay — nearly six percentage points below the 88.7% survival rate posted by crosstown rival Charon Memorial Hospital. Health officials are calling for an urgent public inquiry. 'The numbers don't lie,' said one city councillor. 'Families deserve to know which hospital is safe and which is not.'"*

The story runs above the fold with a bar chart. The implication is unambiguous: one hospital is a house of healing, the other a house of death — and the data proves it.

Wilbert Wright read the article over a morning coffee. A single bar chart in a daily newspaper is not an investigation. It is a verdict without a trial. And something about this one bothered him. He used his morning walk for a trip to the city health authority. A clerk disappeared into the back and returned with the annual report of the city's hospitals — a fat, spiral-bound slab that landed on the counter with a thud.

Buried in Appendix D, past the budget tables and the board minutes, was what he was looking for: survival figures broken down by admitted diagnosis. He worked through them for the better part of an hour. When the picture finally snapped into place, he allowed himself a small smile. "Just as I thought," he said, to no one in particular. "A classic."

Ten minutes later, he called his friend Ed Simpson, a seasoned science reporter at *The Metropolitan Ledger* — not involved in the notorious front-page story, but one of the few people at the paper who would understand the problem immediately. Wright explained it in three sentences.

"Ed," he said, "your bosses have some work to do."

The following morning, *The Metropolitan Ledger* published a correction on page two. The record had been set straight. Can you tell how?


## Exhibit 1: The Chart That Started It All

*Overall patient survival rates, Elysium Medical Centre vs. Charon Memorial Hospital*

![Exhibit 1: Overall survival rates](exhibit-1-overall-survival.png)

## Exhibit 2: The Suspects — Hospital Profiles

|  | **Charon Memorial Hospital** | **Elysium Medical Centre** |
|---|---|---|
| Founded | 1887 | 1962 |
| Licensed beds | 620 | 285 |
| Annual budget | $220 million | $210 million |
| Designation | Community hospital | Regional trauma centre; specialist referral hub |
| Patient satisfaction rating | 4.1 / 5 | 4.7 / 5 |

## Exhibit 3: Survival Rates by Condition and Hospital

| Condition | Charon patients | Charon survivors | Charon survival | Elysium patients | Elysium survivors | Elysium survival |
|---|---|---|---|---|---|---|
| Bone fractures | 1,200 | 1,128 | 94.0% | 200 | 192 | 96.0% |
| Cardiac events | 500 | 415 | 83.0% | 300 | 255 | 85.0% |
| Gunshot wounds | 100 | 53 | 53.0% | 400 | 300 | 75.0% |
| **All patients** | **1,800** | **1,596** | **88.7%** | **900** | **747** | **83.0%** |

## The interrogation

1. What survival rates does *The Metropolitan Ledger* report for Elysium Medical Centre and Charon Memorial Hospital, and what conclusion does the article draw from those numbers?

2. Look at Exhibit 2. What differences between the two hospitals stand out? What might Elysium's designation as a "Regional trauma centre and specialist referral hub" suggest about the kinds of patients it is built to receive?

3. Elysium Medical Centre has a higher patient satisfaction rating (4.7 / 5) than Charon Memorial Hospital (4.1 / 5), yet its overall survival rate is lower. How would you explain this apparent contradiction? Think carefully about who is in a position to leave a rating — and who is not.

4. Elysium was founded more than 70 years after Charon, yet it has a slightly smaller total budget. However, Elysium treats roughly half as many patients per year. What does that imply about the cost of treating each patient at each hospital, and what might drive that difference?

5. Look at Exhibit 3. For patients admitted with bone fractures, which hospital has the higher survival rate?

6. For patients admitted with cardiac events, which hospital has the higher survival rate?

7. For patients admitted with gunshot wounds, which hospital has the higher survival rate?

8. Now look at the patient counts in Exhibit 3. How many gunshot wound patients does each hospital treat per year? What does this gap tell you about how differently the two hospitals' patient populations are composed?

9. What happens to a hospital's overall survival average when nearly half its patients arrive with the most life-threatening injuries on the list — while its rival handles such cases less than 6% of the time?

10. Is there a fundamental flaw in the way *The Metropolitan Ledger* compared the two hospitals? What would a fair evaluation of hospital quality need to account for before drawing any conclusions?

## Answers to the questions

1. The article reports that 83.0% of Elysium's patients survive their stay, compared to 88.7% at Charon — a gap of nearly six percentage points. The conclusion drawn is straightforward and damning: Elysium is an underperforming, potentially dangerous hospital, and the public deserves to know.

2. The most striking differences are in designation and size. Charon is a large, long-established community hospital founded in 1887, with 620 beds and a broad general remit. Elysium is a newer, smaller specialist institution — a regional trauma centre and referral hub for complex cases. That designation is a significant clue: hospitals that receive the most difficult, life-threatening cases will naturally see more patients die, regardless of how well they perform.

3. The apparent contradiction dissolves once you ask who can leave a rating. Only survivors can rate a hospital. Patients who die following a gunshot wound or cardiac emergency cannot submit a review. At Elysium, many of the patients who do survive were facing extremely poor odds — they beat a serious injury with the help of a specialist team. That tends to generate intense, genuine gratitude. At Charon, most patients come in with fractures and leave on their own two feet; satisfactory becomes the baseline. The higher rating at Elysium is not despite its harder caseload — it is partly because of it.

4. Elysium's budget of $210 million covers roughly 900 patients per year, at approximately $233,000 per patient. Charon's $220 million covers around 1,800 patients, at roughly $122,000 each. Elysium spends nearly twice as much per patient — which reflects the cost of intensive care units, specialist surgeons, advanced trauma equipment, and round-the-clock emergency capacity required to treat conditions that would overwhelm a standard community hospital.

5. Elysium has the higher survival rate for bone fractures: 96.0% against Charon's 94.0%.

6. Elysium again: 85.0% versus 83.0% for cardiac events.

7. Elysium again, and by a wide margin: 75.0% versus Charon's 53.0% for gunshot wounds. On the most dangerous condition in the dataset, Elysium outperforms its rival by twenty-two percentage points.

8. Charon treats 100 gunshot patients per year — just 5.6% of its total caseload. Elysium treats 400, nearly 44% of its caseload. The two hospitals are not treating similar patients in different ways; they are treating fundamentally different patient populations. Elysium's admissions tilt heavily toward the most life-threatening injuries, while Charon's are dominated by bone fractures — the condition with the highest survival rate of the three.

9. When nearly half your patients arrive with the condition that carries the lowest survival rate, your aggregate figure is pulled down accordingly — even if you outperform your rival in every single category. The overall average is a weighted sum, and the weights at Elysium are stacked against it. Comparing aggregate survival rates without accounting for this is not just misleading; it punishes hospitals for taking on the hardest cases.

10. Yes. The comparison is unadjusted for case mix. The headline figure treats a gunshot wound and a bone fracture as equivalent events, averages across them, and then uses the result to rank hospitals. A fair evaluation would need to compare like with like — either by examining survival rates within comparable patient groups, as Exhibit #3 does, or by applying a formal risk-adjustment model that accounts for the severity of admitted cases. Without that adjustment, the comparison is not evidence of quality. It is an artefact of patient composition.

## What went wrong

The core problem in this case is what statisticians call Simpson's paradox: a pattern that holds within every subgroup can reverse when the data are combined. Elysium outperforms Charon on every individual condition — fractures, cardiac events, gunshot wounds — yet its aggregate survival rate is lower. The reversal is entirely driven by a variable that *The Metropolitan Ledger* never examined: case mix.

The mechanism is straightforward. Gunshot wounds have a dramatically lower survival rate than fractures. Elysium treats four times as many gunshot patients as Charon, and one-sixth as many fracture patients. When you average across all cases without weighting for severity, Elysium's strong performance on hard cases is hidden inside a denominator full of very difficult admissions. Charon's strong aggregate number, conversely, reflects a caseload dominated by the easiest and most survivable condition.

The paradox also has implications for what "quality" means in this context. The relevant question is not whether patients at Elysium are more likely to die than patients at Charon in absolute terms. It is whether a patient with a gunshot wound receives better care at Elysium. Exhibit #3 answers that question unambiguously.

## Background

The statistical phenomenon at the heart of this case was formally described by the British statistician Edward H. Simpson in a 1951 paper, and has carried his name ever since — which is why Wright's contact at *The Metropolitan Ledger* is called Ed Simpson. The paradox had been noted earlier by Karl Pearson and others, but Simpson's treatment made it widely known. It is one of the most instructive examples of how aggregation can deceive.

Simpson's paradox is, in fact, surprisingly common outside of medicine. One of the most frequently cited examples is the UC Berkeley graduate admissions case, analyzed by Bickel, Hammel, and O'Connell in 1975: across all departments combined, male applicants were admitted at a noticeably higher rate than female applicants. But when admissions were examined department by department, women were admitted at equal or higher rates in the majority of departments. The aggregate pattern was a consequence of where people applied. Women disproportionately applied to the most selective departments, while men disproportionately applied to those with higher overall admission rates. [(Bickel et al., 1975, *Science*)](https://doi.org/10.1126/science.187.4175.398)

The paradox also has an electoral form. The vote on the Civil Rights Act of 1964 in the US House of Representatives is a well-documented instance: overall, a higher percentage of Republicans than Democrats voted in favor of the Act. Yet when the votes are broken down by region, a higher percentage of Democrats than Republicans voted in favor in both the North and the South. The reversal occurs because Southern Democrats — a large bloc — voted overwhelmingly against the Act, dragging down the national Democratic percentage. The regional breakdown, not the national total, is the more informative comparison. [(Congressional Record, 1964; discussed in Wagner, 1982, *The American Statistician*)](https://doi.org/10.1080/00031305.1982.10482778)

The paradox turns up in sports statistics too. In the late 1990s, Derek Jeter posted a higher batting average than David Justice in each of three consecutive seasons (1995, 1996, and 1997), yet David Justice had a higher combined batting average across all three seasons. The explanation is the same one Wright finds in Appendix D: Jeter accumulated most of his at-bats in his weakest season, pulling down his combined average even though he outperformed Justice year by year. [(discussed in Appleton et al., 1996, *The American Statistician*)](https://doi.org/10.1080/00031305.1996.10473537)

More recently, early COVID-19 data from several countries appeared to show that vaccinated people had higher rates of hospitalization and death than unvaccinated people. The explanation was not that vaccines were harmful — it was that older adults, who face much higher baseline mortality risk from COVID-19, had been vaccinated first. Once the data were stratified by age group, the protective effect of vaccination was clear in every stratum. The aggregate number was again a product of who ended up in which group, not of what the treatment actually did.

## Sources

- Pearl, J., & Mackenzie, D. (2018). *The Book of Why: The New Science of Cause and Effect*. Basic Books.
- Hernán, M. A., Clayton, D., & Keiding, N. (2011). The Simpson's paradox unraveled. *International Journal of Epidemiology*, 40(3), 780–785.
- Bickel, P. J., Hammel, E. A., & O'Connell, J. W. (1975). Sex bias in graduate admissions: Data from Berkeley. *Science*, 187(4175), 398–402. https://doi.org/10.1126/science.187.4175.398
- Wagner, C. H. (1982). Simpson's paradox in real life. *The American Statistician*, 36(1), 46–48. https://doi.org/10.1080/00031305.1982.10482778
- Appleton, D. R., French, J. M., & Vanderpump, M. P. J. (1996). Ignoring a covariate: An example of Simpson's paradox. *The American Statistician*, 50(4), 340–341. https://doi.org/10.1080/00031305.1996.10473537
- Lilford, R., & Pronovost, P. (2010). Using hospital mortality rates to judge hospital performance: a bad idea that just won't go away. *BMJ*, 340, c2016. https://doi.org/10.1136/bmj.c2016
- Goldstein, H., & Spiegelhalter, D. J. (1996). League tables and their limitations: Statistical issues in comparisons of institutional performance. *Journal of the Royal Statistical Society: Series A*, 159(3), 385–409. https://doi.org/10.2307/2983325
- Shahian, D. M., Wolf, R. E., Iezzoni, L. I., Kirle, L., & Normand, S.-L. T. (2010). Variability in the measurement of hospital-wide mortality rates. *New England Journal of Medicine*, 363, 2530–2539. https://doi.org/10.1056/NEJMsa1006396
- Birkmeyer, J. D., Siewers, A. E., Finlayson, E. V. A., Stukel, T. A., Lucas, F. L., Batista, I., Welch, H. G., & Wennberg, D. E. (2002). Hospital volume and surgical mortality in the United States. *New England Journal of Medicine*, 346(15), 1128–1137. https://doi.org/10.1056/NEJMsa012337
