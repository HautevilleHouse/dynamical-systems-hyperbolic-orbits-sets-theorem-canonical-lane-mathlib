import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.HyperbolicBasicSet
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.TransferOperator

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure ZetaFunction (H : HyperbolicSet) where
  periodicOrbits : Set (ℕ × H.carrier)
  zetaValue : ℂ → ℂ
  analyticContinuation : Prop
  functionalEquation : Prop
  analyticContinuationTerm : analyticContinuation
  functionalEquationTerm : functionalEquation

structure ZetaFunctionEvidence (H : HyperbolicSet) (Z : ZetaFunction H) where
  analyticContinuationClosed : Z.analyticContinuation
  functionalEquationClosed : Z.functionalEquation

def ZetaFunctionClosed (H : HyperbolicSet) (Z : ZetaFunction H) : Prop :=
  Z.analyticContinuation ∧ Z.functionalEquation

theorem zeta_function_closed_from_evidence (H : HyperbolicSet) (Z : ZetaFunction H)
    (E : ZetaFunctionEvidence H Z) : ZetaFunctionClosed H Z := by
  exact And.intro E.analyticContinuationClosed E.functionalEquationClosed

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse