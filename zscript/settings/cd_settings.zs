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
 * This class contains all the settings of Ultimate Custom Doom.
 */
class cd_Settings : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  cd_PlayerSettings  player () { return _player ; }
  cd_MiscSettings    misc   () { return _misc   ; }
  cd_MonsterSettings monster() { return _monster; }

  cd_HealthRegenerationSettings healthRegeneration() { return _healthRegeneration; }
  cd_ArmorRegenerationSettings  armorRegeneration () { return _armorRegeneration ; }
  cd_AmmoRegenerationSettings   ammoRegeneration  () { return _ammoRegeneration  ; }

  cd_HealthDegenerationSettings healthDegeneration() { return _healthDegeneration; }
  cd_ArmorDegenerationSettings  armorDegeneration () { return _armorDegeneration ; }

  cd_PermanentPowerupSettings   permanentPowerup  () { return _permanentPowerup  ; }

  cd_RandomizerSettings         randomizer        () { return _randomizer        ; }

  // public: ///////////////////////////////////////////////////////////////////

  /**
   * Initiate cd_Settings instance.
   */
  cd_Settings init(PlayerInfo p)
  {
    push(_player             = new("cd_PlayerSettings" ).init(p));
    push(_misc               = new("cd_MiscSettings"   ).init(p));
    push(_monster            = new("cd_MonsterSettings").init(p));

    push(_healthRegeneration = new("cd_HealthRegenerationSettings").init(p));
    push(_armorRegeneration  = new("cd_ArmorRegenerationSettings" ).init(p));
    push(_ammoRegeneration   = new("cd_AmmoRegenerationSettings"  ).init(p));

    push(_healthDegeneration = new("cd_HealthDegenerationSettings").init(p));
    push(_armorDegeneration  = new("cd_ArmorDegenerationSettings" ).init(p));

    push(_permanentPowerup   = new("cd_PermanentPowerupSettings"  ).init(p));

    push(_randomizer         = new("cd_RandomizerSettings"        ).init(p));

    return self;
  }

  void randomize(PlayerInfo p, cd_RandomizerLimits limits)
  {
    _player            .randomize(p, limits.player            ());

    _healthRegeneration.randomize(p, limits.healthRegeneration());
    _armorRegeneration .randomize(p, limits.armorRegeneration ());
    _ammoRegeneration  .randomize(p, limits.ammoRegeneration  ());

    _healthDegeneration.randomize(p, limits.healthDegeneration());
    _armorDegeneration .randomize(p, limits.armorDegeneration ());
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_PlayerSettings  _player;
  private cd_MiscSettings    _misc;
  private cd_MonsterSettings _monster;

  private cd_HealthRegenerationSettings _healthRegeneration;
  private cd_ArmorRegenerationSettings  _armorRegeneration;
  private cd_AmmoRegenerationSettings   _ammoRegeneration;

  private cd_HealthDegenerationSettings _healthDegeneration;
  private cd_ArmorDegenerationSettings  _armorDegeneration;

  private cd_PermanentPowerupSettings   _permanentPowerup;

  private cd_RandomizerSettings         _randomizer;

} // class cd_Settings
