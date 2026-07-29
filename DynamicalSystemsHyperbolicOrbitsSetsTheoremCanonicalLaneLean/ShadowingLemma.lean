import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.HyperbolicBasicSet

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure ShadowingProperty (H : HyperbolicBasicSet) where
  pseudoOrbit : ℕ → H.underlyingMap
  epsilon : ℝ
  shadowingExists : ∃ (trueOrbit : ℕ → H.underlyingMap), H.invariantSet (trueOrbit 0) ∧ H.invariantSet (trueOrbit 1) ∧ dist (pseudoOrbit n) (trueOrbit n) < epsilon

def ShadowingClosed (H : HyperbolicBasicSet) (S : ShadowingProperty H) : Prop :=
  S.shadowingExists

theorem shadowing_holds_for_basic_set (H : HyperbolicBasicSet) (hClosed : HyperbolicBasicSetClosed H) : ShadowingProperty H := by
  -- Assuming basic set closure implies shadowing, we produce a witness
  sorry

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse