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
 * This class provides limits for Player Settings.
 */
class cd_PlayerLimits : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  cd_MinMaxDoubleSettings damageMultiplier     () { return _damageMultiplier     ; }
  cd_MinMaxDoubleSettings damageTakenMultiplier() { return _damageTakenMultiplier; }

  cd_MinMaxIntSettings    startHealth          () { return _startHealth          ; }
  cd_MinMaxIntSettings    startArmor           () { return _startArmor           ; }
  cd_MinMaxIntSettings    savePercent          () { return _savePercent          ; }

  cd_MinMaxIntSettings    maxHealth            () { return _maxHealth            ; }

  cd_MinMaxDoubleSettings speedMultiplier      () { return _speedMultiplier      ; }
  cd_MinMaxDoubleSettings jumpHeightMultiplier () { return _jumpHeightMultiplier ; }

  // public: ///////////////////////////////////////////////////////////////////

  cd_PlayerLimits init(PlayerInfo p)
  {
    push(_damageMultiplier      = newDoubleSetting( "cd_random_player_weapon_damage_mult_min"
                                                  , "cd_random_player_weapon_damage_mult_max"
                                                  , p
                                                  ));
    push(_damageTakenMultiplier = newDoubleSetting( "cd_random_player_damage_taken_mult_min"
                                                  , "cd_random_player_damage_taken_mult_max"
                                                  , p
                                                  ));
    push(_startHealth           = newIntSetting   ( "cd_random_player_start_health_min"
                                                  , "cd_random_player_start_health_max"
                                                  , p
                                                  ));
    push(_startArmor            = newIntSetting   ( "cd_random_player_start_armor_min"
                                                  , "cd_random_player_start_armor_max"
                                                  , p
                                                  ));
    push(_savePercent           = newIntSetting   ( "cd_random_player_start_savepercent_min"
                                                  , "cd_random_player_start_savepercent_max"
                                                  , p
                                                  ));
    push(_maxHealth             = newIntSetting   ( "cd_random_player_max_health_min"
                                                  , "cd_random_player_max_health_max"
                                                  , p
                                                  ));
    push(_speedMultiplier       = newDoubleSetting( "cd_random_player_speed_mult_min"
                                                  , "cd_random_player_speed_mult_max"
                                                  , p
                                                  ));
    push(_jumpHeightMultiplier  = newDoubleSetting( "cd_random_player_jump_mult_min"
                                                  , "cd_random_player_jump_mult_max"
                                                  , p
                                                  ));

    return self;
  }

  // private: //////////////////////////////////////////////////////////////////

  private
  cd_MinMaxIntSettings newIntSetting(string minCvar, string maxCvar, PlayerInfo p)
  {
    return new("cd_MinMaxIntSettings").init(minCvar, maxCvar, p);
  }

  private
  cd_MinMaxDoubleSettings newDoubleSetting(string minCvar, string maxCvar, PlayerInfo p)
  {
    return new("cd_MinMaxDoubleSettings").init(minCvar, maxCvar, p);
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_MinMaxDoubleSettings _damageMultiplier;
  private cd_MinMaxDoubleSettings _damageTakenMultiplier;
  private cd_MinMaxIntSettings    _startHealth;
  private cd_MinMaxIntSettings    _startArmor;
  private cd_MinMaxIntSettings    _savePercent;
  private cd_MinMaxIntSettings    _maxHealth;
  private cd_MinMaxDoubleSettings _speedMultiplier;
  private cd_MinMaxDoubleSettings _jumpHeightMultiplier;

} // class cd_PlayerLimits
