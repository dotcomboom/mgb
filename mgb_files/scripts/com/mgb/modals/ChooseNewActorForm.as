package com.mgb.modals
{
   import com.mgb.data.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.TabNavigator;
   import mx.containers.TitleWindow;
   import mx.controls.HRule;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.controls.VRule;
   import mx.core.*;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.managers.*;
   import mx.styles.*;
   
   public class ChooseNewActorForm extends TitleWindow
   {
       
      
      private var _embed_mxml__________Resources_newActor_WestPush_PNG_95533673:Class;
      
      private var _embed_mxml__________Resources_newActor_shot_png_1600080123:Class;
      
      private var _embed_mxml__________Resources_newActor_ShotArmor_PNG_1775868137:Class;
      
      private var _embed_mxml__________Resources_newActor_PlayerBlock_PNG_1148290377:Class;
      
      private var _embed_mxml__________Resources_newActor_enemy_png_352505655:Class;
      
      private var _embed_mxml__________Resources_newActor_EnemyBlock_PNG_964312471:Class;
      
      private var _embed_mxml__________Resources_newActor_ShotPlayer_PNG_828647803:Class;
      
      private var _embed_mxml__________Resources_newActor_RandomPush_PNG_830172535:Class;
      
      private var _embed_mxml__________Resources_newActor_InvinciblePotion_PNG_1545697227:Class;
      
      private var _embed_mxml__________Resources_newActor_ice_png_180931891:Class;
      
      private var _embed_mxml__________Resources_newActor_DamageFloor_PNG_1093825769:Class;
      
      private var _embed_mxml__________Resources_newActor_player_png_412722551:Class;
      
      private var _embed_mxml__________Resources_newActor_Generator_PNG_1739258829:Class;
      
      private var _embed_mxml__________Resources_newActor_eastpush_PNG_867285517:Class;
      
      private var _embed_mxml__________Resources_newActor_BackPush_PNG_99685897:Class;
      
      private var _embed_mxml__________Resources_newActor_SouthPush_PNG_1236559819:Class;
      
      private var _embed_mxml__________Resources_newActor_Win_PNG_797065751:Class;
      
      private var _embed_mxml__________Resources_newActor_TouchEnemy_PNG_157433175:Class;
      
      private var _embed_mxml__________Resources_newActor_maxhp_png_344645303:Class;
      
      private var _embed_mxml__________Resources_newActor_NorthPush_PNG_1774786597:Class;
      
      private var _embed_mxml__________Resources_newActor_playerTouch_png_1278365029:Class;
      
      private var _embed_mxml__________Resources_newActor_HealthPotion_PNG_469765843:Class;
      
      private var _embed_mxml__________Resources_newActor_slider_png_312303991:Class;
      
      private var _embed_mxml__________Resources_newActor_floor_png_713892809:Class;
      
      private var _embed_mxml__________Resources_newActor_MeleeWeapon_PNG_1195282249:Class;
      
      private var _embed_mxml__________Resources_newActor_armour_PNG_406668631:Class;
      
      private var _embed_mxml__________Resources_newActor_friend_png_702170739:Class;
      
      private var _embed_mxml__________Resources_newActor_ShotEnemy_PNG_1774835781:Class;
      
      private var _embed_mxml__________Resources_newActor_foreground_png_962870347:Class;
      
      private var _embed_mxml__________Resources_newActor_item_png_322904779:Class;
      
      private var _embed_mxml__________Resources_newActor_Door_PNG_530332435:Class;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _embed_mxml__________Resources_newActor_wall_png_792259291:Class;
      
      public function ChooseNewActorForm()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "propertiesFactory":function():Object
            {
               return {
                  "height":375,
                  "width":710,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":TabNavigator,
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Canvas,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "label":"Basics",
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image1_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_player_png_412722551,
                                             "x":14,
                                             "y":10
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":24,
                                             "text":"The player\'s character",
                                             "width":250,
                                             "x":74,
                                             "height":46,
                                             "truncateToFit":true
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image2_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_enemy_png_352505655,
                                             "x":14,
                                             "y":64
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":78,
                                             "text":"Enemies and bosses",
                                             "height":18,
                                             "width":250,
                                             "x":74
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image3_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_friend_png_702170739,
                                             "x":14,
                                             "y":118
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":132,
                                             "text":"Friendly characters who help the player",
                                             "width":250,
                                             "x":74
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image4_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_shot_png_1600080123,
                                             "x":14,
                                             "y":172
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":186,
                                             "text":"A projectile attack - arrow, fireball, etc",
                                             "width":250,
                                             "x":74
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image5_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_ice_png_180931891,
                                             "x":14,
                                             "y":226
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":234,
                                             "text":"A floor tile. Actors who step onto this tile will keep on moving past it",
                                             "width":250,
                                             "x":74
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image6_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_floor_png_713892809,
                                             "x":352,
                                             "y":10
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":24,
                                             "text":"A floor tile. Decorative, but has no effect",
                                             "width":250,
                                             "x":412
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image7_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_wall_png_792259291,
                                             "x":352,
                                             "y":64
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":78,
                                             "text":"A wall. Blocks a player or enemy",
                                             "width":250,
                                             "x":412
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image8_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_item_png_322904779,
                                             "x":352,
                                             "y":118
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":132,
                                             "text":"An item that has some effect",
                                             "width":250,
                                             "x":412
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image9_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_slider_png_312303991,
                                             "x":352,
                                             "y":172
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":186,
                                             "text":"A solid block that can be pushed to make it slide some distance",
                                             "width":250,
                                             "x":412
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image10_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_foreground_png_962870347,
                                             "x":352,
                                             "y":226
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":234,
                                             "text":"A foreground tile - used on the foreground map layer. Decorative, but has no effect",
                                             "width":250,
                                             "x":412,
                                             "height":52
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":VRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":328,
                                             "y":10,
                                             "width":20,
                                             "height":266
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Canvas,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "label":"Player",
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":0,
                                             "text":"Player characters can have touch, shoot and/or melee -type attacks.\nA player might initially have no way to shoot or attack, but pick up items that provide these abilities.\nA player can use items and talk to Non-Player Characters\n",
                                             "width":652,
                                             "x":10
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image11_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_player_png_412722551,
                                             "x":14,
                                             "y":72
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":68,
                                             "text":"A player with no attacks. This good for an RPG-style game as the player can gain abilities during the game.",
                                             "width":250,
                                             "x":74
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image12_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_ShotPlayer_PNG_828647803,
                                             "x":14,
                                             "y":154
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":150,
                                             "text":"A player who can shoot. This is a good start for action-style games. You will also need an actor for the \'shots\'...",
                                             "width":250,
                                             "x":74,
                                             "height":52
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image13_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_shot_png_1600080123,
                                             "x":24,
                                             "y":225
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":221,
                                             "text":"A projectile attack - arrow, bullet, fireball, etc. The  \'shooting actor\' has an option selecting which actor provides the shot graphics.",
                                             "width":249,
                                             "x":84
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image14_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_playerTouch_png_1278365029,
                                             "x":352,
                                             "y":72
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":66,
                                             "text":"A player who starts with the ability to do damage by just touching enemies. This is good for \'rampage\'-style games.",
                                             "width":250,
                                             "x":412
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image15_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_player_png_412722551,
                                             "x":352,
                                             "y":188
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":167,
                                             "text":"A player who starts with the ability to do damage using a melee attack. This is good for many kinds of game, but it is a more advanced feature and requires a lot of graphics to be animated.",
                                             "width":250,
                                             "x":412
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":VRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":328,
                                             "y":64,
                                             "width":20,
                                             "height":212
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":10,
                                             "y":134,
                                             "width":652,
                                             "height":10
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Canvas,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "label":"Equipment",
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":0,
                                             "text":"The player can pick up and then Equip certain items in order to gain or improve abilities...",
                                             "width":652,
                                             "x":10
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":VRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":328,
                                             "y":26,
                                             "width":20,
                                             "height":260
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":10,
                                             "y":203,
                                             "width":652,
                                             "height":10
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image16_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_ShotArmor_PNG_1775868137,
                                             "x":14,
                                             "y":54
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":41,
                                             "text":"An item that enables the player to shoot. This could be a gun, a bow, a magic spell, a staff, a salt pot etc. You will also need an actor for the \'shots\'...",
                                             "width":250,
                                             "x":74
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image17_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_item_png_322904779,
                                             "x":20,
                                             "y":135
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":121,
                                             "text":"A Shot modifier can improve the range, rate, or damage of existing shot attacks. This might be represented as a ring, amulet, etc",
                                             "width":240,
                                             "x":80
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image18_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_MeleeWeapon_PNG_1195282249,
                                             "x":358,
                                             "y":54
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":36,
                                             "text":"A Melee weapon enables the player to melee attack. This could be a stick, a sword, a fish, a yoyo etc.. This is a more advanced feature since it requires many animations.",
                                             "width":264,
                                             "x":414
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image19_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_item_png_322904779,
                                             "x":368,
                                             "y":135
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":130,
                                             "text":"A Melee modifier can improve the damage or speed of existing melee attacks. This might be represented as a ring, amulet, etc",
                                             "width":254,
                                             "x":424
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image20_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_armour_PNG_406668631,
                                             "x":358,
                                             "y":224
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":220,
                                             "text":"Armor increases the player\'s ability to resist attacks. Multiple pieces of armor can be combined to get a better defense.",
                                             "width":260,
                                             "x":414
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Canvas,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "label":"Enemies",
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":0,
                                             "text":"Enemies are a kind of \'Non Player Character\' actor that can move, shoot, melee (attack) and do touch damage to the player.\nThey can be more complex and spawn/drop items when killed.  Enemies cannot use items.",
                                             "width":652,
                                             "x":10
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":VRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":328,
                                             "y":54,
                                             "width":20,
                                             "height":111
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":338,
                                             "y":159,
                                             "width":324,
                                             "height":10
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":334,
                                             "y":220,
                                             "width":324,
                                             "height":10
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":14,
                                             "y":159,
                                             "width":324,
                                             "height":10
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":VRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":325,
                                             "y":225,
                                             "width":20,
                                             "height":60
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image21_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_TouchEnemy_PNG_157433175,
                                             "x":10,
                                             "y":52
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":59,
                                             "text":"An enemy that moves randomly and can harm the player by touch.",
                                             "width":250,
                                             "x":70
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image22_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_ShotEnemy_PNG_1774835781,
                                             "x":10,
                                             "y":169
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":172,
                                             "text":"An enemy that moves randomly and shoots. You will also need an actor for the \'shots\'...",
                                             "width":250,
                                             "x":74
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image23_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_shot_png_1600080123,
                                             "x":10,
                                             "y":226
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":229,
                                             "text":"A projectile attack - arrow, fireball, etc. The  \'shooting actor\' will select which actor provides the shot graphics.",
                                             "width":240,
                                             "x":74
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image24_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_ShotEnemy_PNG_1774835781,
                                             "x":345,
                                             "y":168
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":164,
                                             "text":"An enemy that stays away from the player and shoots. You will also need an actor for the \'shots\'...",
                                             "width":260,
                                             "x":407
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image25_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_Generator_PNG_1739258829,
                                             "x":345,
                                             "y":231
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":228,
                                             "text":"Something that generates new enemies. The rate of generation and what is generated can be selected. This could attack you too!",
                                             "width":260,
                                             "x":406
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image26_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_TouchEnemy_PNG_157433175,
                                             "x":10,
                                             "y":109
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":118,
                                             "text":"An enemy that moves towards the player and can harm the player by touch.",
                                             "width":250,
                                             "x":70
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Canvas,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "label":"Floors & Pushers",
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":0,
                                             "text":"\"Floor\' actors are typically decorative tiles that are placed on the background layer of a map. However, there are special kinds of floor that push actors in certain directions when the actor stands on that floor...",
                                             "width":668,
                                             "x":10
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":54,
                                             "text":"A normal floor tile. Decorative, but has no effect",
                                             "width":250,
                                             "x":70
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image27_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_floor_png_713892809,
                                             "x":10,
                                             "y":58
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":114,
                                             "text":"A floor that pushes actors onward, as if they were on ice and cannot stop moving",
                                             "width":250,
                                             "x":66
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image28_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_ice_png_180931891,
                                             "x":10,
                                             "y":118
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":174,
                                             "text":"A floor that pushes actors back the way they came from",
                                             "width":250,
                                             "x":70
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image29_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_BackPush_PNG_99685897,
                                             "x":10,
                                             "y":178
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":234,
                                             "text":"A floor that pushes actors in a randomly chosen direction - North, East, South or West",
                                             "width":250,
                                             "x":70
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image30_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_RandomPush_PNG_830172535,
                                             "x":10,
                                             "y":238
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":VRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":328,
                                             "y":54,
                                             "width":20,
                                             "height":232
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":54,
                                             "text":"A damage-inflicting floor. It might be lava, acid, a spike etc",
                                             "width":264,
                                             "x":414
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image31_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_DamageFloor_PNG_1093825769,
                                             "x":358,
                                             "y":58
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":164,
                                             "text":"These floors push the player North, East, South and West respectively",
                                             "width":131,
                                             "x":415
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image32_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_NorthPush_PNG_1774786597,
                                             "x":591,
                                             "y":118
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image33_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_eastpush_PNG_867285517,
                                             "x":619,
                                             "y":174
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image34_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_SouthPush_PNG_1236559819,
                                             "x":591,
                                             "y":230
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image35_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_WestPush_PNG_95533673,
                                             "x":563,
                                             "y":174
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Canvas,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "label":"Walls & Blocks",
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":0,
                                             "text":"\'Wall\' actors are placed on the background layer of a map and can stop NPCs and/or players from passing through. There are also \'blocks\' which are like walls, except they are placed on the active layer and can be pushed by the player",
                                             "width":668,
                                             "x":10
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":64,
                                             "text":"This wall prevents all actors from passing through it.",
                                             "width":250,
                                             "x":70
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image36_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_wall_png_792259291,
                                             "x":10,
                                             "y":68
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":143,
                                             "text":"This kind of wall only stops players from passing through it.",
                                             "width":250,
                                             "x":71
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image37_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_PlayerBlock_PNG_1148290377,
                                             "x":10,
                                             "y":145
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":222,
                                             "text":"This kind of wall only stops NPCs and enemy actors from passing through it.",
                                             "width":250,
                                             "x":66
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image38_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_EnemyBlock_PNG_964312471,
                                             "x":10,
                                             "y":226
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image39_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_Door_PNG_530332435,
                                             "x":356,
                                             "y":68
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":64,
                                             "text":"This kind of wall acts like a door - it allows the player to pass if they are carrying a specified item.",
                                             "width":250,
                                             "x":416
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image40_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_wall_png_792259291,
                                             "x":356,
                                             "y":216
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":195,
                                             "text":"This wall has \'conditional behavior\'. This is an example of an advanced feature that lets actors appear or disappear depending on which other actors are currently on the map...",
                                             "width":261,
                                             "x":416
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":VRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":328,
                                             "y":42,
                                             "width":20,
                                             "height":232
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":138,
                                             "text":"A solid block that can be pushed to make it slide some distance",
                                             "width":261,
                                             "x":417
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image41_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_slider_png_312303991,
                                             "x":357,
                                             "y":137
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Canvas,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "label":"Items",
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":VRule,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":328,
                                             "y":47,
                                             "width":20,
                                             "height":232
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":0,
                                             "text":"Items can be instantly used when encountered, or picked up and used/equipped later.",
                                             "width":668,
                                             "x":10
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image42_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_maxhp_png_344645303,
                                             "x":10,
                                             "y":47
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":41,
                                             "text":"This instantly raises the player\'s maximum allowed health level by a specified amount.",
                                             "width":250,
                                             "x":70
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image43_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":"Resources/newActor_instantHealth.PNG",
                                             "x":10,
                                             "y":109
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":103,
                                             "text":"This item instantly heals the player by a specified amount.",
                                             "width":250,
                                             "x":70
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image44_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_HealthPotion_PNG_469765843,
                                             "x":10,
                                             "y":169
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":163,
                                             "text":"This is a potion/meal/herb/etc that can be carried and used to heal the player by a specified amount when needed.",
                                             "width":250,
                                             "x":66
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image45_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_item_png_322904779,
                                             "x":358,
                                             "y":45
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":45,
                                             "width":264,
                                             "x":414,
                                             "text":"This instantly makes the player temporarily invicible."
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image46_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_InvinciblePotion_PNG_1545697227,
                                             "x":358,
                                             "y":107
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":101,
                                             "width":264,
                                             "x":414,
                                             "text":"This is a potion/meal/herb/etc that can be carried and used to make the player temporarily invincible when needed."
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image47_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":"Resources/newActor_instantPoints.png",
                                             "x":358,
                                             "y":169
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":165,
                                             "text":"This instantly changes the player\'s score.",
                                             "width":264,
                                             "x":414
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "events":{"click":"___ChooseNewActorForm_Image48_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__________Resources_newActor_Win_PNG_797065751,
                                             "x":358,
                                             "y":231
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":227,
                                             "text":"Victory! When the player picks up this item, the game is immediately over and they have won!",
                                             "width":264,
                                             "x":414
                                          };
                                       }
                                    })]
                                 };
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         _embed_mxml__________Resources_newActor_BackPush_PNG_99685897 = ChooseNewActorForm__embed_mxml__________Resources_newActor_BackPush_PNG_99685897;
         _embed_mxml__________Resources_newActor_DamageFloor_PNG_1093825769 = ChooseNewActorForm__embed_mxml__________Resources_newActor_DamageFloor_PNG_1093825769;
         _embed_mxml__________Resources_newActor_Door_PNG_530332435 = ChooseNewActorForm__embed_mxml__________Resources_newActor_Door_PNG_530332435;
         _embed_mxml__________Resources_newActor_EnemyBlock_PNG_964312471 = ChooseNewActorForm__embed_mxml__________Resources_newActor_EnemyBlock_PNG_964312471;
         _embed_mxml__________Resources_newActor_Generator_PNG_1739258829 = ChooseNewActorForm__embed_mxml__________Resources_newActor_Generator_PNG_1739258829;
         _embed_mxml__________Resources_newActor_HealthPotion_PNG_469765843 = ChooseNewActorForm__embed_mxml__________Resources_newActor_HealthPotion_PNG_469765843;
         _embed_mxml__________Resources_newActor_InvinciblePotion_PNG_1545697227 = ChooseNewActorForm__embed_mxml__________Resources_newActor_InvinciblePotion_PNG_1545697227;
         _embed_mxml__________Resources_newActor_MeleeWeapon_PNG_1195282249 = ChooseNewActorForm__embed_mxml__________Resources_newActor_MeleeWeapon_PNG_1195282249;
         _embed_mxml__________Resources_newActor_NorthPush_PNG_1774786597 = ChooseNewActorForm__embed_mxml__________Resources_newActor_NorthPush_PNG_1774786597;
         _embed_mxml__________Resources_newActor_PlayerBlock_PNG_1148290377 = ChooseNewActorForm__embed_mxml__________Resources_newActor_PlayerBlock_PNG_1148290377;
         _embed_mxml__________Resources_newActor_RandomPush_PNG_830172535 = ChooseNewActorForm__embed_mxml__________Resources_newActor_RandomPush_PNG_830172535;
         _embed_mxml__________Resources_newActor_ShotArmor_PNG_1775868137 = ChooseNewActorForm__embed_mxml__________Resources_newActor_ShotArmor_PNG_1775868137;
         _embed_mxml__________Resources_newActor_ShotEnemy_PNG_1774835781 = ChooseNewActorForm__embed_mxml__________Resources_newActor_ShotEnemy_PNG_1774835781;
         _embed_mxml__________Resources_newActor_ShotPlayer_PNG_828647803 = ChooseNewActorForm__embed_mxml__________Resources_newActor_ShotPlayer_PNG_828647803;
         _embed_mxml__________Resources_newActor_SouthPush_PNG_1236559819 = ChooseNewActorForm__embed_mxml__________Resources_newActor_SouthPush_PNG_1236559819;
         _embed_mxml__________Resources_newActor_TouchEnemy_PNG_157433175 = ChooseNewActorForm__embed_mxml__________Resources_newActor_TouchEnemy_PNG_157433175;
         _embed_mxml__________Resources_newActor_WestPush_PNG_95533673 = ChooseNewActorForm__embed_mxml__________Resources_newActor_WestPush_PNG_95533673;
         _embed_mxml__________Resources_newActor_Win_PNG_797065751 = ChooseNewActorForm__embed_mxml__________Resources_newActor_Win_PNG_797065751;
         _embed_mxml__________Resources_newActor_armour_PNG_406668631 = ChooseNewActorForm__embed_mxml__________Resources_newActor_armour_PNG_406668631;
         _embed_mxml__________Resources_newActor_eastpush_PNG_867285517 = ChooseNewActorForm__embed_mxml__________Resources_newActor_eastpush_PNG_867285517;
         _embed_mxml__________Resources_newActor_enemy_png_352505655 = ChooseNewActorForm__embed_mxml__________Resources_newActor_enemy_png_352505655;
         _embed_mxml__________Resources_newActor_floor_png_713892809 = ChooseNewActorForm__embed_mxml__________Resources_newActor_floor_png_713892809;
         _embed_mxml__________Resources_newActor_foreground_png_962870347 = ChooseNewActorForm__embed_mxml__________Resources_newActor_foreground_png_962870347;
         _embed_mxml__________Resources_newActor_friend_png_702170739 = ChooseNewActorForm__embed_mxml__________Resources_newActor_friend_png_702170739;
         _embed_mxml__________Resources_newActor_ice_png_180931891 = ChooseNewActorForm__embed_mxml__________Resources_newActor_ice_png_180931891;
         _embed_mxml__________Resources_newActor_item_png_322904779 = ChooseNewActorForm__embed_mxml__________Resources_newActor_item_png_322904779;
         _embed_mxml__________Resources_newActor_maxhp_png_344645303 = ChooseNewActorForm__embed_mxml__________Resources_newActor_maxhp_png_344645303;
         _embed_mxml__________Resources_newActor_playerTouch_png_1278365029 = ChooseNewActorForm__embed_mxml__________Resources_newActor_playerTouch_png_1278365029;
         _embed_mxml__________Resources_newActor_player_png_412722551 = ChooseNewActorForm__embed_mxml__________Resources_newActor_player_png_412722551;
         _embed_mxml__________Resources_newActor_shot_png_1600080123 = ChooseNewActorForm__embed_mxml__________Resources_newActor_shot_png_1600080123;
         _embed_mxml__________Resources_newActor_slider_png_312303991 = ChooseNewActorForm__embed_mxml__________Resources_newActor_slider_png_312303991;
         _embed_mxml__________Resources_newActor_wall_png_792259291 = ChooseNewActorForm__embed_mxml__________Resources_newActor_wall_png_792259291;
         super();
         mx_internal::_document = this;
         this.height = 375;
         this.width = 710;
         this.title = "Choose the kind of actor you want to create, then modify the detailed choices in Actor Maker";
         this.showCloseButton = true;
         this.autoLayout = false;
         this.layout = "absolute";
         this.addEventListener("creationComplete",___ChooseNewActorForm_TitleWindow1_creationComplete);
         this.addEventListener("close",___ChooseNewActorForm_TitleWindow1_close);
      }
      
      public function ___ChooseNewActorForm_Image33_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplatePusher_East);
      }
      
      public function ___ChooseNewActorForm_Image12_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplatePlayer_Shoots);
      }
      
      public function ___ChooseNewActorForm_Image37_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateWall_BlocksPlayer);
      }
      
      public function ___ChooseNewActorForm_Image16_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateProjectileWeapon);
      }
      
      public function ___ChooseNewActorForm_Image40_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateWall_Conditional);
      }
      
      public function ___ChooseNewActorForm_TitleWindow1_close(param1:CloseEvent) : void
      {
         doCancel();
      }
      
      public function ___ChooseNewActorForm_Image44_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateItem_HealLater);
      }
      
      public function ___ChooseNewActorForm_Image23_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateShot);
      }
      
      public function ___ChooseNewActorForm_Image8_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateItem);
      }
      
      public function ___ChooseNewActorForm_Image48_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateItem_VictoryNow);
      }
      
      public function ___ChooseNewActorForm_Image27_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateFloor);
      }
      
      private function doInit() : void
      {
         PopUpManager.centerPopUp(this);
      }
      
      public function ___ChooseNewActorForm_Image4_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateShot);
      }
      
      public function ___ChooseNewActorForm_Image30_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplatePusher_Random);
      }
      
      public function ___ChooseNewActorForm_Image34_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplatePusher_South);
      }
      
      public function ___ChooseNewActorForm_Image13_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateShot);
      }
      
      public function ___ChooseNewActorForm_Image38_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateWall_BlocksNPC);
      }
      
      public function ___ChooseNewActorForm_Image17_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateShotModifier);
      }
      
      public function ___ChooseNewActorForm_Image1_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplatePlayer);
      }
      
      public function ___ChooseNewActorForm_Image41_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateSlidingBlock);
      }
      
      public function ___ChooseNewActorForm_Image20_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateArmor);
      }
      
      public function ___ChooseNewActorForm_Image5_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateIce);
      }
      
      public function ___ChooseNewActorForm_Image45_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateItem_InvincibilityNow);
      }
      
      public function ___ChooseNewActorForm_Image9_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateSlidingBlock);
      }
      
      public function ___ChooseNewActorForm_Image24_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateEnemy_ShootsFromAfar);
      }
      
      public function ___ChooseNewActorForm_Image28_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateIce);
      }
      
      private function doChoose(param1:String) : void
      {
         dispatchEvent(new ChooseNewActorEvent("select",param1));
         PopUpManager.removePopUp(this);
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         super.initialize();
      }
      
      public function ___ChooseNewActorForm_Image31_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateFloor_Damager);
      }
      
      public function ___ChooseNewActorForm_Image10_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateFloor);
      }
      
      public function ___ChooseNewActorForm_Image35_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplatePusher_West);
      }
      
      public function ___ChooseNewActorForm_Image14_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplatePlayer_TouchDamage);
      }
      
      public function ___ChooseNewActorForm_Image39_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateDoor);
      }
      
      public function ___ChooseNewActorForm_Image18_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateMeleeWeapon);
      }
      
      public function ___ChooseNewActorForm_Image2_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateEnemy);
      }
      
      public function ___ChooseNewActorForm_Image42_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateItem_MaxHealthBoost);
      }
      
      public function ___ChooseNewActorForm_Image21_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateEnemy_TouchDamage);
      }
      
      public function ___ChooseNewActorForm_Image6_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateFloor);
      }
      
      public function ___ChooseNewActorForm_Image46_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateItem_InvincibilityLater);
      }
      
      public function ___ChooseNewActorForm_Image25_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateEnemyGenerator);
      }
      
      public function ___ChooseNewActorForm_Image29_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateBounce);
      }
      
      public function ___ChooseNewActorForm_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      public function ___ChooseNewActorForm_Image32_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplatePusher_North);
      }
      
      public function ___ChooseNewActorForm_Image11_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplatePlayer);
      }
      
      public function ___ChooseNewActorForm_Image36_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateWall);
      }
      
      public function ___ChooseNewActorForm_Image15_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplatePlayer_MeleeDamage);
      }
      
      public function ___ChooseNewActorForm_Image19_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateMeleeWeaponModifier);
      }
      
      private function doCancel() : void
      {
         dispatchEvent(new ChooseNewActorEvent("cancel"));
         PopUpManager.removePopUp(this);
      }
      
      public function ___ChooseNewActorForm_Image3_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateFriend);
      }
      
      public function ___ChooseNewActorForm_Image43_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateItem_HealNow);
      }
      
      public function ___ChooseNewActorForm_Image7_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateWall);
      }
      
      public function ___ChooseNewActorForm_Image47_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateItem_ScorePoints);
      }
      
      public function ___ChooseNewActorForm_Image26_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateEnemy_TouchDamageHuntsPlayer);
      }
      
      public function ___ChooseNewActorForm_Image22_click(param1:MouseEvent) : void
      {
         doChoose(MgbActor.alTemplateEnemy_Shoots);
      }
   }
}
