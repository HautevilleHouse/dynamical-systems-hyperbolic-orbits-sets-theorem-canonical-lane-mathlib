import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.HyperbolicBasicSet

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure TransferOperator (H : HyperbolicSet) where
  functionSpace : Type
  operator : (H.carrier → ℝ) → (H.carrier → ℝ)
  boundedness : Prop
  spectralProperties : Prop
  boundednessTerm : boundedness
  spectralPropertiesTerm : spectralProperties

structure TransferOperatorEvidence (H : HyperbolicSet) (T : TransferOperator H) where
  boundednessClosed : T.boundedness
  spectralPropertiesClosed : T.spectralProperties

def TransferOperatorClosed (H : HyperbolicSet) (T : TransferOperator H) : Prop :=
  T.boundedness ∧ T.spectralProperties

theorem transfer_operator_closed_from_evidence (H : HyperbolicSet) (T : TransferOperator H)
    (E : TransferOperatorEvidence H T) : TransferOperatorClosed H T := by
  exact And.intro E.boundednessClosed E.spectralPropertiesClosed

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse