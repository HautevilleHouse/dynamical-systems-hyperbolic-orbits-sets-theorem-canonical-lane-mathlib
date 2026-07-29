import DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.TheoremStatement
import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

open HautevilleHouse.canonicalLaneMathlib.AdmissibleClass

structure HyperbolicSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  metric : carrier → carrier → ℝ
  negativeCurvature : Prop

structure HyperbolicAdmittedObject where
  space : HyperbolicSpace
  invariantCompactSet : carrier
  hyperbolicOrbit : carrier → carrier
  stableManifold : Prop
  unstableManifold : Prop
  conclusion : stableManifold ∧ unstableManifold

structure HyperbolicEndgameState where
  object : HyperbolicAdmittedObject

def HyperbolicWitnessClosed (O : HyperbolicAdmittedObject) : Prop :=
  O.stableManifold ∧ O.unstableManifold

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse
