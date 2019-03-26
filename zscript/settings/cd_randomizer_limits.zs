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
 * This class provides value limits for Ultimate Custom Doom Randomization.
 */
class cd_RandomizerLimits : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  cd_PlayerLimits             player            () { return _player            ; }

  cd_HealthRegenerationLimits healthRegeneration() { return _healthRegeneration; }
  cd_ArmorRegenerationLimits  armorRegeneration () { return _armorRegeneration ; }
  cd_AmmoRegenerationLimits   ammoRegeneration  () { return _ammoRegeneration  ; }

  cd_HealthDegenerationLimits healthDegeneration() { return _healthDegeneration; }
  cd_ArmorDegenerationLimits  armorDegeneration () { return _armorDegeneration ; }

  // public: ///////////////////////////////////////////////////////////////////

  cd_RandomizerLimits init()
  {
    push(_player             = new("cd_PlayerLimits"            ).init());

    push(_healthRegeneration = new("cd_HealthRegenerationLimits").init());
    push(_armorRegeneration  = new("cd_ArmorRegenerationLimits" ).init());
    push(_ammoRegeneration   = new("cd_AmmoRegenerationLimits"  ).init());

    push(_healthDegeneration = new("cd_HealthDegenerationLimits").init());
    push(_armorDegeneration  = new("cd_ArmorDegenerationLimits" ).init());

    return self;
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_PlayerLimits             _player;

  private cd_HealthRegenerationLimits _healthRegeneration;
  private cd_ArmorRegenerationLimits  _armorRegeneration;
  private cd_AmmoRegenerationLimits   _ammoRegeneration;

  private cd_HealthDegenerationLimits _healthDegeneration;
  private cd_ArmorDegenerationLimits  _armorDegeneration;

} // class cd_RandomizerLimits
