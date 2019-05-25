/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019
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
 * This class provides player armor manipulation functions
 */
class cd_PlayerArmor
{

  // public: ///////////////////////////////////////////////////////////////////

  static play
  void regenerate(PlayerInfo player, cd_ArmorRegenerationSettings settings)
  {
    PlayerPawn pawn = cd_Time.now(player, settings.period());

    if (pawn == null) { return; }

    int health = pawn.Health;
    int armor  = pawn.CountInv("BasicArmor");
    int min    = settings.minAmount();
    int max    = settings.cap();

    bool isRegenerate = isRegenerate(health, armor, min, max);

    if (!isRegenerate) { return; }

    int maxRegenAmount = settings.amount();
    int regenAmount    = max
                       ? min(max - armor, maxRegenAmount)
                       : maxRegenAmount
                       ;

    if (regenAmount <= 0) { return; }

    pawn.GiveInventory("cd_ArmorBonus", regenAmount);

    maybeSound(pawn, settings);
    cd_Effects.maybeBlend(pawn, settings.blend());
  }

  static play
  void degenerate(PlayerInfo player, cd_ArmorDegenerationSettings settings)
  {
    PlayerPawn pawn = cd_Time.now(player, settings.period());

    if (pawn == null) { return; }

    int health = pawn.health;
    int armor  = pawn.CountInv("BasicArmor");

    bool shouldDegenerate = (health > 0) && (armor > settings.limit());

    if (!shouldDegenerate) { return; }

    pawn.TakeInventory("BasicArmor", settings.amount());
  }

  // private: //////////////////////////////////////////////////////////////////

  static private
  bool isRegenerate(int health, int armor, int min, int max)
  {
    bool isAlive      = (health >    0);
    bool isEnough     = (armor  >= min);
    bool isNotTooMuch = (armor  <  max || max == 0);
    bool isRegenerate = isAlive && isEnough && isNotTooMuch;

    return isRegenerate;
  }

  static private
  void maybeSound(PlayerPawn pawn, cd_ArmorRegenerationSettings settings)
  {
    bool isSoundEnabled = settings.isSoundEnabled();

    if (isSoundEnabled) { pawn.A_PlaySound(ARMOR_REGEN_SOUND, CHAN_AUTO); }
  }

  // private: //////////////////////////////////////////////////////////////////

  const ARMOR_REGEN_SOUND = "Regeneration/Armor";

} // class cd_PlayerArmor
