/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019, 2021
 *
 * This file is a part of Ultimate Custom Doom.
 *
 * Ultimate Custom Doom is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * Ultimate Custom Doom is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Ultimate Custom Doom.  If not, see <https://www.gnu.org/licenses/>.
 */

/**
 * This class provides the player ammo manipulation functions.
 */
class cd_PlayerAmmo play
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  static
  void regenerate(PlayerInfo player, cd_AmmoRegenerationSettings settings)
  {
    PlayerPawn pawn = cd_Time.now(player, settings.period());

    if (pawn == null) { return; }

    if (!isAllowedToRegenerate(pawn, settings)) { return; }

    int amount = settings.amount();

    for (int i = 0; i < amount; ++i)
    {
      let aBackpack = Inventory(Actor.spawn("Backpack", replace: ALLOW_REPLACE));
      aBackpack.clearCounters();
      if (!aBackpack.CallTryPickup(pawn)) aBackpack.destroy();
    }

    cd_Effects.maybeBlend(pawn, settings.blend());
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private static
  bool isAllowedToRegenerate(PlayerPawn pawn, cd_AmmoRegenerationSettings settings)
  {
    bool isBackpackRequired = settings.isBackpackRequired();
    bool isBackpackOwned    = pawn.CountInv("Backpack");
    bool isBagOwned         = pawn.CountInv("BagOfHolding");
    bool isSatchelOwned     = pawn.CountInv("AmmoSatchel");
    bool isAllowed = !isBackpackRequired || isBackpackOwned || isBagOwned || isSatchelOwned;

    return isAllowed;
  }

} // class cd_PlayerAmmo
