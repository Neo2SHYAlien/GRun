using Toybox.Application;
using Toybox.Graphics;
import Toybox.Lang;


class GRunApp extends Application.AppBase
{
  protected var gRunView;
  
  function initialize()
  {
    //System.println("Garmin Epix Gen 2 (High Memory)");
    AppBase.initialize();
    gRunView = new GRunViewHighMem();
  }
  
  
  public static function getTextDimensions(dc, value, font) as [Number, Number]
  {
    var textDimensions = dc.getTextDimensions(value, font) as [Number, Number];
    
    var yFactor = 1.65;
    if (font > 5) { yFactor = 1.75; }
    if (font < 2) { yFactor = 1.4; }
    textDimensions[1] = textDimensions[1] - (yFactor * dc.getFontDescent(font)).toNumber();
    
    return textDimensions;
  }
  
  
  public static function getYOffset(font)
  {
    var yOffset = -2;
    if (font >= 8) { yOffset = 2; }
    else if (font >= 7) { yOffset = 1; }
    else if (font >= 6) { yOffset = -1; }
    else if (font >= 5) { yOffset = 0; }
    else if (font >= 4) { yOffset = -3; }
    else if (font == 2) { yOffset = -3; }
    else if (font == 1) { yOffset = -1; }
    
    return yOffset;
  }

  
  function onSettingsChanged()
  {
    AppBase.onSettingsChanged();
    gRunView.initializeUserData();
  }
  

  function getInitialView()
  {
    return [ gRunView ];
  }
}