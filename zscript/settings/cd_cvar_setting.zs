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
 * This class represents a single setting.
 */
class cd_CvarSetting : cd_SettingsBase
{

  // public: ///////////////////////////////////////////////////////////////////

  cd_CvarSetting init(string cvarName, PlayerInfo p)
  {
    _cvar = CVar.GetCvar(cvarName, p);
    return self;
  }

  // public: ///////////////////////////////////////////////////////////////////

  override
  void resetCvarsToDefaults()
  {
    _cvar.ResetToDefault();
  }

  // protected: ////////////////////////////////////////////////////////////////

  protected
  Cvar variable() { return _cvar; }

  // private: //////////////////////////////////////////////////////////////////

  private transient CVar _cvar;

} // class cd_CvarSetting
