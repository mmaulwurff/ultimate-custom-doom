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
 * This class provides the ammo regeneration settings.
 */
class cd_AmmoRegenerationSettings : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  bool isBackpackRequired() { return _isBackpackRequired.value(); }
  int  amount()             { return _amount.value();             }

  cd_PeriodSettings period() { return _period; }
  cd_BlendSettings  blend () { return _blend;  }

  // public: ///////////////////////////////////////////////////////////////////

  cd_AmmoRegenerationSettings init()
  {
    push(_isBackpackRequired = new("cd_BoolSetting"   ).init("cd_ammo_regen_backpack_req"));
    push(_amount             = new("cd_IntSetting"    ).init("cd_ammo_regen_amount"      ));
    push(_period             = new("cd_PeriodSettings").init("cd_ammo_regen_enabled", "cd_ammo_regen_freq"));
    push(_blend              = new("cd_BlendSettings" ).init( "cd_ammo_regen_pulse"
                                                            , "cd_ammo_blend_color_r"
                                                            , "cd_ammo_blend_color_g"
                                                            , "cd_ammo_blend_color_b"
                                                            , "cd_ammo_blend_color_int"
                                                            ));
    return self;
  }

  void randomize(PlayerInfo p, cd_AmmoRegenerationLimits limits)
  {
    _amount.randomize(p, limits.amount());
    _period.randomize(p, limits.period());
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_BoolSetting    _isBackpackRequired;
  private cd_IntSetting     _amount;
  private cd_PeriodSettings _period;
  private cd_BlendSettings  _blend;

} // class cd_AmmoRegenerationSettings
