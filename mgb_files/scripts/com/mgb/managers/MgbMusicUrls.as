package com.mgb.managers
{
   public class MgbMusicUrls
   {
      
      public static const soundSourceAttributionMessage:String = "Sound sources used here with permission:\n" + "  JoCo files: publicly-licensed (JonathanCoulton.com)\n" + "  McLeod9 files: usage permission granted by Greg McLeod (McLeodGaming.com)\n" + "  Shudder files: usage permission granted by DrBlakeman (ShudderMusic.com)\n" + "  Soundsnap files: publicly-licensed files (SoundSnap.com)";
      
      public static const musicList:Array = ["none","joco/Skullcrusher%20Mountain.mp3","joco/MrFancyPants.mp3","joco/WhenYouGo.mp3","joco/SkyMall.mp3","joco/ImYourMoon.mp3","joco/IFeelFantastic.mp3","joco/CreepyDoll.mp3","joco/ChironBetaPrime.mp3","joco/BigBadWorldOne.mp3","soundsnap/multibeat2.mp3","soundsnap/Grubberoid.mp3","soundsnap/90 BPM BIG.mp3","soundsnap/90 BPM BIG 02.mp3","soundsnap/80_0_4_C_dstringplukz_mo.mp3","soundsnap/ab.mp3","soundsnap/bass chord.mp3","soundsnap/bass-and-metallic-scrapes.mp3","soundsnap/bassline - 02.mp3","soundsnap/bawa sushil.mp3","soundsnap/BigMovieScore-104.mp3","soundsnap/Crackle 105BPM.mp3","soundsnap/deepest-dank-jungle-130.mp3","soundsnap/E_Melody1_Cm_120.mp3","soundsnap/EarCatcher.mp3","soundsnap/Fascinate.mp3","soundsnap/feel-the-static-synth-C-138.mp3","soundsnap/funkyhollywood.mp3","soundsnap/happy-woodwind-loop-100.mp3","soundsnap/Heart Drum 130 BPM.mp3","soundsnap/Heart Drum 90 BPM.mp3","soundsnap/Horror Harp.mp3","soundsnap/Horror Strings 3.mp3","soundsnap/Horror Strings.mp3","soundsnap/Horror Violins 3.mp3","soundsnap/mash-together-bass.mp3","soundsnap/Meditation 70BPM.mp3","soundsnap/MelodicMinorlogic-bass-128.mp3","soundsnap/NoWayOut.mp3","soundsnap/pagoda-synth-130.mp3","soundsnap/pipe_organ4.mp3","soundsnap/polka.mp3","soundsnap/Psycho.mp3","soundsnap/Rarirara 120BPM.mp3","soundsnap/Rhodes BPM 86_18 C.mp3","soundsnap/Robodrone-synth-D-128.mp3","soundsnap/sinister-pad-G_-138.mp3","soundsnap/spookyorgan.mp3","soundsnap/Strange Alarm 130BPM.mp3","soundsnap/sub-dubble-bass.mp3","soundsnap/trippin-beat-got-air-130.mp3","soundsnap/Vintage Loop 120BPM.mp3","shudder/Anchors.mp3","shudder/Another Buena Vista Sunset.mp3","shudder/Beam of Light.mp3","shudder/gnight.mp3","shudder/Horses in the Dark.mp3","shudder/In Case of Fire.mp3","shudder/Ma Blues.mp3","shudder/MIGRAINE.mp3","shudder/Nothing Like the Summer.mp3","shudder/Now What ~or~ The Last Laugh.mp3","shudder/Penguin.mp3","shudder/Regarding the Phosphenes.mp3","shudder/Sandalwood and Leather.mp3","shudder/Something (April Breeze).mp3","shudder/Something (Else).mp3","shudder/Song of the Unemployed.mp3","shudder/The Most Incredible Thing I Heard Last Year.mp3","shudder/The Scramble.mp3","shudder/Therapy, Etc.mp3","shudder/Thoughts on the Nature of Existence.mp3","McLeod9/AnimusTheme (Extended).mp3","McLeod9/AnimusTheme.mp3","McLeod9/AnimusThemeRevisited.mp3","McLeod9/Aura.mp3","McLeod9/BeginningAnew.mp3","McLeod9/BeneathTheLab.mp3","McLeod9/BitsForDinner.mp3","McLeod9/CleodGroove.mp3","McLeod9/CleodStorm.mp3","McLeod9/CrystalCaverns.mp3","McLeod9/Cyber Track Act 1 Cleod 9 Remix.mp3","McLeod9/DandyAndSwell.mp3","McLeod9/Depredation.mp3","McLeod9/Depredation_v2.mp3","McLeod9/DistantAmbiance.mp3","McLeod9/DuskInterlude.mp3","McLeod9/EndofAllThis.mp3","McLeod9/Fear Ave.mp3","McLeod9/FightingOfTheSpiritRemix.mp3","McLeod9/FinalHope.mp3","McLeod9/MindGear.mp3","McLeod9/PokemonBattleRemix.mp3","McLeod9/PureEternity.mp3","McLeod9/TheFirstMovement.mp3","McLeod9/TheLastBloodshed.mp3","McLeod9/TheOriginalBlade.mp3","McLeod9/ThePerfectBattle.mp3","McLeod9/Wrecked.mp3"];
      
      private static var musicUrlPrefix:String = "http://s3.amazonaws.com/apphost/game_music/";
       
      
      public function MgbMusicUrls()
      {
         super();
      }
      
      public static function generateMusicPlaybackSummary(param1:String, param2:String) : String
      {
         return param2 + " (" + param1 + ")";
      }
      
      public static function musicUrlFromMusicFileName(param1:String) : String
      {
         return musicUrlPrefix + param1;
      }
   }
}
