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
 * This class provides blend settings.
 */
class cd_BlendSettings : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  bool   isEnabled() { return _isEnabled.value(); }

  int    red      () { return _red      .value(); }
  int    green    () { return _green    .value(); }
  int    blue     () { return _blue     .value(); }
  double intensity() { return _intensity.value(); }

  // public: ///////////////////////////////////////////////////////////////////

  cd_BlendSettings init( string enabledCvar
                       , string redCvar
                       , string greenCvar
                       , string blueCvar
                       , string intensityCvar
                       , PlayerInfo p
                       )
  {
    push(_isEnabled = new("cd_BoolSetting"  ).init(enabledCvar  , p));
    push(_red       = new("cd_IntSetting"   ).init(redCvar      , p));
    push(_green     = new("cd_IntSetting"   ).init(greenCvar    , p));
    push(_blue      = new("cd_IntSetting"   ).init(blueCvar     , p));
    push(_intensity = new("cd_DoubleSetting").init(intensityCvar, p));

    return self;
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_BoolSetting   _isEnabled;

  private cd_IntSetting    _red;
  private cd_IntSetting    _green;
  private cd_IntSetting    _blue;

  private cd_DoubleSetting _intensity;

} // class cd_BlendSettings
