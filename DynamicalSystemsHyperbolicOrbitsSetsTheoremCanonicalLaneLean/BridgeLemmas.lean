import DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  HyperbolicWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse
