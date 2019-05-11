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

class OptionMenuItemCd_FramedText : OptionMenuItemStaticText
{

  // public: ///////////////////////////////////////////////////////////////////

  override
  int Draw(OptionMenuDescriptor desc, int y, int indent, bool selected)
  {
    if (shouldInsertFrame(desc))
    {
      mColor = Font.FindFontColor("CDLightBlue");

      let space1 = new("OptionMenuItemStaticText").InitDirect("",     mColor);
      let before = new("OptionMenuItemStaticText").InitDirect(_frame, mColor);
      let after  = new("OptionMenuItemStaticText").InitDirect(_frame, mColor);
      let space2 = new("OptionMenuItemStaticText").InitDirect("",     mColor);

      int selfIndex = desc.mItems.find(self);

      desc.mItems.insert(selfIndex,     space1);
      desc.mItems.insert(selfIndex + 1, before);
      // self is now here
      desc.mItems.insert(selfIndex + 3, after );
      desc.mItems.insert(selfIndex + 4, space2);

      return -1;
    }

    return Super.Draw(desc, y, indent, selected);
  }

  // private: //////////////////////////////////////////////////////////////////

  private
  bool shouldInsertFrame(OptionMenuDescriptor desc)
  {
    int selfIndex = desc.mItems.find(self);
    int size      = desc.mItems.size();

    if (selfIndex == 0)        { return true; }
    if (selfIndex == size - 1) { return true; }

    let before = OptionMenuItemStaticText(desc.mItems[selfIndex - 1]);
    let after  = OptionMenuItemStaticText(desc.mItems[selfIndex + 1]);

    bool isFramed = (before && before.mLabel == _frame)
                 && (after  && after .mLabel == _frame);

    return !isFramed;
  }

  // private: //////////////////////////////////////////////////////////////////

  const _frame = "========================================";

} // class cd_FrametText
