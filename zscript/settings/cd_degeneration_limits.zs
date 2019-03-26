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
 * This class provides value limits for Degeneration Randomization.
 */
class cd_DegenerationLimits : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  cd_MinMaxIntSettings amount() { return _amount; }
  cd_MinMaxIntSettings period() { return _period; }
  cd_MinMaxIntSettings limit () { return _limit ; }

  // protected: ////////////////////////////////////////////////////////////////

  protected
  cd_MinMaxIntSettings newSetting(string minCvar, string maxCvar)
  {
    return new("cd_MinMaxIntSettings").init(minCvar, maxCvar);
  }

  // protected: ////////////////////////////////////////////////////////////////

  protected cd_MinMaxIntSettings _amount;
  protected cd_MinMaxIntSettings _period;
  protected cd_MinMaxIntSettings _limit;

} // class cd_DegenerationLimits
