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
 * This class contains Player settings of Ultimate Custom Doom.
 */
class cd_PlayerSettings
{

  enum StartTypes
  {
    PER_GAME,
    PER_LEVEL,
    NEVER,
  };

  double damageMultiplier     () { return _damageMultiplier     .value(); }
  double damageTakenMultiplier() { return _damageTakenMultiplier.value(); }

  /// Shows when to reset health and armor.
  int    startType            () { return _startType            .value(); }
  int    startHealth          () { return _startHealth          .value(); }
  int    startArmor           () { return _startArmor           .value(); }

  int    maxHealth            () { return _maxHealth            .value(); }

  double speedMultiplier      () { return _speedMultiplier      .value(); }
  double jumpZMultiplier      () { return _jumpZMultiplier      .value(); }

  cd_PlayerSettings init(PlayerInfo p)
  {
    _damageMultiplier      = new("cd_DoubleSetting").init("cd_player_weapon_damage_mult", p);
    _damageTakenMultiplier = new("cd_DoubleSetting").init("cd_player_damage_taken_mult" , p);

    _startType             = new("cd_IntSetting"   ).init("cd_player_start_type"        , p);
    _startHealth           = new("cd_IntSetting"   ).init("cd_player_start_health"      , p);
    _startArmor            = new("cd_IntSetting"   ).init("cd_player_start_armor"       , p);
    _startArmorSavePercent = new("cd_IntSetting"   ).init("cd_player_start_savePercent" , p);

    _maxHealth             = new("cd_IntSetting"   ).init("cd_player_max_health"        , p);

    _speedMultiplier       = new("cd_DoubleSetting").init("cd_player_speed_mult"        , p);
    _jumpZMultiplier       = new("cd_DoubleSetting").init("cd_player_jump_mult"         , p);

    return self;
  }

  void randomize(PlayerInfo p, cd_PlayerLimits limits)
  {
    _damageMultiplier     .randomize(p, limits.damageMultiplier     ());
    _damageTakenMultiplier.randomize(p, limits.damageTakenMultiplier());

    _startHealth          .randomize(p, limits.startHealth          ());
    _startArmor           .randomize(p, limits.startArmor           ());
    _startArmorSavePercent.randomize(p, limits.savePercent          ());

    _maxHealth            .randomize(p, limits.maxHealth            ());

    _speedMultiplier      .randomize(p, limits.speedMultiplier      ());
    _jumpZMultiplier      .randomize(p, limits.jumpHeightMultiplier ());
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private cd_DoubleSetting _damageMultiplier;
  private cd_DoubleSetting _damageTakenMultiplier;

  private cd_IntSetting    _startType;
  private cd_IntSetting    _startHealth;
  private cd_IntSetting    _startArmor;
  private cd_IntSetting    _startArmorSavePercent;

  private cd_IntSetting    _maxHealth;

  private cd_DoubleSetting _speedMultiplier;
  private cd_DoubleSetting _jumpZMultiplier;

} // class cd_PlayerSettings
