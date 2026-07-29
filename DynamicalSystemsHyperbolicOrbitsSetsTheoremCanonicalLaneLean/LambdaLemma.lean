import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure LambdaLemmaPackage where
  hyperbolicFixedPoint : Prop
  stableManifold : Prop
  unstableManifold : Prop
  inclinationControl : Prop

def LambdaLemmaClosed (L : LambdaLemmaPackage) : Prop :=
  L.hyperbolicFixedPoint ∧ L.stableManifold ∧ L.unstableManifold ∧ L.inclinationControl

structure LambdaLemmaEvidence (L : LambdaLemmaPackage) where
  hyperbolicFixedPointClosed : L.hyperbolicFixedPoint
  stableManifoldClosed : L.stableManifold
  unstableManifoldClosed : L.unstableManifold
  inclinationControlClosed : L.inclinationControl

theorem lambda_lemma_closed_from_evidence
    (L : LambdaLemmaPackage) (E : LambdaLemmaEvidence L) : LambdaLemmaClosed L := by
  exact And.intro E.hyperbolicFixedPointClosed
    (And.intro E.stableManifoldClosed
      (And.intro E.unstableManifoldClosed E.inclinationControlClosed))

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse