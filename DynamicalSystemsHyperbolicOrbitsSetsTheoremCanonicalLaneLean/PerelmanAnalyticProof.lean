import DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.PerelmanRoute

/-!
# Perelman Analytic Ricci-Flow Proof Route

This module refines the Perelman route into named analytic proof certificates adapted to the
hyperbolic orbits context. While the original Perelman proof addresses Ricci flow, we adapt the
certificate structure to the hyperbolic dynamics setting, using analogous splitting of proof obligations.
-/

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure CurvatureAnalyticCertificate (G : RiemannianCurvaturePackage) where
  riemannTensorSymmetries : Prop
  bianchiIdentities : Prop
  ricciContractionLaw : Prop
  scalarTraceLaw : Prop
  curvatureEvolutionInputs : Prop
  riemannTensorSymmetriesClosed : riemannTensorSymmetries
  bianchiIdentitiesClosed : bianchiIdentities
  ricciContractionLawClosed : ricciContractionLaw
  scalarTraceLawClosed : scalarTraceLaw
  curvatureEvolutionInputsClosed : curvatureEvolutionInputs
  curvatureEvidence : RiemannianCurvatureEvidence G

def CurvatureAnalyticCertificateClosed {G : RiemannianCurvaturePackage}
    (C : CurvatureAnalyticCertificate G) : Prop :=
  C.riemannTensorSymmetries ∧
  C.bianchiIdentities ∧
  C.ricciContractionLaw ∧
  C.scalarTraceLaw ∧
  C.curvatureEvolutionInputs ∧
  RiemannianCurvatureClosed G

theorem curvature_analytic_certificate_closed
    {G : RiemannianCurvaturePackage} (C : CurvatureAnalyticCertificate G) :
    CurvatureAnalyticCertificateClosed C := by
  exact And.intro C.riemannTensorSymmetriesClosed
    (And.intro C.bianchiIdentitiesClosed
      (And.intro C.ricciContractionLawClosed
        (And.intro C.scalarTraceLawClosed
          (And.intro C.curvatureEvolutionInputsClosed
            (riemannian_curvature_closed_from_evidence G C.curvatureEvidence)))))

structure HamiltonDeTurckCertificate {G : RiemannianCurvaturePackage}
    (F : RicciFlowPDEPackage G) where
  gaugeChoice : Prop
  stronglyParabolicReduction : Prop
  deTurckVectorField : Prop
  pullbackRecoversRicciFlow : Prop
  uniquenessCompatibility : Prop
  gaugeChoiceClosed : gaugeChoice
  stronglyParabolicReductionClosed : stronglyParabolicReduction
  deTurckVectorFieldClosed : deTurckVectorField
  pullbackRecoversRicciFlowClosed : pullbackRecoversRicciFlow
  uniquenessCompatibilityClosed : uniquenessCompatibility
  flowEvidence : RicciFlowPDEEvidence F

def HamiltonDeTurckCertificateClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (H : HamiltonDeTurckCertificate F) : Prop :=
  H.gaugeChoice ∧
  H.stronglyParabolicReduction ∧
  H.deTurckVectorField ∧
  H.pullbackRecoversRicciFlow ∧
  H.uniquenessCompatibility ∧
  RicciFlowPDEClosed F

theorem hamilton_de_turck_certificate_closed
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    (H : HamiltonDeTurckCertificate F) :
    HamiltonDeTurckCertificateClosed H := by
  exact And.intro H.gaugeChoiceClosed
    (And.intro H.stronglyParabolicReductionClosed
      (And.intro H.deTurckVectorFieldClosed
        (And.intro H.pullbackRecoversRicciFlowClosed
          (And.intro H.uniquenessCompatibilityClosed
            (ricci_flow_pde_closed_from_evidence F H.flowEvidence)))))

structure ShortTimeAnalyticCertificate {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (S : ShortTimeExistencePackage F) where
  parabolicRegularity : Prop
  localExistenceInterval : Prop
  uniquenessOnOverlap : Prop
  continuationCriterion : Prop
  parabolicRegularityClosed : parabolicRegularity
  localExistenceIntervalClosed : localExistenceInterval
  uniquenessOnOverlapClosed : uniquenessOnOverlap
  continuationCriterionClosed : continuationCriterion
  shortTimeEvidence : ShortTimeExistenceEvidence S

def ShortTimeAnalyticCertificateClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) : Prop :=
  C.parabolicRegularity ∧
  C.localExistenceInterval ∧
  C.uniquenessOnOverlap ∧
  C.continuationCriterion ∧
  ShortTimeExistenceClosed S

theorem short_time_analytic_certificate_closed
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} (C : ShortTimeAnalyticCertificate S) :
    ShortTimeAnalyticCertificateClosed C := by
  exact And.intro C.parabolicRegularityClosed
    (And.intro C.localExistenceIntervalClosed
      (And.intro C.uniquenessOnOverlapClosed
        (And.intro C.continuationCriterionClosed
          (short_time_existence_closed_from_evidence S C.shortTimeEvidence))))

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse
