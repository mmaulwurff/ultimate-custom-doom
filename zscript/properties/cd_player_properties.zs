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
 * This class represents player properties.
 */
class cd_PlayerProperties play
{

  // public: ///////////////////////////////////////////////////////////////////

  cd_PlayerProperties init(cd_PlayerSettings settings, PlayerInfo player)
  {
    maybeSetStartingProperties(settings, player);
    return self;
  }

  /**
   * Player properties are set according to Player settings.
   */
  void update(cd_PlayerSettings settings, PlayerInfo player)
  {
    PlayerPawn           pawn      = player.mo;
    class<PlayerPawn>    type      = pawn.GetClassName();
    readonly<PlayerPawn> default   = GetDefaultByType(type);

    double originalDamageMultiplier      = default.DamageMultiply;
    double originalDamageTakenMultiplier = default.DamageFactor;
    double originalSpeed                 = default.Speed;
    double originalJumpZ                 = default.JumpZ;

    pawn.DamageMultiply = settings.damageMultiplier()
      ? originalDamageMultiplier * settings.damageMultiplier()
      : originalDamageMultiplier;

    pawn.DamageFactor = settings.damageTakenMultiplier()
      ? originalDamageTakenMultiplier * settings.damageTakenMultiplier()
      : originalDamageTakenMultiplier;

    updateMaxHealth(settings, pawn, default);

    pawn.Speed = settings.speedMultiplier()
      ? originalSpeed * settings.speedMultiplier()
      : originalSpeed;

    pawn.JumpZ = settings.jumpZMultiplier()
      ? originalJumpZ * settings.jumpZMultiplier()
      : originalJumpZ;
  }

  // private: //////////////////////////////////////////////////////////////////

  private
  void updateMaxHealth(cd_PlayerSettings settings, PlayerPawn pawn, readonly<PlayerPawn> default)
  {
    int    originalMaxHealth = default.MaxHealth;
    double newMaxHealth      = settings.maxHealth();

    if (newMaxHealth != _oldMaxHealth)
    {
      double realMaxHealth  = pawn.MaxHealth ? pawn.MaxHealth : 100;
      double relativeHealth = pawn.health / realMaxHealth;

      pawn.MaxHealth = newMaxHealth
        ? newMaxHealth
        : originalMaxHealth;

      realMaxHealth = pawn.MaxHealth ? pawn.MaxHealth : 100;
      pawn.A_SetHealth(relativeHealth * realMaxHealth);

      _oldMaxHealth = newMaxHealth;

      let healthFinder = ThinkerIterator.Create("Health", Thinker.STAT_DEFAULT);
      Health mo;
      while (mo = Health(healthFinder.Next()))
      {
        if (newMaxHealth)
        {
          // Zero max amount means no limit, leave it so.
          if (mo.MaxAmount) { mo.MaxAmount = newMaxHealth + OVERHEAL; }
        }
        else // restore default
        {
          class<Health>    type             = mo.GetClassName();
          readonly<Health> defaultHealth    = GetDefaultByType(type);
          int              defaultMaxAmount = defaultHealth.MaxAmount;

          mo.MaxAmount = defaultMaxAmount;
        }
      }
    }
  }

  private static
  void maybeSetStartingProperties(cd_PlayerSettings settings, PlayerInfo player)
  {
    switch (settings.startType())
    {
    case cd_PlayerSettings.PER_GAME:
      if (isNewGame(player)) { setStartingProperties(settings, player); }
      break;

    case cd_PlayerSettings.PER_LEVEL:
      setStartingProperties(settings, player);
      break;

    case cd_PlayerSettings.NEVER:
      break;
    }
  }

  private static
  void setStartingProperties(cd_PlayerSettings settings, PlayerInfo player)
  {
    // health
    if (settings.startHealth())
    {
      player.mo.A_SetHealth(settings.startHealth());
    }

    // armor
    if (settings.startArmor())
    {
      player.mo.SetInventory("BasicArmor", 0);

      int nArmor = settings.startArmor();
      for (int i = 0; i < nArmor; ++i) { player.mo.GiveInventoryType("cd_StartArmorBonus"); }
    }
  }

  private static
  bool isNewGame(PlayerInfo player)
  {
    bool isNewGame = (player.mo.FindInventory("cd_StartGiverCheck") == NULL);
    return isNewGame;
  }

  // private: //////////////////////////////////////////////////////////////////

  private double _oldMaxHealth;

  // private: //////////////////////////////////////////////////////////////////

  const OVERHEAL = 100;

} // class cd_PlayerProperties
