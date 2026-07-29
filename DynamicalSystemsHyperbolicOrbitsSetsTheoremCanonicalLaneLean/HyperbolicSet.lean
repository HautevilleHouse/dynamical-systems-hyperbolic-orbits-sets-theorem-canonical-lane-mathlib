import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure HyperbolicSet (M : Type u) [TopologicalSpace M] [MetricSpace M] where
  invariantSet : Set M
  tangentBundle : Type v
  stableBundle : Type w
  unstableBundle : Type x
  exponentialContraction : Prop
  exponentialExpansion : Prop
  invariantSplitting : Prop
  uniformHyperbolicity : Prop
  smoothness : Prop
  exponentialContractionTerm : exponentialContraction
  exponentialExpansionTerm : exponentialExpansion
  invariantSplittingTerm : invariantSplitting
  uniformHyperbolicityTerm : uniformHyperbolicity
  smoothnessTerm : smoothness

structure HyperbolicSetEvidence (M : Type u) [TopologicalSpace M] [MetricSpace M] (H : HyperbolicSet M) where
  exponentialContractionClosed : H.exponentialContraction
  exponentialExpansionClosed : H.exponentialExpansion
  invariantSplittingClosed : H.invariantSplitting
  uniformHyperbolicityClosed : H.uniformHyperbolicity
  smoothnessClosed : H.smoothness

def HyperbolicSetClosed (M : Type u) [TopologicalSpace M] [MetricSpace M] (H : HyperbolicSet M) : Prop :=
  H.exponentialContraction ∧ H.exponentialExpansion ∧
  H.invariantSplitting ∧ H.uniformHyperbolicity ∧ H.smoothness

theorem hyperbolic_set_closed_from_evidence
    (M : Type u) [TopologicalSpace M] [MetricSpace M] (H : HyperbolicSet M)
    (E : HyperbolicSetEvidence H) : HyperbolicSetClosed H := by
  exact And.intro E.exponentialContractionClosed
    (And.intro E.exponentialExpansionClosed
      (And.intro E.invariantSplittingClosed
        (And.intro E.uniformHyperbolicityClosed E.smoothnessClosed)))

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse