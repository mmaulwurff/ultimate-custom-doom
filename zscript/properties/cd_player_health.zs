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
 * This class provides player health manipulation functions.
 */
class cd_PlayerHealth
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  static play
  void regenerate(PlayerInfo player, cd_HealthRegenerationSettings settings)
  {
    PlayerPawn pawn = cd_Time.now(player, settings.period());

    if (pawn == null || pawn.Health <= 0) { return; }

    int health    = pawn.Health;
    int maxHealth = pawn.MaxHealth ? pawn.MaxHealth : 100;
    int cap       = settings.cap();
    if (cap == 0) { cap = maxHealth; }

    bool isRegenerate = isRegenerate(health, maxHealth, cap);

    if (!isRegenerate) { return; }

    int maxRegenAmount  = settings.amount();
    int realCap         = min(maxHealth, cap);
    int realRegenAmount = min(realCap - health, maxRegenAmount);

    if (realRegenAmount <= 0) { return; }

    pawn.A_SetHealth(health + realRegenAmount);

    maybeSound(pawn, settings);
    cd_Effects.maybeBlend(pawn, settings.blend());
  }

  static play
  void degenerate(PlayerInfo player, cd_HealthDegenerationSettings settings)
  {
    PlayerPawn pawn = cd_Time.now(player, settings.period());

    if (pawn == null || pawn.Health <= 0) { return; }

    int oldHealth = pawn.health;
    int newHealth = max(settings.limit(), oldHealth - settings.amount());

    if (newHealth == oldHealth) { return; }

    pawn.A_SetHealth(newHealth);
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private static
  bool isRegenerate(int health, int maxHealth, int cap)
  {
    bool isAlive         = (health > 0);
    bool isHealthNotMax  = (health < maxHealth);
    bool isCapNotReached = (health < cap);
    bool isRegenerate    = (isAlive && isHealthNotMax && isCapNotReached);

    return isRegenerate;
  }

  private static
  void maybeSound(PlayerPawn pawn, cd_HealthRegenerationSettings settings)
  {
    bool isSoundEnabled = settings.isSoundEnabled();

    if (isSoundEnabled) { pawn.A_PlaySound(REGEN_SOUND, CHAN_AUTO); }
  }

  const REGEN_SOUND = "Regeneration/Heartbeat";

} // class cd_PlayerHealth
