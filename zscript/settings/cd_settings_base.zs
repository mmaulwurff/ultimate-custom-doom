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
 * This class provides the base functions for various settings classes.
 */
class cd_SettingsBase
{

  // public: ///////////////////////////////////////////////////////////////////

  /**
   * Read settings from the corresponding CVARs.
   */
  virtual
  void read(PlayerInfo p)
  {
    console.printf("%s: read is not implemented!", GetClassName());
  }

  /**
   * Reset CVars to their default values.
   */
  virtual
  void resetCvarsToDefaults(PlayerInfo p)
  {
    console.printf("%s: reset is not implemented!", GetClassName());
  }

} // class cd_SettingsBase
