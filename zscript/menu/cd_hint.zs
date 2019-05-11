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
 * This class provides the Hint Option Menu item.
 *
 * Hint item is visible only when the item right above it is selected.
 */
class OptionMenuItemCd_Hint : OptionMenuItemStaticText
{

  // public: ///////////////////////////////////////////////////////////////////

  OptionMenuItemCd_Hint Init(String label, int nAbove = 1)
  {
    Super.InitDirect(label, Font.CR_WHITE);
    _nAbove = nAbove;
    return self;
  }

  // public: ///////////////////////////////////////////////////////////////////

  override
  int Draw(OptionMenuDescriptor desc, int y, int indent, bool selected)
  {
    return isAboveSelected(desc)
      ? Super.Draw(desc, y, indent, selected)
      : -1;
  }

  // private: //////////////////////////////////////////////////////////////////

  private
  bool isAboveSelected(OptionMenuDescriptor desc)
  {
    int selfIndex = desc.mItems.find(self);
    int aboveEnd  = selfIndex - 1;

    while (aboveEnd >= 0 && !desc.mItems[aboveEnd].Selectable()) { --aboveEnd; }

    int  aboveBegin      = aboveEnd - _nAbove;
    int  selected        = desc.mSelectedItem;
    bool isAboveSelected = (aboveBegin <= selected && selected <= aboveEnd);

    return isAboveSelected;
  }

  // private: //////////////////////////////////////////////////////////////////

  private int _nAbove;

} // class OptionMenuItemCd_Hint
