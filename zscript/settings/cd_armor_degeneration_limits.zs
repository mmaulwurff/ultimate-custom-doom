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
 * This class provides value limits for Armor Degeneration Randomization.
 */
class cd_ArmorDegenerationLimits : cd_DegenerationLimits
{

  // public: ///////////////////////////////////////////////////////////////////

  cd_ArmorDegenerationLimits init()
  {
    push(_amount = newSetting("cd_random_armor_degen_amount_min", "cd_random_armor_degen_amount_max"));
    push(_period = newSetting("cd_random_armor_degen_freq_min"  , "cd_random_armor_degen_freq_max"  ));
    push(_limit  = newSetting("cd_random_armor_degen_limit_min" , "cd_random_armor_degen_limit_max" ));

    return self;
  }

} // class cd_ArmorDegenerationLimits
