# BuggAddon

Don't you just hate when people `/spit` on you **ONLY** because you chose to buy the TBC Deluxe Edition?<br /><br />
This Addon sure will teach these kids how to behave.

## How to install
1. Click the "Code" button & select "Download ZIP"
2. Extract the folder to your `Interface/AddOns` folder
3. Rename the extracted folder to `BuggAddon`

BuggAddon should now be visible in your in-game AddOn list. You can view this by "Esc" -> "AddOns".
## Features

 - [Spit Protection](#spit-protection)
 - [Dungeon Roulette](#dungeon-roulette)
 - [Commands](#commands)

### Spit Protection
#### Add your own emotes
You can edit or add your own emotes that will be triggered whenever some n00b `/spit` on you.
* Open `buggaddon.lua` with any text editor (eg. Notepad)
* Add your prefered comeback to the list of strings

```
Strings containing the word "name" will be replaced with the player's name who /spit on you
```

##### Examples
buggaddon.lua | In-game emote
--------------|--------------
"balls so hard." | "Buggorm balls so hard."
"LOLOLOLOLs at name." | "Buggorm LOLOLOLOLs at Vale."
"is sorry to hear about name's genital warts." | "Buggorm is sorry to hear about Vale's genital warts."
### Dungeon roulette
Whenever somebody `/question` you, you will respond with a random dungeon. (Only Outland dungeons)
#### Example
```
Vale questions you.
Buggorm suggests The Black Morass.
```
### Commands

Command   | Action | Example | Output
-- | -- | -- | --
`i` or `item` | Whisper a search link for the item to yourself |`/bugg i black lotus` | https://tbc.wowhead.com/search?q=black+lotus
| | | `/bugg item blinkstrike` | https://tbc.wowhead.com/search?q=blinkstrike
`a` or `achievement` | Bloats the guild chat with a random achievement message in french | `/bugg a` |  [Guild][Buggorm]: Je viens d'obtenir le haut fait [ClassicAchievements:-fLi:ynkiDOYh:Fu-v4lE:wFcC]
| | | `/bugg achievement` | [Guild][Buggorm]: Je viens d'obtenir le haut fait [ClassicAchievements:RfLi7ynkiDvYh:fU-V4Le:Kup9]
`m` or `macro` | Creates a macro | `/bugg m dance /dance` | Creates a macro called "dance" with the content `/dance`
| | | `/bugg macro tarmob /tar onyxia` | Creates a macro called "tarmob" with the content `/tar onyxia`


