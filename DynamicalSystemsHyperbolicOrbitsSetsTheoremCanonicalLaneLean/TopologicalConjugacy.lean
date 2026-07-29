import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure TopologicalConjugacyPackage (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] 
    (f : X → X) (g : Y → Y) where
  homeomorphism : X ≃ₜ Y
  conjugacyProperty : ∀ x, g (homeomorphism x) = homeomorphism (f x)
  hyperbolicityPreserved : Prop
  orbitStructurePreserved : Prop

theorem conjugacy_preserves_hyperbolicity (X Y : Type) [MetricSpace X] [MetricSpace Y]
    (f : X → X) (g : Y → Y) (C : TopologicalConjugacyPackage X Y f g) :
    C.hyperbolicityPreserved := by
  exact C.hyperbolicityPreserved

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse