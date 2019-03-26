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
 * This class represents limits for Armor Regeneration Settings.
 */
class cd_ArmorRegenerationLimits : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  cd_MinMaxIntSettings amount() { return _amount; }
  cd_MinMaxIntSettings period() { return _period; }
  cd_MinMaxIntSettings min   () { return _min   ; }
  cd_MinMaxIntSettings cap   () { return _cap   ; }

  // public: ///////////////////////////////////////////////////////////////////

  cd_ArmorRegenerationLimits init()
  {
    push(_amount = newSetting("cd_random_armor_regen_amount_min", "cd_random_armor_regen_amount_max"));
    push(_period = newSetting("cd_random_armor_regen_freq_min"  , "cd_random_armor_regen_freq_max"  ));
    push(_min    = newSetting("cd_random_armor_regen_min_min"   , "cd_random_armor_regen_min_max"   ));
    push(_cap    = newSetting("cd_random_armor_regen_cap_min"   , "cd_random_armor_regen_cap_max"   ));

    return self;
  }

  // private: //////////////////////////////////////////////////////////////////

  private
  cd_MinMaxIntSettings newSetting(string minCvar, string maxCvar)
  {
    return new("cd_MinMaxIntSettings").init(minCvar, maxCvar);
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_MinMaxIntSettings _amount;
  private cd_MinMaxIntSettings _period;
  private cd_MinMaxIntSettings _min;
  private cd_MinMaxIntSettings _cap;

} // class cd_ArmorRegenerationLimits
