/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019, 2021
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
 * What?
 */
class cd_Randomizer play
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  cd_Randomizer init()
  {
    _timerColor = Font.FindFontColor("CDLightBlue");

    return self;
  }

  static
  void randomize(PlayerInfo player, cd_Settings settings, cd_RandomizerLimits limits)
  {
    cd_RandomizerSettings randomizerSettings = settings.randomizer();

    PlayerPawn pawn = cd_Time.now(player, randomizerSettings.period());

    if (pawn == null) { return; }

    settings.randomize(player, limits);

    if (randomizerSettings.isNotificationSoundEnabled())
    {
      pawn.A_StartSound( RANDOMIZER_NOTIFICATION_SOUND
                       , CHAN_AUTO
                       , int(randomizerSettings.notificationVolume())
                       );
    }
  }

  ui
  void show(PlayerInfo player, cd_RandomizerSettings settings)
  {
    showNotification(player, settings);
    showTimer(player, settings.period());
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private ui
  void showTimer(PlayerInfo player, cd_PeriodSettings settings)
  {
    if (!settings.isEnabled()) { return; }

    int    periodSeconds        = settings.period();
    int    goneSeconds          = (level.time / TicRate) % periodSeconds;
    int    remainingSeconds     = periodSeconds - goneSeconds;
    int    remainingMinutes     = remainingSeconds / 60;
    int    remainingSecondsOnly = remainingSeconds % 60;
    string timerString          = String.Format("%02d:%02d", remainingMinutes, remainingSecondsOnly);

    drawTextCenter(timerString, _timerColor, TEXT_SCALE, X_CENTER, TIMER_Y, BigFont);
  }

  private ui
  void showNotification(PlayerInfo player, cd_RandomizerSettings settings)
  {
    if (!settings.period().isEnabled()) { return; }

    int  periodTicks   = settings.period().period() * TicRate;
    int  ticsFromReset = level.time % periodTicks;
    bool shouldShow    = (ticsFromReset < NOTIFICATION_TIME);

    if (!shouldShow) { return; }

    int notificationType = settings.notificationType();

    switch (notificationType)
    {
    case cd_RandomizerSettings.NOTHING:
      break;

    case cd_RandomizerSettings.TEXT:
      drawTextCenter( "The rules have changed!"
                    , NOTIFICATION_COLOR
                    , TEXT_SCALE
                    , X_CENTER
                    , NOTIFICATION_Y
                    , SmallFont
                    );
      break;

    case cd_RandomizerSettings.IMAGE:
      double    alpha = makeAlpha(ticsFromReset);
      TextureID image = TexMan.CheckForTexture("RNDMIZED", TexMan.Type_Any);

      drawImageCenter(image, X_CENTER, NOTIFICATION_IMAGE_Y, alpha);
      break;
    }
  }

  private static ui
  double makeAlpha(int ticsFromReset)
  {
    if (ticsFromReset > FADE_OUT_TIME) // fade out
    {
      return 1.0 - 1.0 / (NOTIFICATION_TIME - FADE_OUT_TIME) * (ticsFromReset - FADE_OUT_TIME);
    }
    if (ticsFromReset > FADE_IN_TIME ) // normal
    {
      return 1.0;
    }
    else // fade in
    {
      return 1.0 / FADE_IN_TIME * ticsFromReset;
    }
  }

  private static ui
  void drawTextCenter( string text
                     , int    color
                     , double scale
                     , double relativeX
                     , double relativeY
                     , Font   font
                     )
  {
    int width    = int(scale * Screen.GetWidth());
    int height   = int(scale * (Screen.GetHeight() - font.GetHeight()));
    int position = width - font.StringWidth(text);

    double x = position * relativeX;
    double y = height   * relativeY;

    Screen.DrawText( font
                   , color
                   , x
                   , y
                   , text
                   , DTA_KeepRatio     , true
                   , DTA_VirtualWidth  , width
                   , DTA_VirtualHeight , height
                   );
  }

  private static ui
  void drawImageCenter( TextureID image
                      , double    relativeX
                      , double    relativeY
                      , double    alpha
                      )
  {
    int width    = Screen.GetWidth();
    int height   = Screen.GetHeight();

    int imageWidth;
    int imageHeight;
    [imageWidth, imageHeight] = TexMan.GetSize(image);
    double x = width  * relativeX - imageWidth / 2;
    double y = height * relativeY - imageHeight / 2;

    Screen.DrawTexture( image
                      , false
                      , x
                      , y
                      , DTA_KeepRatio     , true
                      , DTA_VirtualWidth  , width
                      , DTA_VirtualHeight , height
                      , DTA_Alpha         , alpha
                      );
  }

  private int _timerColor;

  const TEXT_SCALE  = 1.0;
  const X_CENTER    = 0.5;

  const TIMER_Y     = 0.1;

  const NOTIFICATION_COLOR   = Font.CR_RED;
  const NOTIFICATION_Y       = 0.37;
  const NOTIFICATION_IMAGE_Y = 0.25;

  const RANDOMIZER_NOTIFICATION_SOUND = "Randomizer/Notification";

  const FADE_IN_TIME      = 8; // time when fade in stops, tics
  const FADE_OUT_TIME     = NOTIFICATION_TIME - 8; // time when fade out begins, tics
  const NOTIFICATION_TIME = 3 * TicRate;

} // class cd_Randomizer
