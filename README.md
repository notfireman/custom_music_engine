# custom_music_engine
A custom music engine ready to be copied and used where you can add your audios in Studio, and then load them in Roblox for usage in games like Obby Creator. 

# Setup Guide (will be redone)
Thank you for using my custom music engine. 
This script details how to set it up, 
mainly broken down to 2 steps.

--

1. Prepare the Game
Publish the game first to access Asset Manager, 
copy the following for the game title and desc:

~~
Title: 
[project name] Music Engine

Description:
This is a custom music engine for my project, [project name].

Game originally made by ImNotFireMan123
https://www.roblox.com/games/13940978880/Custom-Music-Engine
~~

PS: You are required to have the 
"Game originally made by ImNotFireMan123
https://www.roblox.com/games/13940978880/Custom-Music-Engine"
in your description for attribution.

Now, go to ReplicatedStorage and open the "Info" ModuleScript.
Find line 3, and change the value in the quotes to your project name, 
it should look like this:
info.projectname = "My Awesome Obby"

--

2. Upload Your Audios
This should be simple enough.
Gather all your audios as mp3 or ogg files and upload them either to your account or the game. 
Its recommeneded to upload it to your account if you can as uploading it via the game messes up with the naming 
(it appends Audios/ to your audio name, which may not look good when played in games like Obby Creator, and as such you have to change it afterwards.)

Now, go to ReplicatedStorage and open the "Info" ModuleScript.

Find the info.playlists variable, it shoudl look like this:
-- PLAYLISTS
info.playlists = {
  { -- This is a playlist
    name = "Testing Playlist",
    songs = {
      "rbxassetid://13940982613", -- This is a song
    }
  },
}

Quick explanation time:
info.playlists is a list of all the playlists in the music engine.
A playlist is basically a list of songs.
For example, a project like Shattered Worlds: Remastered would have a playlist for each worlds
To add a new playlist, copy this line of code:
{
  name = "Testing Playlist",
  songs = {
    "rbxassetid://13940982613", -- This is a song
  }
},
and append it below the previous playlist, like this:
-- PLAYLISTS
info.playlists = {
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
Change the "name" variable to something fitting
To add a song, cdelete the example song and press enter,
Type double quote ("), followed by rbxassetid://, and then your music id, then another double quote, and a comma.
Repeat for how many songs you have.

And thats it!
It should work right out of the box. Publish the game and 
set the game to public to give it a try.

If you want to customize even more, the same "Info" ModuleScript has a theming section which you can theme the engine.
I hope you found this helpful.
	
