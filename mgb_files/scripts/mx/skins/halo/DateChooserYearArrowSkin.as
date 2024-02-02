package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.FlexVersion;
   import mx.core.mx_internal;
   import mx.skins.Border;
   import mx.utils.ColorUtil;
   
   use namespace mx_internal;
   
   public class DateChooserYearArrowSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function DateChooserYearArrowSkin()
      {
         super();
      }
      
      override public function get measuredWidth() : Number
      {
         return 6;
      }
      
      override public function get measuredHeight() : Number
      {
         return FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0 ? 4 : 6;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:uint = getStyle("themeColor");
         var _loc4_:Number = ColorUtil.adjustBrightness2(_loc3_,-25);
         var _loc5_:uint = getStyle("iconColor");
         var _loc6_:Graphics;
         (_loc6_ = graphics).clear();
         switch(name)
         {
            case "prevYearUpSkin":
            case "nextYearUpSkin":
               break;
            case "prevYearOverSkin":
            case "nextYearOverSkin":
               _loc5_ = _loc3_;
               break;
            case "prevYearDownSkin":
            case "nextYearDownSkin":
               _loc5_ = _loc4_;
               break;
            case "prevYearDisabledSkin":
            case "nextYearDisabledSkin":
               _loc5_ = getStyle("disabledIconColor");
         }
         _loc6_.beginFill(_loc5_);
         if(name.charAt(0) == "p")
         {
            _loc6_.moveTo(param1 / 2,param2 / 2 + 2);
            _loc6_.lineTo(param1 / 2 - 3,param2 / 2 - 2);
            _loc6_.lineTo(param1 / 2 + 3,param2 / 2 - 2);
            _loc6_.lineTo(param1 / 2,param2 / 2 + 2);
         }
         else
         {
            _loc6_.moveTo(param1 / 2,param2 / 2 - 2);
            _loc6_.lineTo(param1 / 2 - 3,param2 / 2 + 2);
            _loc6_.lineTo(param1 / 2 + 3,param2 / 2 + 2);
            _loc6_.lineTo(param1 / 2,param2 / 2 - 2);
         }
         _loc6_.endFill();
      }
   }
}
