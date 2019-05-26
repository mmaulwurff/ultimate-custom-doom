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
 * This menu item provides a text field with a check for lower bound (minimal
 * value).
 *
 * If the entered value is lower than the specified minimal value, it's
 * corrected to the minimal value.
 */
class OptionMenuItemCd_MinField : OptionMenuItemTextField
{

  // public: ///////////////////////////////////////////////////////////////////

  OptionMenuItemCd_MinField Init(String label, Name command, double min)
  {
    Super.Init(label, command);
    _min = min;
    return self;
  }

  // public: ///////////////////////////////////////////////////////////////////

  override
  bool SetString(int i, String s)
  {
    double original  = s.ToDouble();
    double corrected = max(_min, original);

    if (original != corrected)
    {
      string localized = StringTable.Localize(mLabel);
      console.printf("%s cannot be less than %f.", localized, _min);
    }

    String correctedString = String.Format("%f", corrected);

    return Super.SetString(i, correctedString);
  }

  // private: //////////////////////////////////////////////////////////////////

  private double _min;

} // class OptionMenuItemCd_MinField : OptionMenuItemTextField
