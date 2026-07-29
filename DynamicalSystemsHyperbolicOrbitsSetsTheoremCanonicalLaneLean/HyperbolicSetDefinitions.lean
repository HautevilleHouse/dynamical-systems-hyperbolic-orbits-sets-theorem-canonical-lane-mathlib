import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure HyperbolicOrbitSet (X : Type) [TopologicalSpace X] (f : X → X) where
  orbitType : Type
  hyperbolicStructure : Prop
  compactness : Prop
  invariance : Prop
  shadowingProperty : Prop

def UniformHyperbolicity (X : Type) [MetricSpace X] (f : X → X) : Prop :=
  ∃ (Λ : Set X), InvertibleOnSet f Λ ∧ ∃ (E_s E_u : X → Submodule ℝ (TangentSpace X)),
    ContinuousDistribution E_s ∧ ContinuousDistribution E_u ∧
    ∀ x ∈ Λ, TangentSpace X = E_s x ⊕ E_u x ∧
    ContractingOn f E_s ∧ ExpandingOn f E_u

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse