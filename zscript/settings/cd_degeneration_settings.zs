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
 * This class provides the degeneration settings.
 */
class cd_DegenerationSettings : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  int amount() { return _amount.value(); }
  int limit () { return _limit .value(); }

  cd_PeriodSettings period() { return _period; }

  // public: ///////////////////////////////////////////////////////////////////

  cd_DegenerationSettings init( string enabledCvar
                              , string periodCvar
                              , string amountCvar
                              , string limitCvar
                              , PlayerInfo p
                              )
  {
    push(_amount = new("cd_IntSetting"    ).init(amountCvar, p));
    push(_limit  = new("cd_IntSetting"    ).init(limitCvar , p));
    push(_period = new("cd_PeriodSettings").init(enabledCvar, periodCvar, p));

    return self;
  }

  void randomize(PlayerInfo p, cd_DegenerationLimits limits)
  {
    _amount.randomize(p, limits.amount());
    _limit .randomize(p, limits.limit ());
    _period.randomize(p, limits.period());
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_IntSetting     _amount;
  private cd_IntSetting     _limit;
  private cd_PeriodSettings _period;

} // class cd_ArmorDegenerationSettings
