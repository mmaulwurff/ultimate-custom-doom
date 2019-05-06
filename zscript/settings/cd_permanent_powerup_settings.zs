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
  bool doublefiringspeed() { return _doublefiringspeed.value(); }
  bool drain            () { return _drain            .value(); }
  bool flight           () { return _flight           .value(); }
  bool frightener       () { return _frightener       .value(); }
  bool highjump         () { return _highjump         .value(); }
  bool infiniteammo     () { return _infiniteammo     .value(); }
  bool invisibility     () { return _invisibility     .value(); }
  bool ghost            () { return _ghost            .value(); }
  bool shadow           () { return _shadow           .value(); }
  bool invulnerability  () { return _invulnerability  .value(); }
  bool ironfeet         () { return _ironfeet         .value(); }
  bool mask             () { return _mask             .value(); }
  bool lightamp         () { return _lightamp         .value(); }
  bool torch            () { return _torch            .value(); }
  bool minotaur         () { return _minotaur         .value(); }
  bool morph            () { return _morph            .value(); }
  bool protecton        () { return _protecton        .value(); }
  bool regeneraton      () { return _regeneraton      .value(); }
  bool scanner          () { return _scanner          .value(); }
  bool speed            () { return _speed            .value(); }
  bool strength         () { return _strength         .value(); }
  bool targeter         () { return _targeter         .value(); }
  bool timefreezer      () { return _timefreezer      .value(); }
  bool weaponLevel2     () { return _weaponLevel2     .value(); }

  // public: ///////////////////////////////////////////////////////////////////

  cd_PermanentPowerupSettings init(PlayerInfo p)
  {
    push(_buddha            = new("cd_BoolSetting").init("cd_power_buddha_permanent"           , p));
    push(_damage            = new("cd_BoolSetting").init("cd_power_damage_permanent"           , p));
    push(_doublefiringspeed = new("cd_BoolSetting").init("cd_power_doublefiringspeed_permanent", p));
    push(_drain             = new("cd_BoolSetting").init("cd_power_drain_permanent"            , p));
    push(_flight            = new("cd_BoolSetting").init("cd_power_flight_permanent"           , p));
    push(_frightener        = new("cd_BoolSetting").init("cd_power_frightener_permanent"       , p));
    push(_highjump          = new("cd_BoolSetting").init("cd_power_highjump_permanent"         , p));
    push(_infiniteammo      = new("cd_BoolSetting").init("cd_power_infiniteammo_permanent"     , p));
    push(_invisibility      = new("cd_BoolSetting").init("cd_power_invisibility_permanent"     , p));
    push(_ghost             = new("cd_BoolSetting").init("cd_power_ghost_permanent"            , p));
    push(_shadow            = new("cd_BoolSetting").init("cd_power_shadow_permanent"           , p));
    push(_invulnerability   = new("cd_BoolSetting").init("cd_power_invulnerability_permanent"  , p));
    push(_ironfeet          = new("cd_BoolSetting").init("cd_power_ironfeet_permanent"         , p));
    push(_mask              = new("cd_BoolSetting").init("cd_power_mask_permanent"             , p));
    push(_lightamp          = new("cd_BoolSetting").init("cd_power_lightamp_permanent"         , p));
    push(_torch             = new("cd_BoolSetting").init("cd_power_torch_permanent"            , p));
    push(_minotaur          = new("cd_BoolSetting").init("cd_power_minotaur_permanent"         , p));
    push(_morph             = new("cd_BoolSetting").init("cd_power_morph_permanent"            , p));
    push(_protecton         = new("cd_BoolSetting").init("cd_power_protecton_permanent"        , p));
    push(_regeneraton       = new("cd_BoolSetting").init("cd_power_regeneraton_permanent"      , p));
    push(_scanner           = new("cd_BoolSetting").init("cd_power_scanner_permanent"          , p));
    push(_speed             = new("cd_BoolSetting").init("cd_power_speed_permanent"            , p));
    push(_strength          = new("cd_BoolSetting").init("cd_power_strength_permanent"         , p));
    push(_targeter          = new("cd_BoolSetting").init("cd_power_targeter_permanent"         , p));
    push(_timefreezer       = new("cd_BoolSetting").init("cd_power_timefreezer_permanent"      , p));
    push(_weaponLevel2      = new("cd_BoolSetting").init("cd_power_weaponlevel2_permanent"     , p));

    return self;
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_BoolSetting _buddha;
  private cd_BoolSetting _damage;
  private cd_BoolSetting _doublefiringspeed;
  private cd_BoolSetting _drain;
  private cd_BoolSetting _flight;
  private cd_BoolSetting _frightener;
  private cd_BoolSetting _highjump;
  private cd_BoolSetting _infiniteammo;
  private cd_BoolSetting _invisibility;
  private cd_BoolSetting _ghost;
  private cd_BoolSetting _shadow;
  private cd_BoolSetting _invulnerability;
  private cd_BoolSetting _ironfeet;
  private cd_BoolSetting _mask;
  private cd_BoolSetting _lightamp;
  private cd_BoolSetting _torch;
  private cd_BoolSetting _minotaur;
  private cd_BoolSetting _morph;
  private cd_BoolSetting _protecton;
  private cd_BoolSetting _regeneraton;
  private cd_BoolSetting _scanner;
  private cd_BoolSetting _speed;
  private cd_BoolSetting _strength;
  private cd_BoolSetting _targeter;
  private cd_BoolSetting _timefreezer;
  private cd_BoolSetting _weaponLevel2;

} // class cd_PermanentPowerupSettings
