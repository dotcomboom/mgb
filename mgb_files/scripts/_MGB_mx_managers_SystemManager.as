package
{
   import flash.system.*;
   import flash.utils.*;
   import mx.core.*;
   import mx.managers.SystemManager;
   
   public class _MGB_mx_managers_SystemManager extends SystemManager implements IFlexModuleFactory
   {
       
      
      private var _preloadedRSLs:Dictionary;
      
      public function _MGB_mx_managers_SystemManager()
      {
         FlexVersion.compatibilityVersionString = "3.0.0";
         super();
      }
      
      override public function create(... rest) : Object
      {
         if(rest.length > 0 && !(rest[0] is String))
         {
            return super.create.apply(this,rest);
         }
         var _loc2_:String = rest.length == 0 ? "MGB" : String(rest[0]);
         var _loc3_:Class = Class(getDefinitionByName(_loc2_));
         if(!_loc3_)
         {
            return null;
         }
         var _loc4_:Object;
         if((_loc4_ = new _loc3_()) is IFlexModule)
         {
            IFlexModule(_loc4_).moduleFactory = this;
         }
         if(rest.length == 0)
         {
            EmbeddedFontRegistry.registerFonts(info()["fonts"],this);
         }
         return _loc4_;
      }
      
      override public function allowInsecureDomain(... rest) : void
      {
         var _loc2_:Object = null;
         Security.allowInsecureDomain(rest);
         for(_loc2_ in _preloadedRSLs)
         {
            if(Boolean(_loc2_.content) && "allowInsecureDomainInRSL" in _loc2_.content)
            {
               _loc2_.content["allowInsecureDomainInRSL"](rest);
            }
         }
      }
      
      override public function info() : Object
      {
         return {
            "compiledLocales":["en_US"],
            "compiledResourceBundleNames":["SharedResources","collections","containers","controls","core","effects","formatters","logging","messaging","rpc","skins","states","styles","validators"],
            "currentDomain":ApplicationDomain.currentDomain,
            "currentState":"",
            "fonts":{
               "abscissa":{
                  "regular":true,
                  "bold":true,
                  "italic":false,
                  "boldItalic":false
               },
               "argorpriht":{
                  "regular":true,
                  "bold":false,
                  "italic":false,
                  "boldItalic":false
               },
               "bradybunch":{
                  "regular":true,
                  "bold":false,
                  "italic":false,
                  "boldItalic":false
               },
               "ellianarellespath":{
                  "regular":true,
                  "bold":false,
                  "italic":false,
                  "boldItalic":false
               },
               "geosanslight":{
                  "regular":true,
                  "bold":false,
                  "italic":false,
                  "boldItalic":false
               },
               "illegaledding":{
                  "regular":true,
                  "bold":false,
                  "italic":false,
                  "boldItalic":false
               },
               "titlefont":{
                  "regular":true,
                  "bold":false,
                  "italic":false,
                  "boldItalic":false
               }
            },
            "frameRate":"32",
            "horizontalScrollPolicy":"off",
            "initialize":"initApplication()",
            "layout":"absolute",
            "mainClassName":"MGB",
            "minHeight":"600",
            "minWidth":"800",
            "mixins":["_MGB_FlexInit","_LinkButtonStyle","_DividedBoxStyle","_AccordionHeaderStyle","_alertButtonStyleStyle","_SWFLoaderStyle","_FormStyle","_headerDateTextStyle","_SwatchPanelStyle","_TitleWindowStyle","_HorizontalListStyle","_todayStyleStyle","_AccordionStyle","_windowStylesStyle","_FormItemLabelStyle","_TextInputStyle","_dateFieldPopupStyle","_ApplicationControlBarStyle","_FormItemStyle","_ComboBoxStyle","_dataGridStylesStyle","_TabStyle","_headerDragProxyStyleStyle","_popUpMenuStyle","_TabNavigatorStyle","_HSliderStyle","_DragManagerStyle","_NumericStepperStyle","_windowStatusStyle","_TextAreaStyle","_ContainerStyle","_swatchPanelTextFieldStyle","_RadioButtonStyle","_ButtonBarStyle","_textAreaHScrollBarStyleStyle","_comboDropdownStyle","_CheckBoxStyle","_ButtonStyle","_DateFieldStyle","_HDividedBoxStyle","_linkButtonStyleStyle","_richTextEditorTextAreaStyleStyle","_ControlBarStyle","_textAreaVScrollBarStyleStyle","_DateChooserStyle","_globalStyle","_ListBaseStyle","_AlertStyle","_TabBarStyle","_TileListStyle","_ApplicationStyle","_ToolTipStyle","_ButtonBarButtonStyle","_CursorManagerStyle","_opaquePanelStyle","_errorTipStyle","_DataGridStyle","_HRuleStyle","_activeTabStyleStyle","_PanelStyle","_ScrollBarStyle","_plainStyle","_activeButtonStyleStyle","_advancedDataGridStylesStyle","_CalendarLayoutStyle","_DataGridItemRendererStyle","_ColorPickerStyle","_VRuleStyle","_weekDayStyleStyle","_FriendshipItemRendererWatcherSetupUtil","_MessagesConversationItemRendererWatcherSetupUtil","_TilePreviewControlForActorMakerWatcherSetupUtil","_ActorGraphicsEffectComboBoxWatcherSetupUtil","_ProfileTabWatcherSetupUtil","_WallpostItemRendererWatcherSetupUtil","_GamePreviewRendererWatcherSetupUtil","_TutorialMakerTagComboBoxWatcherSetupUtil","_com_mgb_controls_InventoryItemRendererControlWatcherSetupUtil","_ProfileTextEntryWatcherSetupUtil","_FriendsListWatcherSetupUtil","_WallTabWatcherSetupUtil","_NewsLinkWatcherSetupUtil","_HeaderComponentWatcherSetupUtil","_com_mgb_modals_ChooseMusicFormWatcherSetupUtil","_com_mgb_controls_GameEngineMapResizePopupWatcherSetupUtil","_LoginTilePreviewControlWatcherSetupUtil","_LoginActorPreviewControlWatcherSetupUtil","_MessagesAttachmentsListEditorWatcherSetupUtil","_RendererMapPieceWatcherSetupUtil","_com_mgb_modals_ChooseMapJumpCellFormWatcherSetupUtil","_com_mgb_controls_RaterWatcherSetupUtil","_TileMakerPaletteWatcherSetupUtil","_com_mgb_modals_ChooseMapJumpFormWatcherSetupUtil","_com_mgb_modals_ChooseNewMapSizeFormWatcherSetupUtil","_LightweightAuthUIWatcherSetupUtil","_korax_controls_ColorPicker_ColorPickerWindowWatcherSetupUtil","_com_mgb_controls_NpcDialogWatcherSetupUtil","_com_mgb_controls_InventoryDialogWatcherSetupUtil","_GamesBrowserWatcherSetupUtil","_com_mgb_modals_ChoosePieceFormWatcherSetupUtil","_com_mgb_controls_BadgeWatcherSetupUtil","_EditFooterComponentWatcherSetupUtil","_ScreenShotAndAdWatcherSetupUtil","_LoginBrowseUserPreviewControlWatcherSetupUtil","_GameStatsDisplayWatcherSetupUtil","_GamesBrowserFeaturedGamesWatcherSetupUtil","_ToolButtonWatcherSetupUtil","_ToolButtonWideWatcherSetupUtil","_SelectBackgroundColorWatcherSetupUtil","_TutorialMakerControlWatcherSetupUtil","_ProjectsTabWatcherSetupUtil","_MapMakerControlWatcherSetupUtil","_GamePlayerControlWatcherSetupUtil","_AccountManagementWatcherSetupUtil","_MessagesComposerWatcherSetupUtil","_MessagesConversationViewWatcherSetupUtil","_ServiceStatusControlWatcherSetupUtil","_MessagesTabWatcherSetupUtil","_TileMakerControlWatcherSetupUtil","_ActorMakerControlWatcherSetupUtil","_MGBWatcherSetupUtil","_com_mgb_modals_ChooseTutorialWatcherSetupUtil","_com_mgb_modals_ShowSpaceUsageWatcherSetupUtil"],
            "pageTitle":"MyGameBuilder.com",
            "verticalScrollPolicy":"off"
         };
      }
      
      override public function get preloadedRSLs() : Dictionary
      {
         if(_preloadedRSLs == null)
         {
            _preloadedRSLs = new Dictionary(true);
         }
         return _preloadedRSLs;
      }
      
      override public function allowDomain(... rest) : void
      {
         var _loc2_:Object = null;
         Security.allowDomain(rest);
         for(_loc2_ in _preloadedRSLs)
         {
            if(Boolean(_loc2_.content) && "allowDomainInRSL" in _loc2_.content)
            {
               _loc2_.content["allowDomainInRSL"](rest);
            }
         }
      }
   }
}
