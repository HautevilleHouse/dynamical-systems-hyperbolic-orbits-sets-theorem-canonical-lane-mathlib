import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.HyperbolicBasicSet

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure StableManifold (H : HyperbolicSet) where
  point : H.carrier
  stableFiber : Type
  embedding : stableFiber → H.carrier
  contractionUnderIteration : Prop
  tangentApproximation : Prop
  contractionUnderIterationTerm : contractionUnderIteration
  tangentApproximationTerm : tangentApproximation

structure UnstableManifold (H : HyperbolicSet) where
  point : H.carrier
  unstableFiber : Type
  embedding : unstableFiber → H.carrier
  expansionUnderIteration : Prop
  tangentApproximation : Prop
  expansionUnderIterationTerm : expansionUnderIteration
  tangentApproximationTerm : tangentApproximation

structure StableUnstableEvidence (H : HyperbolicSet) (S : StableManifold H) (U : UnstableManifold H) where
  stableClosed : S.contractionUnderIteration ∧ S.tangentApproximation
  unstableClosed : U.expansionUnderIteration ∧ U.tangentApproximation
  transversalIntersection : Prop
  transversalIntersectionTerm : transversalIntersection

def StableUnstableClosed (H : HyperbolicSet) (S : StableManifold H) (U : UnstableManifold H) : Prop :=
  (S.contractionUnderIteration ∧ S.tangentApproximation) ∧
  (U.expansionUnderIteration ∧ U.tangentApproximation) ∧
  (∃ (E : StableUnstableEvidence H S U), E.transversalIntersection)

theorem stable_unstable_closed_from_evidence (H : HyperbolicSet) (S : StableManifold H) (U : UnstableManifold H)
    (E : StableUnstableEvidence H S U) : StableUnstableClosed H S U := by
  exact And.intro (And.intro E.stableClosed.1 E.stableClosed.2)
    (And.intro (And.intro E.unstableClosed.1 E.unstableClosed.2) (Exists.intro E E.transversalIntersectionTerm))

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse