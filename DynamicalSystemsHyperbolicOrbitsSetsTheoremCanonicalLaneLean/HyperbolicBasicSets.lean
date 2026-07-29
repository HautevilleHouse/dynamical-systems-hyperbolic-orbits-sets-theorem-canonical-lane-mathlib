import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure HyperbolicBasicSetPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  diffeomorphism : manifold → manifold
  hyperbolicStructure : Prop
  stableDistribution : Prop
  unstableDistribution : Prop

def HyperbolicBasicSetClosed (H : HyperbolicBasicSetPackage) : Prop :=
  H.hyperbolicStructure ∧ H.stableDistribution ∧ H.unstableDistribution

structure HyperbolicBasicSetEvidence (H : HyperbolicBasicSetPackage) where
  hyperbolicStructureClosed : H.hyperbolicStructure
  stableDistributionClosed : H.stableDistribution
  unstableDistributionClosed : H.unstableDistribution

theorem hyperbolic_basic_set_closed_from_evidence
    (H : HyperbolicBasicSetPackage) (E : HyperbolicBasicSetEvidence H) :
    HyperbolicBasicSetClosed H := by
  exact And.intro E.hyperbolicStructureClosed
    (And.intro E.stableDistributionClosed E.unstableDistributionClosed)

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse