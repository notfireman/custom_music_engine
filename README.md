# Setup Guide
First and foremost: thank you for using my custom music engine! If you want to support me, please like the original game and if possible, buy the Tip gamepass. It keeps me motivated and allows me to create awesome stuff for the Obby Creator community to enjoy.

With that out of the way... here’s how to set up the Custom Music Engine. 
## Step 1: Prepare the Game
In the top left corner of Studio, click "File", find "Publish to Roblox" and click it.

Give the game a good title like: `SW:R Music Engine`

For the description, you can copy this and fill in the blanks:
```
This is a custom music engine for my project [PROJECT NAME HERE].

Game originally made by ImNotFireMan123:
https://www.roblox.com/games/13940978880/
```
> ⚠️ You are required to have the `Game originally made by ImNotFireMan123: https://www.roblox.com/games/13940978880/` for attribution. If you can't write `Game originally made by ImNotFireMan123`, writing `Game originally made by Fire` is acceptable.

Once you published the game, open https://create.roblox.com/dashboard, and click on the game you just published.

From the Sidebar, find "Access", scroll down until you find "Privacy" and choose Public. Click "Save Changes"

<img width="762" alt="Access2" src="https://github.com/fire-luau/custom_music_engine/assets/107028394/6c3dec93-bc11-46ee-be3d-659858148fbf">

From the Sidebar, find "Places" and click on the place with the same game name. It should say "Start Place" below it. 

Continuing from that, find "Access" from the Sidebar, find "Maximum Vistor Count" and change it to a number between 1 to 8. Click "Save Changes".

<img width="762" alt="Access" src="https://github.com/fire-luau/custom_music_engine/assets/107028394/b64becf0-7c3c-4ced-859a-43c2adc508cd">

Now, go to ReplicatedStorage and open the "Data" ModuleScript. Find `data.projectname`, and change the value in the quotes to your project name. It should look like this:
```lua
data.projectname = "My Awesome Obby"
```
Find `data.promptGame` and if needed change the value in the quotes to whatever game your creation belongs (ie. Obby Creator, Blockate, Tower Creator). which should look like this:
```lua
data.promptGame = "Obby Creator"
```

And that’s it for step 1. You're ready!
## Step 2: Adding the Audios & Playlists
This should be simple enough. 

Gather all your audios as mp3 or ogg files and upload them either to your account or the game. 

It's recommended to upload it directly to the game using Asset Manager. This way, the audio already has access to the game. The only caveat is that Roblox appends "Audios/" to the name, which you'll have to remove later on.

⚠️ If you happen to upload it via your account, be sure to give each audio access to the game. You can do this by going to https://create.roblox.com/dashboard `> Development Items > Audios > Your audio file`, click it, find "Experiences with Access" and enter your UniverseId from there.
<img width="762" alt="Screen Shot 2023-07-05 at 12 29 28 PM" src="https://github.com/fire-luau/custom_music_engine/assets/107028394/a68433b6-7599-4a76-82a8-332edc39d786">
⚠️ If you don't do this, the playlist won't finish loading and will throw an error.

Now, go to ReplicatedStorage and open the "Data" ModuleScript.

Find the `data.playlists` variable, it should look like this:
```lua
data.playlists = {
  { -- This is a playlist
    name = "Testing Playlist",
    songs = {
      "rbxassetid://13940982613", -- This is a song
    }
  },
}
```
Quick explanation time:

data.playlists is a list of all the playlists in the music engine. A playlist is basically a list of songs. 

For example, a project like Shattered Worlds: Remastered would have a playlist for each worlds 

To add a new playlist, copy this line of code:

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

Change the `name` variable to something fitting

To add a song, cdelete the example song and press enter.

Type double quote ("), followed by rbxassetid://, and then your music id, then another double quote, and a comma.

Repeat for how many songs you have.

And thats it! It should work right out of the box. Publish the game and set the game to public to give it a try.
Before you stop reading, there some other stuff you have to keep in mind.

## 3. Additional stuff

The "Data" ModuleScript has a theming section where you can theme the interface if required, Simply change the Color3 values for something else. 

⚠️ You also need to inform the player to join the game, load a playlist, and then rejoin Obby Creator. You can follow what I did for my tower game here: https://create.roblox.com/marketplace/asset/13953517367. Notice how I left a gap for the link, adding links in the decal *might* get you into trouble, but Obby Creator doesn't tag links in Text Effects, so I just added a Text effect with the link.

# Update Guide
This guide presumes you are updating from version 1.1 to version 2.0, you can check that in the Data ModuleScript and find the `data.engineVer` variable.

Open StarterGui in your 1.1 version and delete the LocalScript and the ScreenGui called "Main". Copy the new LocalScript and Main ScreenGui from the 2.0 game to your game.

Rename your old Data ModuleScript to something like DataOld. Copy the new 2.0 Data script to your game and place it in ReplicatedStorage.

You can copy over most stuff from the 1.1 DataOld script to the 2.0 Data script, but some things to keep in mind:
- In 2.0, the old `bg2` theme variable is now removed and the `bg3` variable has been renamed to `bg2`.
- A new boast of `nav` and `navIcon` related theming variables has been added. Simply copy them over, change `navbg` to your old `bg2` variable.
- Your playlist stays the same. Just copy them over to the new 2.0 Data script and it should work like a charm.
