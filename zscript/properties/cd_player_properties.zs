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
    rememberOriginals(player);
    maybeSetStartingProperties(settings, player);

    return self;
  }

  /**
   * Player properties are set according to Player settings.
   */
  void update(cd_PlayerSettings settings, PlayerInfo player)
  {
    PlayerPawn pawn = player.mo;

    pawn.DamageMultiply = settings.damageMultiplier()
      ? _originalDamageMultiplier * settings.damageMultiplier()
      : _originalDamageMultiplier;

    pawn.DamageFactor = settings.damageTakenMultiplier()
      ? _originalDamageTakenMultiplier * settings.damageTakenMultiplier()
      : _originalDamageTakenMultiplier;

    pawn.MaxHealth = settings.maxHealth()
      ? settings.maxHealth()
      : _originalMaxHealth;

    pawn.Speed = settings.speedMultiplier()
      ? _originalSpeed * settings.speedMultiplier()
      : _originalSpeed;

    pawn.JumpZ = settings.jumpZMultiplier()
      ? _originalJumpZ * settings.jumpZMultiplier()
      : _originalJumpZ;
  }

  // private: //////////////////////////////////////////////////////////////////

  private
  void rememberOriginals(PlayerInfo player)
  {
    PlayerPawn pawn = player.mo;

    _originalDamageMultiplier      = pawn.DamageMultiply;
    _originalDamageTakenMultiplier = pawn.DamageFactor;
    _originalMaxHealth             = pawn.MaxHealth;
    _originalSpeed                 = pawn.Speed;
    _originalJumpZ                 = pawn.JumpZ;
  }

  // private: //////////////////////////////////////////////////////////////////

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
    bool isNewGame = (player.mo.FindInventory("cd_StartGiverCheck") == null);

    return isNewGame;
  }

  // private: //////////////////////////////////////////////////////////////////

  private double _originalDamageMultiplier;
  private double _originalDamageTakenMultiplier;
  private int    _originalMaxHealth;
  private double _originalSpeed;
  private double _originalJumpZ;

} // class cd_PlayerProperties
