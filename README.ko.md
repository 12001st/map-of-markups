# A Map of Markups

[English](README.md) | **한국어**

다음 논문의 MATLAB 코드입니다.

> Kim, Seong-Hoon, and Seongman Moon. 2017. "A Map of Markups: Why We Observe Mixed Behaviors of Markups." *Journal of Economics & Management Strategy* 26 (2): 529–553. [doi:10.1111/jems.12193](https://doi.org/10.1111/jems.12193)

## 논문 소개

마크업이 호황기에 오르는지 내리는지에 대해 실증 연구들의 결론은 엇갈립니다. 이 논문은 산업에 따라 둘 다 맞다고 주장합니다.

기업은 수요를 알기 전에 가격과 생산량을 정하므로, 보험으로 막을 수 없는 손실(팔리지 않은 재고, 놓친 고객)에 노출됩니다. 두 가지 동기가 서로 반대 방향으로 작용합니다.

- **비용 보전(offer 곡선):** 생산이 늘면 재고 손실의 기대값도 커지므로 가격을 올린다.
- **손실 균형(hedge 곡선):** 과잉생산 위험과 품절 위험의 균형을 맞추기 위해 가격을 내린다.

어느 동기가 우세한지는 상품의 저장 가능성과 기업의 시장지배력에 달려 있습니다. 그 결과 "지도"가 그려집니다. 상품이 쉽게 상하고 시장이 경쟁적인 산업에서는 마크업이 **경기순응적**이고, 저장이 쉽고 시장지배력이 큰 산업에서는 **경기역행적**입니다. 미국 제조업 자료(NBER-CES, 473개 산업, 1958–2011)가 이 지도를 대체로 뒷받침합니다.

## 폴더 구성

```
figure1_offer_hedge.m   그림 1 재현: 예제 1의 offer 곡선과 hedge 곡선
drafts/                 모형 초기 버전에서 작성한 탐색용 스크립트
```

## 실행

```matlab
figure1_offer_hedge
```

MATLAB R2021a 이상이 필요합니다(벡터 입력을 받는 `xline`/`yline`). 툴박스는 필요 없습니다.

## `drafts/` 안내

모형을 발전시키는 과정에서 작성한 스크립트로, 참고용으로 남겼습니다. 출판된 그림을 재현하지 **않으며**, 일부는 그대로 실행되지 않습니다.

| 파일 | 내용 |
|---|---|
| `riterate*.m` | 선형·로그선형·고정탄력성 수요에서 가격, 마크업, 생산량의 비교정학. 파라미터를 하나씩 바꿔 가며 계산. Optimization Toolbox(`fsolve`) 필요. |
| `example4.m` | 두 균등분포에서 마크업–x̂ 평면의 offer·hedge 조건. |
| `Rplot_tri.m` | 삼각분포에서 균형 요인 R(x̂) (보조정리 2 관련). |
| `Rplot_hedge_offer2.m` | 저장가치와 시장지배력에 따른 hedge 곡선 (`flag_case = 1`만 실행됨, case 2는 미완성). |
| `Rplot_general3.m`, `myfun_convex.m` | 볼록 비용 마크업 지도(그림 4a)의 미완성 초안. 실행되지 않음. |
| `corner4.m`, `hedge4.m`, `offer4.m` | 초기 볼록 비용 모형의 음함수 offer·hedge 곡선. |

그림 2–5와 실증 표를 만드는 코드는 포함되어 있지 않습니다.
