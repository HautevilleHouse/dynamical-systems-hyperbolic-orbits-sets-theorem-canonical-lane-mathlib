import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure ShadowingPropertyPackage (H : HyperbolicBasicSetPackage) where
  orbitTracking : Prop
  errorBounds : Prop
  truncatedShadowing : Prop

def ShadowingPropertyClosed {H : HyperbolicBasicSetPackage}
    (S : ShadowingPropertyPackage H) : Prop :=
  S.orbitTracking ∧ S.errorBounds ∧ S.truncatedShadowing

structure ShadowingPropertyEvidence {H : HyperbolicBasicSetPackage}
    (S : ShadowingPropertyPackage H) where
  orbitTrackingClosed : S.orbitTracking
  errorBoundsClosed : S.errorBounds
  truncatedShadowingClosed : S.truncatedShadowing

theorem shadowing_property_closed_from_evidence
    {H : HyperbolicBasicSetPackage} (S : ShadowingPropertyPackage H)
    (E : ShadowingPropertyEvidence S) : ShadowingPropertyClosed S := by
  exact And.intro E.orbitTrackingClosed
    (And.intro E.errorBoundsClosed E.truncatedShadowingClosed)

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse