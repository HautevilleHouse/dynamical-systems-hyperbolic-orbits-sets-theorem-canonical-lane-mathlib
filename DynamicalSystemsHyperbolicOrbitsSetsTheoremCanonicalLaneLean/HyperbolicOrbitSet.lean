import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.HyperbolicSet
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.ShadowingLemma

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure HyperbolicOrbitSet {M : Type u} [TopologicalSpace M] [MetricSpace M] (H : HyperbolicSet M) where
  orbit : Set M
  hyperbolicStructure : HyperbolicSet M
  orbitInvariant : Prop
  periodicOrbit : Prop
  denseOrbit : Prop
  orbitInvariantTerm : orbitInvariant
  periodicOrbitTerm : periodicOrbit
  denseOrbitTerm : denseOrbit

structure HyperbolicOrbitSetEvidence {M : Type u} [TopologicalSpace M] [MetricSpace M]
    {H : HyperbolicSet M} (O : HyperbolicOrbitSet H) where
  orbitInvariantClosed : O.orbitInvariant
  periodicOrbitClosed : O.periodicOrbit
  denseOrbitClosed : O.denseOrbit

def HyperbolicOrbitSetClosed {M : Type u} [TopologicalSpace M] [MetricSpace M]
    {H : HyperbolicSet M} (O : HyperbolicOrbitSet H) : Prop :=
  O.orbitInvariant ∧ O.periodicOrbit ∧ O.denseOrbit

theorem hyperbolic_orbit_set_closed_from_evidence
    {M : Type u} [TopologicalSpace M] [MetricSpace M]
    {H : HyperbolicSet M} (O : HyperbolicOrbitSet H)
    (E : HyperbolicOrbitSetEvidence O) : HyperbolicOrbitSetClosed O := by
  exact And.intro E.orbitInvariantClosed
    (And.intro E.periodicOrbitClosed E.denseOrbitClosed)

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse