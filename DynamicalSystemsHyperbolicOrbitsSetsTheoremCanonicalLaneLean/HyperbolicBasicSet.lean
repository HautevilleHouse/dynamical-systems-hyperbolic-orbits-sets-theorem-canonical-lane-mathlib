import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure HyperbolicBasicSet where
  underlyingMap : Type u
  invariantSet : Set underlyingMap
  tangentBundle : Type v
  stableDistribution : tangentBundle → Set tangentBundle
  unstableDistribution : tangentBundle → Set tangentBundle
  exponentialContraction : Prop
  exponentialExpansion : Prop
  splittingContinuous : Prop
  dominatedSplitting : Prop

structure HyperbolicBasicSetEvidence (H : HyperbolicBasicSet) where
  exponentialContractionClosed : H.exponentialContraction
  exponentialExpansionClosed : H.exponentialExpansion
  splittingContinuousClosed : H.splittingContinuous
  dominatedSplittingClosed : H.dominatedSplitting

def HyperbolicBasicSetClosed (H : HyperbolicBasicSet) : Prop :=
  H.exponentialContraction ∧ H.exponentialExpansion ∧ H.splittingContinuous ∧ H.dominatedSplitting

theorem hyperbolic_basic_set_closed_from_evidence (H : HyperbolicBasicSet) (E : HyperbolicBasicSetEvidence H) : HyperbolicBasicSetClosed H := by
  exact And.intro E.exponentialContractionClosed (And.intro E.exponentialExpansionClosed (And.intro E.splittingContinuousClosed E.dominatedSplittingClosed))

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse