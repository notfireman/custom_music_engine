# custom_music_engine
A custom music engine ready to be copied and used where you can add your audios in Studio, and then load them in Roblox for usage in games like Obby Creator. 

# Setup Guide
Thank you for using my custom music engine! This script details how to set it up, as well other stuff to keep in mind.
---
# 1. Prepare the Game
Publish the game first to access Asset Manager, and copy the following for the game title and description:
```
Title: 
[project name] Music Engine

Description:
This is a custom music engine for my project, [project name].

Game originally made by ImNotFireMan123
https://www.roblox.com/games/13940978880/Custom-Music-Engine
```

⚠️ PS: You are required to have the 
```
"Game originally made by ImNotFireMan123
https://www.roblox.com/games/13940978880/Custom-Music-Engine"
in your description for attribution.
```
Now, go to ReplicatedStorage and open the "Info" ModuleScript. Find line 3, and change the value in the quotes to your project name. It should look like this:
```lua
info.projectname = "My Awesome Obby"
```
Find line 9, and if needed change the value in the quotes to whatever game your creation belongs (ie. Obby Creator, Blockate, Tower Creator). which should look like this:
```lua
info.promptGame = "Obby Creator"
```
---
# 2. Upload Your Audios
This should be simple enough. Gather all your audios as mp3 or ogg files and upload them either to your account or the game. Its recommeneded to upload it to your account if you can as uploading it via the game messes up with the naming (it appends Audios/ to your audio name, which may not look good when played in games like Obby Creator, and as such you have to change it afterwards.)

⚠️ If you happen to upload it via your account, be sure to provide the UniverseId for each audios. If you don't do this, the playlist fails to load.

Now, go to ReplicatedStorage and open the "Data" ModuleScript.

Find the data.playlists variable, it should look like this:
```lua
info.playlists = {
  { -- This is a playlist
    name = "Testing Playlist",
    songs = {
      "rbxassetid://13940982613", -- This is a song
    }
  },
}
```

Quick explanation time:
data.playlists is a list of all the playlists in the music engine. A playlist is basically a list of songs. For example, a project like Shattered Worlds: Remastered would have a playlist for each worlds To add a new playlist, copy this line of code:
```lua
{
  name = "Testing Playlist",
  songs = {
    "rbxassetid://13940982613", -- This is a song
  }
},
```
and append it below the previous playlist, like this:
```
data.playlists = {
  { -- This is a playlist
    name = "Testing Playlist",
    songs = {
      "rbxassetid://13940982613", -- This is a song
    }
  },
  { -- This is a playlist
    name = "Testing Playlist",
    songs = {
      "rbxassetid://13940982613", -- This is a song
    }
  },
}
```
Change the "name" variable to something fitting
To add a song, cdelete the example song and press enter,Type double quote ("), followed by rbxassetid://, and then your music id, then another double quote, and a comma.Repeat for how many songs you have.

And thats it! It should work right out of the box. Publish the game and set the game to public to give it a try.
Before you stop reading, there some other info you have to keep in mind.

# 3. Additional stuff
The "Data" ModuleScript has a theming section where you can theme the interface if required, Simply change the Color3 values for something else. For now, you have to change the font for each TextLabel individually, I plan to add a better solution to this in v1.2.
⚠️ You also need to inform the player to join the game, load a playlist, and then rejoin Obby Creator. I have not made a decal template yet, but you can just add in some signs in this order:
```
URGENT: To load music, join the games Music Engine and load this playlist: [playlist name]. You can join the game here:

[add a sign with a link to your music engine, roblox.com links don't tag]
```
	
