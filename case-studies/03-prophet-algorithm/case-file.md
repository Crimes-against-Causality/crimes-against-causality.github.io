---
number: 3
slug: prophet-algorithm
title: "The Prophet Algorithm"
detective: "Nora Nightingale"
difficulty: 2
topics: [Machine learning, Public safety, AI governance]
fallacies: [Base rate neglect, Accuracy paradox]
summary: "An inspection algorithm boasts 97% accuracy. Strip away the base rate and most of its flags are wrong."
---

# The Prophet Algorithm

## The crime scene

**The Metropolitan Ledger**, 11 October — *"City's New AI Catches Fire Hazards Before They Strike"*

> *"Mayor Denton Crale yesterday unveiled the results of a year-long pilot of SafeCheck, a machine learning system developed by ARCA Systems to identify residential buildings at high risk of fire code violations. The system achieved an accuracy of more than 97 percent, flagging 412 buildings across the city. Follow-up inspections confirmed violations in 187 of those buildings — a result the Mayor called 'a major step toward a safer Ravenport.' The city now plans to expand SafeCheck to all 10,000 residential buildings on its registry and to reduce its inspector workforce by 40 percent. 'This is what evidence-based governance looks like,' said Maximilian Sorel, ARCA Systems' Head of Government Partnerships. 'The data speaks for itself.'"*

Nora Nightingale read the press release over breakfast in her Portside office. She set down her coffee. She circled one number — 97 percent — and wrote two words in the margin.

*Base rate.*

She pulled up the city's building registry. It was publicly available, updated annually, and contained a field she doubted Maximilian Sorel had ever looked at: the proportion of Ravenport residential buildings with recorded fire code violations in the five years prior to the pilot. Roughly two percent. About 200 buildings out of 10,000.

She opened a spreadsheet and typed four numbers.

It took eleven minutes.

When she was done, she looked at what the numbers meant. SafeCheck had flagged 412 buildings as high-risk. It had been right about 187 of them. That left 225 buildings whose owners had received an official city hazard designation — inspectors at their door, notices in their file, a permanent mark in the ARCA database — for nothing. More than half of every alarm the system raised was a false alarm.

The 97 percent accuracy was real. It was also almost entirely composed of the system correctly identifying clean buildings as clean — a task that required no machine learning whatsoever, and that a system flagging nothing at all would also accomplish, at 98 percent accuracy.

She called the city's data officer. She explained it in two minutes. There was a long pause on the other end of the line.

"So the 97 percent," the data officer said.

"Is mostly the system," Nightingale said, "doing nothing useful, very reliably."

Three weeks later, the city quietly announced it was reviewing the timeline for the inspector workforce reduction. No reason was given. The *Ledger* did not follow up. Nightingale wrote a short note to the *Caldenveld Review*, which ran it as a letter to the editor, below a piece about urban planning.


## Exhibit 1: SafeCheck at a Glance

*Key figures from the SafeCheck pilot, as reported by ARCA Systems and the City of Ravenport*

![Exhibit 1: SafeCheck accuracy claim](exhibit-1-accuracy-claim.png)


## Exhibit 2: The Full Picture — SafeCheck Predictions vs. Reality

*Actual outcomes for all 10,000 residential buildings in the pilot*

| | **Violation confirmed** | **No violation** | **Total** |
|---|---|---|---|
| **SafeCheck: flagged** | 187 | 225 | 412 |
| **SafeCheck: not flagged** | 13 | 9,575 | 9,588 |
| **Total** | 200 | 9,800 | 10,000 |


## The interrogation

1. What does Mayor Crale claim about SafeCheck's accuracy, and what decision does the city plan to make on the basis of that claim?

2. Look at Exhibit 2. Of the 10,000 buildings in the city registry, how many actually had fire code violations? What percentage of all buildings does that represent?

3. Of the 412 buildings that SafeCheck flagged as high-risk, how many turned out to actually have violations?

4. What does the 97 percent accuracy figure actually count? Look carefully at which numbers in Exhibit 2 are the largest. Which category of buildings contributes most to that figure?

5. Imagine a system that flagged no buildings at all — one that simply cleared every building as safe, every time. What overall accuracy would that system achieve on this same data? What does your answer tell you about the usefulness of overall accuracy as a metric here?

6. Calculate the positive predictive value (PPV): of all the buildings SafeCheck flags as high-risk, what share actually has violations? Express it as a percentage.

7. You own a building in Ravenport. One morning you receive a letter from the city informing you that SafeCheck has classified your building as high-risk and that an inspector will visit within the week. Based on Exhibit 2, what is the probability that your building actually has a violation?

8. Exhibit 2 shows 13 buildings with genuine violations that SafeCheck did not flag. What is the term for this type of error, and why does it matter for the city's plan to reduce its inspector workforce by 40 percent?

9. Maximilian Sorel says SafeCheck "dramatically outperforms random chance." Is this true? And if it is, does it settle the question of whether SafeCheck is fit for the purpose the city is using it for?

10. Is there a fundamental flaw in how the city evaluated SafeCheck's performance? What would be a more appropriate measure of success for a system like this, and why?


## Answers to the questions

1. The Mayor claims SafeCheck achieved more than 97 percent accuracy and that it identified 412 high-risk buildings, of which 187 were confirmed violations. On this basis, the city plans to expand the system citywide and reduce its inspector workforce by 40 percent.

2. 200 out of 10,000 buildings had fire code violations — 2 percent of the total. This low base rate is the key number the press release does not mention.

3. Of the 412 flagged buildings, 187 had violations. That means 225 — more than half — did not. The majority of SafeCheck's flags were false alarms.

4. The 97 percent figure counts all correctly classified buildings: both the 187 true positives and the 9,575 true negatives. The true negatives — clean buildings correctly classified as clean — are by far the largest category, making up 99.9 percent of all correct classifications. The system earns most of its accuracy from a task that requires no predictive ability at all.

5. A system that never flagged any building would correctly classify all 9,800 clean buildings and misclassify all 200 violations. Its accuracy would be 9,800 / 10,000 = 98 percent — higher than SafeCheck. A completely useless system scores better on overall accuracy than the one the city is about to expand. This is the naive classifier baseline, and it illustrates why overall accuracy is a poor metric whenever the two classes are very different in size.

6. PPV = 187 / 412 = 45.4 percent. Fewer than half of SafeCheck's flags correspond to actual violations.

7. About 45 percent. Despite the headline figure of 97 percent accuracy, a flagged building has only slightly better than even odds of actually having a violation. The impressive number on the press release says very little about what happens when the system flags your building.

8. These are false negatives — real violations the system failed to detect. They matter critically for the workforce reduction plan. If 40 percent of inspectors are let go, there will be fewer humans available to catch the violations SafeCheck missed. The algorithm replaces human judgment in exactly the cases where the algorithm is wrong, and there are fewer humans left to correct it.

9. Technically yes: a random classifier would identify violations at roughly the base rate of 2 percent, while SafeCheck achieves 45.4 percent PPV. But "better than random chance" is an extremely low bar. A system that is wrong more often than it is right when it raises an alarm is not, by any reasonable standard of governance, ready to replace 40 percent of a professional inspection workforce. Being better than random is not the same as being good enough.

10. Yes. The city used overall accuracy — a metric dominated by easy, undemanding correct classifications — to evaluate a system whose usefulness depends entirely on the reliability of its flags. The appropriate metric is positive predictive value: when SafeCheck raises an alarm, how often is it right? A secondary metric is negative predictive value: when SafeCheck clears a building, how confident can the city be? Neither was reported. Overall accuracy, in a dataset where 98 percent of cases belong to one class, is nearly meaningless as a performance measure.


## What went wrong

The core problem is the base rate — the background frequency of the condition being detected. When only 2 percent of buildings have fire code violations, the overwhelming majority of buildings in the dataset are clean. Any classification system will score high on overall accuracy simply by learning to identify clean buildings as clean, because that is what almost all buildings are.

This creates a statistical trap. The 97 percent accuracy that ARCA Systems reported is dominated by 9,575 buildings correctly identified as clean. These correct classifications follow almost mechanically from the base rate; they require very little from the machine learning model at all. The actual detection work — predicting which buildings have violations — is visible only in the 412 flagged cases. And there, the system is wrong more than half the time.

The positive predictive value of 45.4 percent means that acting on every SafeCheck flag leads to a wrong outcome more than half the time. For a system whose purpose is to direct scarce inspection resources efficiently, this is the number that matters. ARCA Systems did not include it in the press release.

A second failure is embedded in the workforce reduction plan. SafeCheck missed 13 buildings with genuine violations. In a world with 40 percent fewer human inspectors, some of those violations will go undetected entirely. The plan removes the humans best positioned to catch what the algorithm misses — and does so on the basis of an accuracy figure that said nothing about the algorithm's ability to catch violations in the first place.


## Background

The gap between high overall accuracy and low positive predictive value is one of the most consistently misunderstood features of machine learning systems applied to rare conditions. It appears in predictive policing, in medical screening, in fraud detection, and in virtually every domain where an algorithm is asked to identify something that most examples are not.

The psychologist Gerd Gigerenzer has spent decades documenting how poorly trained professionals — including physicians and policy-makers — reason about conditional probabilities when base rates are low. His central finding is that the same information presented as natural frequencies ("1 in 10 flagged buildings actually has a violation") produces better reasoning than the same information presented as percentages. The implication for AI governance is direct: procurement decisions based on a headline accuracy figure, without natural frequency framing or PPV disclosure, systematically lead decision-makers to overestimate what they are buying.

Predictive systems in public safety have repeatedly demonstrated this pattern. Evaluations of predictive policing systems — including PredPol, used by several US police departments — found that their apparent predictive power was largely a function of historical over-policing in certain areas, which generated the training data that made those areas look high-risk. The accuracy figures reported by vendors were not false; they were the wrong numbers for the relevant question. Lum and Isaac's 2016 analysis in *Significance* documented this dynamic in detail.

The Epic Systems case is similarly instructive. The company's sepsis prediction model was marketed with accuracy claims above 80 percent. An independent external validation study published in *JAMA Internal Medicine* in 2021 found that the system missed 67 percent of sepsis cases at the test institution. The gap between marketed performance and real-world utility followed directly from the base rate of sepsis in the patient population and the choice of a performance metric that did not expose it.


## Sources

- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. Simon & Schuster.
- Lum, K., & Isaac, W. (2016). To predict and serve? *Significance*, 13(5), 14–19. https://doi.org/10.1111/j.1740-9713.2016.00960.x
- Wong, A., Otles, E., Donnelly, J. P., Krumm, A., McCullough, J., DeTroyer-Hampar, O., & Wiens, J. (2021). External validation of a widely implemented proprietary sepsis prediction model in hospitalized patients. *JAMA Internal Medicine*, 181(8), 1065–1070. https://doi.org/10.1001/jamainternmed.2021.2626
- Fawcett, T. (2006). An introduction to ROC analysis. *Pattern Recognition Letters*, 27(8), 861–874. https://doi.org/10.1016/j.patrec.2005.10.010
- Kahneman, D. (2011). *Thinking, Fast and Slow*. Farrar, Straus and Giroux.
