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
 * This class provides mod information.
 *
 * @attention this class may be used by other mods to check if Ultimate
 * Custom Doom is loaded. Do not remove this class even if it's not used
 * in this mod.
 */
class cd_UltimateCustomDoom
{

  // public: ///////////////////////////////////////////////////////////////////

  static string getTitle()   { return StringTable.Localize("$CD_MAIN_TITLE"); }
  static string getVersion() { return "{VERSION}"; }

} // class cd_UltimateCustomDoom
