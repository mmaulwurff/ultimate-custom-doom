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
 * This class represents miscellaneous settings.
 */
class cd_MiscSettings
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  bool   isEnabled () { return _isEnabled .value(); }
  double airControl() { return _airControl.value(); }
  double friction  () { return _friction  .value(); }
  double selfDamage() { return _selfDamage.value(); }

  cd_MiscSettings init(PlayerInfo player)
  {
    _isEnabled  = new("cd_BoolSetting"  ).init("cd_player_misc_enabled"     , player);
    _airControl = new("cd_DoubleSetting").init("cd_player_airControl_mult"  , player);
    _friction   = new("cd_DoubleSetting").init("cd_player_friction_mult"    , player);
    _selfDamage = new("cd_DoubleSetting").init("cd_player_self_damage_mult" , player);

    return self;
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private cd_BoolSetting   _isEnabled;
  private cd_DoubleSetting _airControl;
  private cd_DoubleSetting _friction;
  private cd_DoubleSetting _selfDamage;

} // class cd_MiscSettings
