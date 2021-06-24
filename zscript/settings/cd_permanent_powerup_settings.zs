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
 * This class provides the permanent powerup settings.
 */
class cd_PermanentPowerupSettings : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  bool buddha           () { return _buddha           .value(); }
  bool damage           () { return _damage           .value(); }
  bool doubleFiringSpeed() { return _doubleFiringSpeed.value(); }
  bool drain            () { return _drain            .value(); }
  bool flight           () { return _flight           .value(); }
  bool frightener       () { return _frightener       .value(); }
  bool highJump         () { return _highJump         .value(); }
  bool infiniteAmmo     () { return _infiniteAmmo     .value(); }
  bool invisibility     () { return _invisibility     .value(); }
  bool ghost            () { return _ghost            .value(); }
  bool shadow           () { return _shadow           .value(); }
  bool invulnerability  () { return _invulnerability  .value(); }
  bool ironFeet         () { return _ironFeet         .value(); }
  bool mask             () { return _mask             .value(); }
  bool lightAmp         () { return _lightAmp         .value(); }
  bool torch            () { return _torch            .value(); }
  bool minotaur         () { return _minotaur         .value(); }
  bool morph            () { return _morph            .value(); }
  bool protection       () { return _protection       .value(); }
  bool regeneration     () { return _regeneration     .value(); }
  bool scanner          () { return _scanner          .value(); }
  bool speed            () { return _speed            .value(); }
  bool strength         () { return _strength         .value(); }
  bool targeter         () { return _targeter         .value(); }
  bool timeFreezer      () { return _timeFreezer      .value(); }
  bool weaponLevel2     () { return _weaponLevel2     .value(); }

  // public: ///////////////////////////////////////////////////////////////////

  cd_PermanentPowerupSettings init(PlayerInfo p)
  {
    push(_buddha            = new("cd_BoolSetting").init("cd_power_buddha_permanent"           , p));
    push(_damage            = new("cd_BoolSetting").init("cd_power_damage_permanent"           , p));
    push(_doubleFiringSpeed = new("cd_BoolSetting").init("cd_power_doubleFiringSpeed_permanent", p));
    push(_drain             = new("cd_BoolSetting").init("cd_power_drain_permanent"            , p));
    push(_flight            = new("cd_BoolSetting").init("cd_power_flight_permanent"           , p));
    push(_frightener        = new("cd_BoolSetting").init("cd_power_frightener_permanent"       , p));
    push(_highJump          = new("cd_BoolSetting").init("cd_power_highJump_permanent"         , p));
    push(_infiniteAmmo      = new("cd_BoolSetting").init("cd_power_infiniteAmmo_permanent"     , p));
    push(_invisibility      = new("cd_BoolSetting").init("cd_power_invisibility_permanent"     , p));
    push(_ghost             = new("cd_BoolSetting").init("cd_power_ghost_permanent"            , p));
    push(_shadow            = new("cd_BoolSetting").init("cd_power_shadow_permanent"           , p));
    push(_invulnerability   = new("cd_BoolSetting").init("cd_power_invulnerability_permanent"  , p));
    push(_ironFeet          = new("cd_BoolSetting").init("cd_power_ironFeet_permanent"         , p));
    push(_mask              = new("cd_BoolSetting").init("cd_power_mask_permanent"             , p));
    push(_lightAmp          = new("cd_BoolSetting").init("cd_power_lightAmp_permanent"         , p));
    push(_torch             = new("cd_BoolSetting").init("cd_power_torch_permanent"            , p));
    push(_minotaur          = new("cd_BoolSetting").init("cd_power_minotaur_permanent"         , p));
    push(_morph             = new("cd_BoolSetting").init("cd_power_morph_permanent"            , p));
    push(_protection        = new("cd_BoolSetting").init("cd_power_protecton_permanent"        , p));
    push(_regeneration      = new("cd_BoolSetting").init("cd_power_regeneraton_permanent"      , p));
    push(_scanner           = new("cd_BoolSetting").init("cd_power_scanner_permanent"          , p));
    push(_speed             = new("cd_BoolSetting").init("cd_power_speed_permanent"            , p));
    push(_strength          = new("cd_BoolSetting").init("cd_power_strength_permanent"         , p));
    push(_targeter          = new("cd_BoolSetting").init("cd_power_targeter_permanent"         , p));
    push(_timeFreezer       = new("cd_BoolSetting").init("cd_power_timeFreezer_permanent"      , p));
    push(_weaponLevel2      = new("cd_BoolSetting").init("cd_power_weaponLevel2_permanent"     , p));

    return self;
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_BoolSetting _buddha;
  private cd_BoolSetting _damage;
  private cd_BoolSetting _doubleFiringSpeed;
  private cd_BoolSetting _drain;
  private cd_BoolSetting _flight;
  private cd_BoolSetting _frightener;
  private cd_BoolSetting _highJump;
  private cd_BoolSetting _infiniteAmmo;
  private cd_BoolSetting _invisibility;
  private cd_BoolSetting _ghost;
  private cd_BoolSetting _shadow;
  private cd_BoolSetting _invulnerability;
  private cd_BoolSetting _ironFeet;
  private cd_BoolSetting _mask;
  private cd_BoolSetting _lightAmp;
  private cd_BoolSetting _torch;
  private cd_BoolSetting _minotaur;
  private cd_BoolSetting _morph;
  private cd_BoolSetting _protection;
  private cd_BoolSetting _regeneration;
  private cd_BoolSetting _scanner;
  private cd_BoolSetting _speed;
  private cd_BoolSetting _strength;
  private cd_BoolSetting _targeter;
  private cd_BoolSetting _timeFreezer;
  private cd_BoolSetting _weaponLevel2;

} // class cd_PermanentPowerupSettings
