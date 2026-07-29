import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.HyperbolicSet

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure AnosovFlow {M : Type u} [TopologicalSpace M] [MetricSpace M] (g : ℝ → M → M) where
  flow : ℝ → M → M
  hyperbolicStructure : HyperbolicSet M
  flowInvariantHyperbolicSplitting : Prop
  exponentialDichotomy : Prop
  uniformContinuity : Prop
  flowInvariantHyperbolicSplittingTerm : flowInvariantHyperbolicSplitting
  exponentialDichotomyTerm : exponentialDichotomy
  uniformContinuityTerm : uniformContinuity

structure AnosovFlowEvidence {M : Type u} [TopologicalSpace M] [MetricSpace M]
    {g : ℝ → M → M} (A : AnosovFlow g) where
  flowInvariantHyperbolicSplittingClosed : A.flowInvariantHyperbolicSplitting
  exponentialDichotomyClosed : A.exponentialDichotomy
  uniformContinuityClosed : A.uniformContinuity

def AnosovFlowClosed {M : Type u} [TopologicalSpace M] [MetricSpace M]
    {g : ℝ → M → M} (A : AnosovFlow g) : Prop :=
  A.flowInvariantHyperbolicSplitting ∧ A.exponentialDichotomy ∧ A.uniformContinuity

theorem anosov_flow_closed_from_evidence
    {M : Type u} [TopologicalSpace M] [MetricSpace M]
    {g : ℝ → M → M} (A : AnosovFlow g)
    (E : AnosovFlowEvidence A) : AnosovFlowClosed A := by
  exact And.intro E.flowInvariantHyperbolicSplittingClosed
    (And.intro E.exponentialDichotomyClosed E.uniformContinuityClosed)

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse