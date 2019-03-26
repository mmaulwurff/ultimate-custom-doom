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
 * This class provides the health regeneration settings.
 */

class cd_HealthRegenerationSettings : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  int  amount()         { return _amount        .value(); }

  /// Regeneration stops if health reaches this number.
  int  cap()            { return _cap           .value(); }

  bool isSoundEnabled() { return _isSoundEnabled.value(); }

  cd_PeriodSettings period() { return _period; }
  cd_BlendSettings  blend () { return _blend;  }

  // public: ///////////////////////////////////////////////////////////////////

  cd_HealthRegenerationSettings init()
  {
    push(_amount         = new("cd_IntSetting")    .init("cd_health_regen_amount" ));
    push(_cap            = new("cd_IntSetting")    .init("cd_health_regen_cap"    ));
    push(_isSoundEnabled = new("cd_BoolSetting")   .init("cd_health_sound_enabled"));

    push(_period         = new("cd_PeriodSettings").init("cd_health_regen_enabled", "cd_health_regen_freq"));
    push(_blend          = new("cd_BlendSettings" ).init( "cd_health_regen_pulse"
                                                        , "cd_health_blend_color_r"
                                                        , "cd_health_blend_color_g"
                                                        , "cd_health_blend_color_b"
                                                        , "cd_health_blend_color_int"
                                                        ));
    return self;
  }

  void randomize(PlayerInfo p, cd_HealthRegenerationLimits limits)
  {
    _amount.randomize(p, limits.amount());
    _period.randomize(p, limits.period());
    _cap   .randomize(p, limits.cap   ());
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_IntSetting     _amount;
  private cd_IntSetting     _cap;

  private cd_BoolSetting    _isSoundEnabled;

  private cd_PeriodSettings _period;
  private cd_BlendSettings  _blend;

} // class cd_HealthRegenerationSettings
