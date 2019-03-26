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
 * This class provides settings for periodic events.
 */
class cd_PeriodSettings : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  bool isEnabled() { return _isEnabled.value(); }

  /// In seconds.
  int  period   () { return _period   .value(); }

  // public: ///////////////////////////////////////////////////////////////////

  cd_PeriodSettings init(string isEnabledCvar, string periodCvar)
  {
    push(_isEnabled = new("cd_BoolSetting").init(isEnabledCvar));
    push(_period    = new("cd_IntSetting" ).init(periodCvar   ));

    return self;
  }

  void randomize(PlayerInfo p, cd_MinMaxIntSettings limits)
  {
    _period.randomize(p, limits);
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_BoolSetting _isEnabled;
  private cd_IntSetting  _period;

} // class cd_PeriodSettings
