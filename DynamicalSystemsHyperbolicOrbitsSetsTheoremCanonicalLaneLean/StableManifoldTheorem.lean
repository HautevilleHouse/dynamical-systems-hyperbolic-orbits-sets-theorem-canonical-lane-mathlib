import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.HyperbolicBasicSet

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure StableManifoldStructure (H : HyperbolicBasicSet) where
  point : H.underlyingMap
  stableManifold : Set H.underlyingMap
  immersedSubmanifold : Prop
  tangentSpaceMatches : Prop
  contractionAlongManifold : Prop

structure StableManifoldEvidence (H : HyperbolicBasicSet) (S : StableManifoldStructure H) where
  immersedSubmanifoldClosed : S.immersedSubmanifold
  tangentSpaceMatchesClosed : S.tangentSpaceMatches
  contractionAlongManifoldClosed : S.contractionAlongManifold

def StableManifoldClosed (H : HyperbolicBasicSet) (S : StableManifoldStructure H) : Prop :=
  S.immersedSubmanifold ∧ S.tangentSpaceMatches ∧ S.contractionAlongManifold

theorem stable_manifold_closed_from_evidence (H : HyperbolicBasicSet) (S : StableManifoldStructure H) (E : StableManifoldEvidence H S) : StableManifoldClosed H S := by
  exact And.intro E.immersedSubmanifoldClosed (And.intro E.tangentSpaceMatchesClosed E.contractionAlongManifoldClosed)

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse