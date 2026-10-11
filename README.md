# A Map of Markups

**English** | [한국어](README.ko.md)

MATLAB code accompanying

> Kim, Seong-Hoon, and Seongman Moon. 2017. "A Map of Markups: Why We Observe Mixed Behaviors of Markups." *Journal of Economics & Management Strategy* 26 (2): 529–553. [doi:10.1111/jems.12193](https://doi.org/10.1111/jems.12193)

## What the paper is about

Empirical studies disagree on whether price markups rise or fall in booms. This paper argues that both are right, depending on the sector.

Firms set prices and output before demand is known, so they face losses they cannot insure: unsold stock or turned-away customers. Two motives pull in opposite directions:

- **Cost compensation (offer curve):** higher output carries higher expected losses from leftover stock, so firms raise prices.
- **Loss balancing (hedge curve):** firms lower prices to balance the risk of overproducing against the risk of running out.

Which motive dominates depends on how storable the product is and on the firm's market power. The result is a "map": markups are **procyclical** in sectors with perishable goods and competitive markets, and **countercyclical** in sectors with storable goods and high market power. U.S. manufacturing data (NBER-CES, 473 industries, 1958–2011) broadly support the map.

## Repository layout

```
figure1_offer_hedge.m   reproduces Figure 1: offer and hedge curves for Example 1
drafts/                 exploratory scripts from earlier versions of the model
```

## Running

```matlab
figure1_offer_hedge
```

Requires MATLAB R2021a or later (`xline`/`yline` with vector inputs). No toolboxes are needed.

## About `drafts/`

These scripts were written while developing the model and are kept for reference. They do **not** reproduce the published figures, and some do not run as-is.

| Files | Content |
|---|---|
| `riterate*.m` | Comparative statics of price, markup, and output under linear, log-linear, and constant-elasticity demand, sweeping one parameter at a time. Needs the Optimization Toolbox (`fsolve`). |
| `example4.m` | Offer and hedge conditions in markup–x̂ space for two uniform distributions. |
| `Rplot_tri.m` | Balancing factor R(x̂) under a triangular distribution (related to Lemma 2). |
| `Rplot_hedge_offer2.m` | Hedge curves for alternative storage values and market power (`flag_case = 1` runs; case 2 is unfinished). |
| `Rplot_general3.m`, `myfun_convex.m` | Unfinished draft of the convex-cost markup map (Fig. 4a); does not run. |
| `corner4.m`, `hedge4.m`, `offer4.m` | Implicit offer/hedge curves for an early convex-cost variant. |

The code for Figures 2–5 and for the empirical tables is not included.
