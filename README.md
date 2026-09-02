# Lean Tutorial — exercises

Hands-on exercises for the [Lean 4](https://lean-lang.org) theorem prover. There are three ways to work on these exercises with a lean environment: 

1. Codespaces
2. Lean Web
3. Local Install

## Codespaces

This will use your GitHub Codespaces usage. As of 9/2/2026, free GitHub accounts get 120 core-hours/month. 

1. You need a [GitHub account](https://github.com/signup).
2. Click **[Open in GitHub Codespaces](https://github.com/codespaces/new?repo=1348986782&ref=main&machine=standardLinux32gb&devcontainer_path=.devcontainer%2Fdevcontainer.json&hide_repo_select=true&skip_quickstart=true)**.
3. Everything is preselected (this repo, `main`, the **4-core** machine) — just
   press **Create codespace** and wait for VS Code to appear with
   `E1_Logic.lean` open. Creation and loading mathlib can take a 5-10 minutes
4. Work through, in order

   | file | what | 
   | --- | --- | 
   | [`E1_Logic.lean`](Tutorial/Session1/E1_Logic.lean) | propositional logic: the goal-state game |
   | [`E2_Rewriting.lean`](Tutorial/Session1/E2_Rewriting.lean) | equalities: `rw`, `calc`, `ring` |
   | [`E3_Sets.lean`](Tutorial/Session1/E3_Sets.lean) | sets |
   | [`E4_Bonus.lean`](Tutorial/Session1/E4_Bonus.lean) | `∃`/`∀`, and parity bits (`ZMod 2`) | 

   E3 and E4 are independent of each other — pick up whichever fits the
   time you have.

   Hints are inline; full solutions live in
   [`Tutorial/Session1/Solutions/`](Tutorial/Session1/Solutions/) 
   [`Demo1.lean`](Tutorial/Session1/Demo1.lean) is the presenter's live-demo
   script
5. Once you are finished `Cmd/Ctrl+Shift+P` → *Codespaces: Stop Current
   Codespace*. 
   After the tutorial you can delete it at <https://github.com/codespaces>.

## Lean Web

Open <https://live.lean-lang.org> and paste in the contents of any exercise
file — everything except the set widget should work there.

## Local install

1. Install Lean 4 and VS Code following <https://lean-lang.org/install/>.
2. `git clone https://github.com/Stavan-Jain/lean-into-qec-tutorial` and open
   a terminal in it.
3. `lake exe cache get` — downloads mathlib's prebuilt binaries. (Don't build
   mathlib from source, it will take a very long time.)
4. Open the folder in VS Code and start with
   `Tutorial/Session1/E1_Logic.lean`.

## Attribution and license

The exercise progression and several exercises are adapted from
[*Mathematics in Lean*](https://leanprover-community.github.io/mathematics_in_lean/)
by Jeremy Avigad and Patrick Massot (Apache License 2.0) — which is also the
recommended next step after this tutorial. This repository is likewise
released under the [Apache License 2.0](LICENSE).
