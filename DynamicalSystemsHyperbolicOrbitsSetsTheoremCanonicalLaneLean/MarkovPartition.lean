import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean.HyperbolicBasicSet

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean

structure MarkovPartition (H : HyperbolicSet) where
  partition : Set (Set H.carrier)
  finiteCover : Prop
  partitionElementsCartesian : H.carrier → (Set H.carrier) → Prop
  markovProperty : Prop
  finiteCoverTerm : finiteCover
  partitionElementsCartesianTerm : partitionElementsCartesian
  markovPropertyTerm : markovProperty

structure MarkovPartitionEvidence (H : HyperbolicSet) (M : MarkovPartition H) where
  finiteCoverClosed : M.finiteCover
  markovPropertyClosed : M.markovProperty

def MarkovPartitionClosed (H : HyperbolicSet) (M : MarkovPartition H) : Prop :=
  M.finiteCover ∧ M.markovProperty

theorem markov_partition_closed_from_evidence (H : HyperbolicSet) (M : MarkovPartition H)
    (E : MarkovPartitionEvidence H M) : MarkovPartitionClosed H M := by
  exact And.intro E.finiteCoverClosed E.markovPropertyClosed

end DynamicalSystemsHyperbolicOrbitsSetsTheoremCanonicalLaneLean
end HautevilleHouse