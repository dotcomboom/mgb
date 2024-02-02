package
{
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
   import mx.containers.Panel;
   import mx.containers.TabNavigator;
   import mx.containers.VBox;
   import mx.controls.TextArea;
   import mx.core.*;
   import mx.styles.*;
   
   public class About extends Canvas
   {
       
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function About()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Panel,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "layout":"absolute",
                        "title":"What is MyGameBuilder.com?",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":TabNavigator,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":VBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "label":"Summary",
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":TextArea,
                                             "stylesFactory":function():void
                                             {
                                                this.paddingBottom = 16;
                                                this.paddingTop = 16;
                                                this.paddingLeft = 16;
                                                this.paddingRight = 16;
                                                this.borderStyle = "none";
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100,
                                                   "editable":false,
                                                   "text":"\nMyGameBuilder.com is a free website for kids (and big kids!) who love games and want to start making their own.  To make games, you draw art (or find friends to help you), add some action rules to the art, and then place the pieces on maps. Without any programming, you have a game that you can play and share with others.\n\t\t\t\t\t\nThe site has been online since mid 2007 and we add features based on the suggestions from our users in the online MyGamebuilder discussion forums at http://MyGameBuilder.com/forum. \n\t\t\t\t\t\t\nSo far, we\'ve been adding RPG-style features since that\'s what everyone\'s been asking for, but we\'ll likely add other games types in the future. Right now, MGB does Zelda-esque action RPG games quite well, with big map areas, NPCs the player can talk to, shops, items, equipment, diverse enemies etc. \n\t\t\t\t\t"
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":VBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "label":"For Kids",
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":TextArea,
                                             "stylesFactory":function():void
                                             {
                                                this.paddingBottom = 16;
                                                this.paddingTop = 16;
                                                this.paddingLeft = 16;
                                                this.paddingRight = 16;
                                                this.borderStyle = "none";
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100,
                                                   "editable":false,
                                                   "text":"\nMyGameBuilder.com is a great place to learn to make pixel art for games. Beginners and experts will get lots of tips and feedback on the art they make.\n\nMyGameBuilder.com is also great place to try out game story ideas, or help in a team via level design, collision rules, testing or design ideas.\n\nIf you get stuck, ask on the forum for help, there are lots of folks there who can help out. You can also show off your new work there, or give us suggestions for new features for the MGB site - we update it when we can!"
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":VBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "label":"For Parents",
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":TextArea,
                                             "stylesFactory":function():void
                                             {
                                                this.paddingBottom = 16;
                                                this.paddingTop = 16;
                                                this.paddingLeft = 16;
                                                this.paddingRight = 16;
                                                this.borderStyle = "none";
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100,
                                                   "editable":false,
                                                   "text":"\nWe made \"MGB\" because we see so many smart kids who love games, have started getting interesting ideas for their own games, but find that game development systems are complex, confusing and hard to get help when stuck. MGB is a safe place where kids have an easy \'one-stop-shop\' for making games with easy access to help.\n\t\t\t\t\t\t\nMaking video games exercises a huge range of skills - drawing & art skills for the graphics, logical thinking & pre-programming skills for actor maker, story & writing skills for the game story/plot/dialog, critical thinking skills for testing the games they make, and of course project skills such as  planning work, keeping track of problems, and finishing!\n\t\t\t\t\t\t\nWe\'d love feedback from parents on what you\'d like to see in this site - please mail your thoughts or suggestions to us at mygamebuilder@jollygoodideas.com"
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
               })]};
            }
         });
         super();
         mx_internal::_document = this;
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         super.initialize();
      }
   }
}
