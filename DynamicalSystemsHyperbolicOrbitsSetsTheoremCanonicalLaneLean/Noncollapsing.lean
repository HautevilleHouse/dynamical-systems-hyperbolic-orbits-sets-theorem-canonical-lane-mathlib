import DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.PerelmanEntropy

/-!
# Noncollapsing Package

This package defines a noncollapsing condition for hyperbolic dynamics.
In the context of hyperbolic orbits, noncollapsing ensures that the invariant
sets do not collapse to lower dimension under perturbations.
-/

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure NoncollapsingPackage {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (Epkg : PerelmanEntropyPackage F) where
  scaleInvariantVolumeBound : Prop
  curvatureScaleControl : Prop
  blowupLimitNoncollapsed : Prop

structure NoncollapsingEvidence {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {Epkg : PerelmanEntropyPackage F} (N : NoncollapsingPackage Epkg) where
  scaleInvariantVolumeBoundClosed : N.scaleInvariantVolumeBound
  curvatureScaleControlClosed : N.curvatureScaleControl
  blowupLimitNoncollapsedClosed : N.blowupLimitNoncollapsed

def NoncollapsingClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {Epkg : PerelmanEntropyPackage F} (N : NoncollapsingPackage Epkg) : Prop :=
  N.scaleInvariantVolumeBound ∧ N.curvatureScaleControl ∧ N.blowupLimitNoncollapsed

theorem noncollapsing_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {Epkg : PerelmanEntropyPackage F} (N : NoncollapsingPackage Epkg) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.scaleInvariantVolumeBoundClosed
    (And.intro E.curvatureScaleControlClosed E.blowupLimitNoncollapsedClosed)

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse
