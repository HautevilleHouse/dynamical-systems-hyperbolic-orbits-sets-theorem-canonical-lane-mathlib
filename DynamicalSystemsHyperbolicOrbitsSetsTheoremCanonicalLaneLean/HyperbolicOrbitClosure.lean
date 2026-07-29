import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure HyperbolicOrbitClosurePackage where
  periodicOrbitSet : Prop
  hyperbolicStructureOnOrbitSet : Prop
  closureProperties : Prop

def HyperbolicOrbitClosureClosed (H : HyperbolicOrbitClosurePackage) : Prop :=
  H.periodicOrbitSet ∧ H.hyperbolicStructureOnOrbitSet ∧ H.closureProperties

structure HyperbolicOrbitClosureEvidence (H : HyperbolicOrbitClosurePackage) where
  periodicOrbitSetClosed : H.periodicOrbitSet
  hyperbolicStructureOnOrbitSetClosed : H.hyperbolicStructureOnOrbitSet
  closurePropertiesClosed : H.closureProperties

theorem hyperbolic_orbit_closure_closed_from_evidence
    (H : HyperbolicOrbitClosurePackage) (E : HyperbolicOrbitClosureEvidence H) :
    HyperbolicOrbitClosureClosed H := by
  exact And.intro E.periodicOrbitSetClosed
    (And.intro E.hyperbolicStructureOnOrbitSetClosed E.closurePropertiesClosed)

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse