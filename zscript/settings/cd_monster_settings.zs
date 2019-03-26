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

class cd_MonsterSettings : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  double healthMultiplier() { return _healthMultiplier.value(); }
  double speedMultiplier () { return _speedMultiplier .value(); }

  // public: ///////////////////////////////////////////////////////////////////

  cd_MonsterSettings init()
  {
    push(_healthMultiplier = new("cd_DoubleSetting").init("cd_monster_health_mult"));
    push(_speedMultiplier  = new("cd_DoubleSetting").init("cd_monster_speed_mult" ));

    return self;
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_DoubleSetting _healthMultiplier;
  private cd_DoubleSetting _speedMultiplier;

} // class cd_MonsterSettings
