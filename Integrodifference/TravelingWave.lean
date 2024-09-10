
import Mathlib.Geometry.Manifold.SmoothManifoldWithCorners
import Mathlib.Geometry.Manifold.ContMDiff.Defs
import Mathlib.Analysis.SpecialFunctions.Integrals
import Mathlib.Order.Interval.Basic
import Mathlib.Topology.UnitInterval
import Mathlib.Data.Sign

-- given a kernel k and a growth function g we should get a map on R → R
def integrodifference (k: ℝ → ℝ) (g: ℝ → ℝ): (ℝ → ℝ) → (ℝ → ℝ) := sorry

def traveling_wave {X Y: Type} [Sub X] (Q: (X → Y) → (X → Y)) (w: X → Y) (c: X): Prop :=
  ∀ x: X, Q w x = w (x - c)

-- theorem 2.1 from Wang, Kot, Neubert (2002)
theorem WangKotNeubert
  (k: ℝ → ℝ)
  (h0: ∀ x: ℝ, k x ≥ 0)
  (h1: ∫ (x : ℝ), k x = 1)
  (h2: ∀ x: ℝ, k x = k (-x))
  (h3: ∃ b: ℝ, ∀ x: ℝ, k x ≤ b)
  (f: ℝ → ℝ)
  (h4: ContDiff ℝ ⊤ f) -- f is smooth
  (h5: (deriv f) > 0) -- f is increasing
  (h6: f 0 = 0)
  (h7: f 1 = 1)
  (w: ℝ → ℝ)
  (c: ℝ)
  (h8: traveling_wave (integrodifference k f) w c)
  (h9: Filter.Tendsto w atBot (nhds 1)) -- w(-∞) = 1
  (h10: Filter.Tendsto w atTop (nhds 0)) -- w(+∞) = 0
  (h11: ContDiff ℝ ⊤ w) -- w is smooth
  (h12: (deriv w) < 0) -- w is decreasing
  (h13: ∀ i: Nat, i ≥ 1 → Filter.Tendsto (deriv^[i] w) atBot (nhds 0))
  (h14: ∀ i: Nat, i ≥ 1 → Filter.Tendsto (deriv^[i] w) atTop (nhds 0))
  (h15: ∃ M: ℝ, M > 0 ∧ ∀ i: Nat, i ≥ 1 → ∀ x: ℝ, |deriv^[i] (f ∘ w)| x ≤ M):
  SignType.sign c = SignType.sign (∫ (u : ℝ) in unitInterval, f u - u) := by

  -- hard part: show that
  -- ∫ (w(x-c) - w(x)) * (f ∘ w)'(x) dx = ∫ (f(w(x)) - w(x)) * (f ∘ w)'(x) dx

  -- next: show that
  -- ∫ (w(x-c) - w(x)) * (f ∘ w)'(x) dx = ∫_0^1 (u - f(u)) du

  -- then
  -- sign(c) = sign(w(x-c) - w(x))
  --       _ = sign(∫ (w(x-c) - w(x)) * (f ∘ w)'(x) dx)
  --       _ = sign(∫_0^1 (u - f(u)) du)

  sorry
