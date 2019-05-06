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
 * This class represents a pack of settings.
 */
class cd_SettingsPack : cd_SettingsBase
{

  // public: ///////////////////////////////////////////////////////////////////

  override
  void resetCvarsToDefaults()
  {
    int nSettings = _settings.size();
    for (int i = 0; i < nSettings; ++i)
    {
      _settings[i].resetCvarsToDefaults();
    }
  }

  // protected: ////////////////////////////////////////////////////////////////

  protected
  void push(cd_SettingsBase setting)
  {
    _settings.push(setting);
  }

  // private: //////////////////////////////////////////////////////////////////

  private Array<cd_SettingsBase> _settings;

} // class cd_SettingsPack : cd_SettingsBase
